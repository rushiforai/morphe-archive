.class public Ll/o410;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g510$a;
.implements Ll/q210$a;
.implements Ll/dpl$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/o410$c;,
        Ll/o410$d;,
        Ll/o410$g;,
        Ll/o410$f;,
        Ll/o410$e;
    }
.end annotation


# static fields
.field private static B:Z


# instance fields
.field private A:Ll/o410$f;

.field private a:Z

.field private b:Ll/wej;

.field private c:Z

.field private d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/pipline/MomoInterface/MomoCodec;",
            ">;"
        }
    .end annotation
.end field

.field protected e:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/wje;",
            ">;"
        }
    .end annotation
.end field

.field protected f:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/g510;",
            ">;"
        }
    .end annotation
.end field

.field protected g:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/wej;",
            ">;"
        }
    .end annotation
.end field

.field protected h:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;>;"
        }
    .end annotation
.end field

.field protected i:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;>;"
        }
    .end annotation
.end field

.field protected j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ll/wej;",
            ">;>;"
        }
    .end annotation
.end field

.field protected k:Ll/g510;

.field private l:Landroid/os/HandlerThread;

.field private m:Ll/o410$c;

.field private n:Landroid/os/HandlerThread;

.field private o:Ll/a410;

.field private p:Ll/o410$g;

.field private q:Ll/o410$d;

.field private r:Ll/o410$e;

.field private s:Ll/wje;

.field private t:Ljava/lang/Object;

.field private u:Ljava/lang/Object;

.field v:Ll/fb1;

.field private w:Ljava/lang/Object;

.field private x:Ljava/lang/Object;

.field public y:Ll/suf;

.field public z:Ll/suf;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Ll/o410;->K()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x17

    .line 6
    .line 7
    if-ge v0, v1, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    sput-boolean v0, Ll/o410;->B:Z

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/l26;->a:Landroid/content/Context;

    .line 13
    .line 14
    const-string v1, "mmcrypto"

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object v0, Ll/l26;->a:Landroid/content/Context;

    .line 20
    .line 21
    const-string v1, "mmssl"

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sget-object v0, Ll/l26;->a:Landroid/content/Context;

    .line 27
    .line 28
    const-string v1, "cosmosffmpeg"

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sget-object v0, Ll/l26;->a:Landroid/content/Context;

    .line 34
    .line 35
    const-string v1, "ijklivesdl"

    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sget-object v0, Ll/l26;->a:Landroid/content/Context;

    .line 41
    .line 42
    const-string v1, "ijkstreamer"

    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sget-object v0, Ll/l26;->a:Landroid/content/Context;

    .line 48
    .line 49
    const-string v1, "congressUtil"

    .line 50
    .line 51
    invoke-static {v0, v1}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    sget-object v0, Ll/l26;->a:Landroid/content/Context;

    .line 55
    .line 56
    const-string v1, "apm-congressRender"

    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/ylc0;->a(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :catch_0
    move-exception v0

    .line 63
    invoke-static {v0}, Lcom/core/glcore/util/Log4Cam;->printStackTrace(Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :catch_1
    move-exception v0

    .line 68
    invoke-static {v0}, Lcom/core/glcore/util/Log4Cam;->printStackTrace(Ljava/lang/Throwable;)V

    .line 69
    .line 70
    .line 71
    :goto_0
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/o410;->c:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Ll/o410;->s:Ll/wje;

    .line 9
    .line 10
    new-instance v1, Ljava/lang/Object;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Ll/o410;->t:Ljava/lang/Object;

    .line 16
    .line 17
    new-instance v1, Ljava/lang/Object;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Ll/o410;->w:Ljava/lang/Object;

    .line 23
    .line 24
    new-instance v1, Ljava/lang/Object;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Ll/o410;->x:Ljava/lang/Object;

    .line 30
    .line 31
    iput-boolean v0, p0, Ll/o410;->a:Z

    .line 32
    .line 33
    new-instance v0, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Ll/o410;->d:Ljava/util/List;

    .line 39
    .line 40
    new-instance v0, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 41
    .line 42
    invoke-direct {v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Ll/o410;->f:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 46
    .line 47
    new-instance v0, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 48
    .line 49
    invoke-direct {v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Ll/o410;->g:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 53
    .line 54
    new-instance v0, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 55
    .line 56
    invoke-direct {v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Ll/o410;->h:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 60
    .line 61
    new-instance v0, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 62
    .line 63
    invoke-direct {v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Ll/o410;->i:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 67
    .line 68
    new-instance v0, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 69
    .line 70
    invoke-direct {v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Ll/o410;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 74
    .line 75
    new-instance v0, Landroid/os/HandlerThread;

    .line 76
    .line 77
    const-string v1, "RecordingEventHandle"

    .line 78
    .line 79
    const/16 v2, 0x13

    .line 80
    .line 81
    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 82
    .line 83
    .line 84
    iput-object v0, p0, Ll/o410;->n:Landroid/os/HandlerThread;

    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 87
    .line 88
    .line 89
    new-instance v0, Landroid/os/HandlerThread;

    .line 90
    .line 91
    const-string v1, "RecordingCmdHandle"

    .line 92
    .line 93
    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 94
    .line 95
    .line 96
    iput-object v0, p0, Ll/o410;->l:Landroid/os/HandlerThread;

    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/o410;->l:Landroid/os/HandlerThread;

    .line 102
    .line 103
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    new-instance v1, Ll/o410$c;

    .line 108
    .line 109
    invoke-direct {v1, p0, p0, v0}, Ll/o410$c;-><init>(Ll/o410;Ll/o410;Landroid/os/Looper;)V

    .line 110
    .line 111
    .line 112
    iput-object v1, p0, Ll/o410;->m:Ll/o410$c;

    .line 113
    .line 114
    iget-object v0, p0, Ll/o410;->n:Landroid/os/HandlerThread;

    .line 115
    .line 116
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    new-instance v1, Ll/a410;

    .line 121
    .line 122
    invoke-direct {v1, v0}, Ll/a410;-><init>(Landroid/os/Looper;)V

    .line 123
    .line 124
    .line 125
    iput-object v1, p0, Ll/o410;->o:Ll/a410;

    .line 126
    .line 127
    invoke-static {v1}, Ll/b410;->b(Ll/a410;)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public static K()I
    .locals 1

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    return v0
.end method

.method private f0(Ll/uow;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/o410;->w:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/o410;->d:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-lez v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ll/o410;->d:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    invoke-interface {v2, p1, v3}, Lcom/momo/pipline/MomoInterface/MomoCodec;->l0(Ll/uow;Landroid/opengl/EGLContext;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    iget-object p0, p0, Ll/o410;->k:Ll/g510;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/g510;->L()V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void

    .line 46
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    throw p0
.end method

.method private g0(Ll/uow;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/o410;->w:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/o410;->d:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-lez v1, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    new-instance v2, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v3, " startRecord_l momoCodecList.size()"

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    iget-object v3, p0, Ll/o410;->d:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v1, v2}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Ll/o410;->d:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz v2, :cond_0

    .line 64
    .line 65
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    check-cast v2, Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 70
    .line 71
    const/4 v3, 0x0

    .line 72
    invoke-interface {v2, p1, v3}, Lcom/momo/pipline/MomoInterface/MomoCodec;->R0(Ll/uow;Landroid/opengl/EGLContext;)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :catchall_0
    move-exception p0

    .line 77
    goto :goto_1

    .line 78
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    iget-object p0, p0, Ll/o410;->k:Ll/g510;

    .line 80
    .line 81
    if-eqz p0, :cond_1

    .line 82
    .line 83
    invoke-virtual {p0}, Ll/g510;->L()V

    .line 84
    .line 85
    .line 86
    :cond_1
    return-void

    .line 87
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 88
    throw p0
.end method

.method private j0(Lcom/momo/pipline/MomoInterface/MomoCodec;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->C0()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method private o0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/o410;->k:Ll/g510;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/g510;->O()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/o410;->w:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object v1, p0, Ll/o410;->d:Ljava/util/List;

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-lez v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Ll/o410;->d:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 38
    .line 39
    invoke-interface {v2}, Lcom/momo/pipline/MomoInterface/MomoCodec;->f()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    const/16 v1, 0x4001

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    invoke-virtual {p0, v1, v2, v2, p0}, Ll/o410;->g(IIILjava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    iget-object p0, p0, Ll/o410;->d:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 54
    .line 55
    .line 56
    monitor-exit v0

    .line 57
    return-void

    .line 58
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    throw p0
.end method

.method private t()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o410;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/o410;->d:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 26
    .line 27
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoCodec;->o()V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method

.method public static synthetic u(Ll/o410;Ll/uow;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/o410;->g0(Ll/uow;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v(Ll/o410;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o410;->o0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic w(Ll/o410;Ll/uow;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/o410;->f0(Ll/uow;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Ll/o410;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o410;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y(Ll/o410;)Ll/o410$d;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o410;->q:Ll/o410$d;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public A(Ll/wej;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/o410$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Ll/o410$a;-><init>(Ll/o410;Ljava/lang/String;Ll/wej;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0, p2}, Ll/o410;->W(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public declared-synchronized B(Ll/wej;)V
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Ljava/util/LinkedList;

    .line 3
    .line 4
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 5
    .line 6
    .line 7
    new-instance v1, Ljava/util/LinkedList;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/o410;->I(Ll/wej;)Ll/g510;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iget-object v3, p0, Ll/o410;->b:Ll/wej;

    .line 17
    .line 18
    if-nez v3, :cond_0

    .line 19
    .line 20
    iput-object v2, p0, Ll/o410;->k:Ll/g510;

    .line 21
    .line 22
    iput-object p1, p0, Ll/o410;->b:Ll/wej;

    .line 23
    .line 24
    iget-object v3, p0, Ll/o410;->f:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    iget-object v5, p0, Ll/o410;->k:Ll/g510;

    .line 31
    .line 32
    invoke-virtual {v3, v4, v5}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    iget-object v3, p0, Ll/o410;->f:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 39
    .line 40
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v3, v4, v2}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    :goto_0
    invoke-virtual {v2, p0}, Ll/g510;->J(Ll/g510$a;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v2, v3}, Ll/g510;->K(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object v2, p0, Ll/o410;->g:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 58
    .line 59
    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    :try_start_1
    iget-object v3, p0, Ll/o410;->g:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    invoke-virtual {v3, v4, p1}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 70
    :try_start_2
    iget-object v2, p0, Ll/o410;->i:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 71
    .line 72
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v2, v3, v1}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Ll/o410;->h:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 80
    .line 81
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual {v1, v2, v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/o410;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 89
    .line 90
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    new-instance v1, Ljava/util/ArrayList;

    .line 95
    .line 96
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, p1, v1}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 100
    .line 101
    .line 102
    monitor-exit p0

    .line 103
    return-void

    .line 104
    :catchall_1
    move-exception p1

    .line 105
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 106
    :try_start_4
    throw p1

    .line 107
    :goto_1
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 108
    throw p1
.end method

.method public C(Ll/oxd0;)Ll/oxd0;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/o410;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/o410;->v:Ll/fb1;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {v0, p1}, Ll/fb1;->C(Ll/oxd0;)Ll/oxd0;

    .line 14
    .line 15
    .line 16
    return-object p1

    .line 17
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    iget-object v1, p0, Ll/o410;->d:Ljava/util/List;

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 22
    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 39
    .line 40
    iget-boolean v2, p0, Ll/o410;->a:Z

    .line 41
    .line 42
    const/4 v3, 0x1

    .line 43
    if-ne v2, v3, :cond_1

    .line 44
    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    invoke-interface {v1, p1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->K1(Ll/oxd0;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    return-object p1
.end method

.method public D(Ll/g510;Lcom/momo/pipline/MomoInterface/MomoCodec;Ll/uow;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o410;->w:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p1, p2}, Ll/g510;->h(Lcom/momo/pipline/MomoInterface/MomoCodec;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/o410;->d:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    invoke-virtual {p0, p3}, Ll/o410;->d0(Ll/uow;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw p0
.end method

.method public declared-synchronized E(Ll/wej;)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0, p1}, Ll/o410;->I(Ll/wej;)Ll/g510;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {v0, p0}, Ll/g510;->J(Ll/g510$a;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/o410;->b:Ll/wej;

    .line 10
    .line 11
    iput-object v0, p0, Ll/o410;->k:Ll/g510;

    .line 12
    .line 13
    iget-object v1, p0, Ll/o410;->f:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object v3, p0, Ll/o410;->k:Ll/g510;

    .line 20
    .line 21
    invoke-virtual {v1, v2, v3}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ll/g510;->K(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/o410;->g:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ll/wej;

    .line 42
    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    iget-object v0, p0, Ll/o410;->g:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1, p1}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    new-instance v0, Ljava/util/LinkedList;

    .line 55
    .line 56
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 57
    .line 58
    .line 59
    new-instance v1, Ljava/util/LinkedList;

    .line 60
    .line 61
    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Ll/o410;->i:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-virtual {v2, v3, v1}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Ll/o410;->h:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 74
    .line 75
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {v1, p1, v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :catchall_0
    move-exception p1

    .line 84
    goto :goto_1

    .line 85
    :cond_0
    :goto_0
    monitor-exit p0

    .line 86
    return-void

    .line 87
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 88
    throw p1
.end method

.method public F(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o410;->h:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/Queue;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    monitor-enter p0

    .line 12
    :try_start_0
    invoke-interface {p0}, Ljava/util/Collection;->clear()V

    .line 13
    .line 14
    .line 15
    monitor-exit p0

    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception p1

    .line 18
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p1

    .line 20
    :cond_0
    return-void
.end method

.method public G()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/o410;->f:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/AbstractMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ll/g510;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/g510;->j()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object v0, p0, Ll/o410;->w:Ljava/lang/Object;

    .line 28
    .line 29
    monitor-enter v0

    .line 30
    :try_start_0
    iget-object v1, p0, Ll/o410;->d:Ljava/util/List;

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-lez v1, :cond_1

    .line 39
    .line 40
    iget-object v1, p0, Ll/o410;->d:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_1

    .line 51
    .line 52
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 57
    .line 58
    invoke-interface {v2}, Lcom/momo/pipline/MomoInterface/MomoCodec;->f()V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :catchall_0
    move-exception p0

    .line 63
    goto :goto_2

    .line 64
    :cond_1
    iget-object v1, p0, Ll/o410;->d:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 67
    .line 68
    .line 69
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    const/4 v0, 0x0

    .line 71
    invoke-static {v0}, Ll/b410;->b(Ll/a410;)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Ll/o410;->n:Landroid/os/HandlerThread;

    .line 75
    .line 76
    if-eqz v1, :cond_3

    .line 77
    .line 78
    iget-object v1, p0, Ll/o410;->o:Ll/a410;

    .line 79
    .line 80
    if-eqz v1, :cond_2

    .line 81
    .line 82
    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    :cond_2
    iget-object v1, p0, Ll/o410;->n:Landroid/os/HandlerThread;

    .line 86
    .line 87
    invoke-virtual {v1}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 88
    .line 89
    .line 90
    :cond_3
    iget-object v1, p0, Ll/o410;->l:Landroid/os/HandlerThread;

    .line 91
    .line 92
    if-eqz v1, :cond_5

    .line 93
    .line 94
    iget-object v1, p0, Ll/o410;->m:Ll/o410$c;

    .line 95
    .line 96
    if-eqz v1, :cond_4

    .line 97
    .line 98
    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    :cond_4
    iget-object v0, p0, Ll/o410;->l:Landroid/os/HandlerThread;

    .line 102
    .line 103
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 104
    .line 105
    .line 106
    :cond_5
    iget-object p0, p0, Ll/o410;->f:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 107
    .line 108
    invoke-virtual {p0}, Ljava/util/AbstractMap;->clear()V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :goto_2
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 113
    throw p0
.end method

.method public H()Ll/a410;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o410;->o:Ll/a410;

    .line 2
    .line 3
    return-object p0
.end method

.method public I(Ll/wej;)Ll/g510;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o410;->f:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/g510;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Ll/g510;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/g510;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ll/g510;->J(Ll/g510$a;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ll/g510;->K(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/o410;->f:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1, v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    :cond_0
    return-object v0
.end method

.method public J()Ll/g510;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o410;->k:Ll/g510;

    .line 2
    .line 3
    return-object p0
.end method

.method public L()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/o410;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public declared-synchronized M()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput-boolean v0, p0, Ll/o410;->a:Z

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Ll/o410;->u:Ljava/lang/Object;

    .line 7
    .line 8
    iget-object v0, p0, Ll/o410;->f:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/AbstractMap;->values()Ljava/util/Collection;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Ll/g510;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/g510;->t()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception v0

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    monitor-exit p0

    .line 37
    return-void

    .line 38
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    throw v0
.end method

.method public N()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o410;->g:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/o410;->k:Ll/g510;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/g510;->M()V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method

.method public O(Ll/g510;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o410;->k:Ll/g510;

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Ll/o410;->w:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter p1

    .line 8
    :try_start_0
    invoke-virtual {p0}, Ll/o410;->m()Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/util/AbstractMap;->values()Ljava/util/Collection;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ll/wje;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/wje;->j()V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception p0

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    invoke-virtual {p0}, Ll/o410;->m()Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ljava/util/AbstractMap;->clear()V

    .line 43
    .line 44
    .line 45
    monitor-exit p1

    .line 46
    return-void

    .line 47
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    throw p0

    .line 49
    :cond_1
    return-void
.end method

.method public P(Lcom/momo/pipline/MomoInterface/MomoCodec;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o410;->w:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/o410;->d:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/o410;->k:Ll/g510;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/g510;->y(Lcom/momo/pipline/MomoInterface/MomoCodec;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    monitor-exit v0

    .line 20
    return-void

    .line 21
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p0
.end method

.method public declared-synchronized Q(Ljava/lang/Object;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    :try_start_0
    iput-boolean v0, p0, Ll/o410;->a:Z

    .line 4
    .line 5
    iput-object p1, p0, Ll/o410;->u:Ljava/lang/Object;

    .line 6
    .line 7
    iget-object p1, p0, Ll/o410;->f:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/util/AbstractMap;->values()Ljava/util/Collection;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ll/g510;

    .line 28
    .line 29
    iget-object v1, p0, Ll/o410;->k:Ll/g510;

    .line 30
    .line 31
    if-ne v0, v1, :cond_1

    .line 32
    .line 33
    iget-object v1, p0, Ll/o410;->u:Ljava/lang/Object;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/g510;->F(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p1

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    invoke-virtual {v0}, Ll/g510;->n()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_0

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-virtual {v0, v1}, Ll/g510;->F(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    monitor-exit p0

    .line 53
    return-void

    .line 54
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    throw p1
.end method

.method public declared-synchronized R(Ljava/lang/Object;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    :try_start_0
    iput-boolean v0, p0, Ll/o410;->a:Z

    .line 4
    .line 5
    iput-object p1, p0, Ll/o410;->u:Ljava/lang/Object;

    .line 6
    .line 7
    iget-object p1, p0, Ll/o410;->f:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/util/AbstractMap;->values()Ljava/util/Collection;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ll/g510;

    .line 28
    .line 29
    iget-object v1, p0, Ll/o410;->k:Ll/g510;

    .line 30
    .line 31
    if-ne v0, v1, :cond_1

    .line 32
    .line 33
    iget-object v1, p0, Ll/o410;->u:Ljava/lang/Object;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/g510;->G(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p1

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    invoke-virtual {v0}, Ll/g510;->n()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_0

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-virtual {v0, v1}, Ll/g510;->G(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    monitor-exit p0

    .line 53
    return-void

    .line 54
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    throw p1
.end method

.method public declared-synchronized S(Ljava/lang/Object;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    :try_start_0
    iput-boolean v0, p0, Ll/o410;->a:Z

    .line 4
    .line 5
    iput-object p1, p0, Ll/o410;->u:Ljava/lang/Object;

    .line 6
    .line 7
    iget-object p1, p0, Ll/o410;->f:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/util/AbstractMap;->values()Ljava/util/Collection;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ll/g510;

    .line 28
    .line 29
    iget-object v1, p0, Ll/o410;->k:Ll/g510;

    .line 30
    .line 31
    if-ne v0, v1, :cond_1

    .line 32
    .line 33
    iget-object v1, p0, Ll/o410;->u:Ljava/lang/Object;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/g510;->H(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p1

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    invoke-virtual {v0}, Ll/g510;->n()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_0

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-virtual {v0, v1}, Ll/g510;->H(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    monitor-exit p0

    .line 53
    return-void

    .line 54
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    throw p1
.end method

.method public T(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/o410;->h:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/Queue;

    .line 8
    .line 9
    if-eqz p0, :cond_2

    .line 10
    .line 11
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    :cond_0
    :goto_0
    :try_start_1
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/lang/Runnable;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception v0

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    monitor-exit p0

    .line 33
    return-void

    .line 34
    :goto_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    :try_start_2
    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 36
    :catch_0
    const-string p0, "lqdebug"

    .line 37
    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v1, "runAll: "

    .line 41
    .line 42
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method public U(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/o410;->i:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/Queue;

    .line 8
    .line 9
    if-eqz p0, :cond_2

    .line 10
    .line 11
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    :cond_0
    :goto_0
    :try_start_1
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/lang/Runnable;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception v0

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    monitor-exit p0

    .line 33
    return-void

    .line 34
    :goto_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    :try_start_2
    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 36
    :catch_0
    const-string p0, "MomoProcessingPipeline"

    .line 37
    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v1, "runAllEnd: "

    .line 41
    .line 42
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method public V(Ljava/lang/Runnable;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o410;->h:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/Queue;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public W(Ljava/lang/Runnable;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o410;->i:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/Queue;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public X(Ll/fb1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o410;->v:Ll/fb1;

    .line 2
    .line 3
    return-void
.end method

.method public Y(Ll/o410$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o410;->q:Ll/o410$d;

    .line 2
    .line 3
    return-void
.end method

.method public Z(Ll/o410$e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o410;->r:Ll/o410$e;

    .line 2
    .line 3
    return-void
.end method

.method public a()Ll/wje;
    .locals 5

    .line 1
    const-string v0, "getDummyScreen:"

    .line 2
    .line 3
    iget-object v1, p0, Ll/o410;->t:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object v2, p0, Ll/o410;->s:Ll/wje;

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    new-instance v2, Ll/wje;

    .line 11
    .line 12
    iget-boolean v3, p0, Ll/o410;->c:Z

    .line 13
    .line 14
    invoke-direct {v2, v3}, Ll/wje;-><init>(Z)V

    .line 15
    .line 16
    .line 17
    iput-object v2, p0, Ll/o410;->s:Ll/wje;

    .line 18
    .line 19
    invoke-static {}, Ll/wje;->f()Landroid/opengl/EGLContext;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-object v3, p0, Ll/o410;->s:Ll/wje;

    .line 24
    .line 25
    invoke-virtual {v3, v2}, Ll/wje;->c(Landroid/opengl/EGLContext;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    goto :goto_1

    .line 31
    :catch_0
    move-exception v2

    .line 32
    :try_start_1
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    new-instance v4, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v3, v0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    :goto_0
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    iget-object p0, p0, Ll/o410;->s:Ll/wje;

    .line 61
    .line 62
    return-object p0

    .line 63
    :goto_1
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 64
    throw p0
.end method

.method public a0(Ll/suf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o410;->y:Ll/suf;

    .line 2
    .line 3
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/o410;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public b0(Ll/o410$f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o410;->A:Ll/o410$f;

    .line 2
    .line 3
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o410;->p:Ll/o410$g;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/o410$g;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c0(Ll/o410$g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o410;->p:Ll/o410$g;

    .line 2
    .line 3
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o410;->q:Ll/o410$d;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/o410$d;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d0(Ll/uow;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/o410;->m:Ll/o410$c;

    .line 2
    .line 3
    const/16 v1, 0x64

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/o410;->m:Ll/o410$c;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, v1, v2, v2, p1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Ll/o410;->m:Ll/o410$c;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public e(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/o410;->q:Ll/o410$d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "elgRenderSizewidth"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, "height"

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 32
    .line 33
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/o410;->q:Ll/o410$d;

    .line 37
    .line 38
    invoke-interface {p0, p1, p2}, Ll/o410$d;->d(II)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public e0(Ll/uow;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/o410;->m:Ll/o410$c;

    .line 2
    .line 3
    const/16 v1, 0xaa

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/o410;->m:Ll/o410$c;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, v1, v2, v2, p1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Ll/o410;->m:Ll/o410$c;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public f(Ll/g510;Ll/omw;)V
    .locals 10
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x12
    .end annotation

    .line 1
    iget-object p2, p0, Ll/o410;->k:Ll/g510;

    .line 2
    .line 3
    if-ne p2, p1, :cond_2

    .line 4
    .line 5
    iget-object p2, p0, Ll/o410;->w:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter p2

    .line 8
    :try_start_0
    iget-object v0, p0, Ll/o410;->d:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/o410;->m()Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v2, v3}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Ll/wje;

    .line 39
    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    invoke-virtual {v2}, Ll/wje;->i()Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_0

    .line 47
    .line 48
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 49
    .line 50
    .line 51
    move-result-wide v3

    .line 52
    invoke-interface {v1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->M1()V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 56
    .line 57
    .line 58
    move-result-wide v5

    .line 59
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    const-string v8, "Pipeline_Normal_pip->PIPLINE"

    .line 64
    .line 65
    new-instance v9, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .line 69
    .line 70
    sub-long/2addr v5, v3

    .line 71
    invoke-virtual {v9, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string v3, " 111111111111 "

    .line 75
    .line 76
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v3, " index "

    .line 91
    .line 92
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const/4 v3, 0x0

    .line 96
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    invoke-virtual {v7, v8, v4}, Ll/oq70;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v2}, Ll/wje;->l()V

    .line 107
    .line 108
    .line 109
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    const-string v4, "Pipeline_Normal_pip->PIPLINE"

    .line 114
    .line 115
    new-instance v7, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v7, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v5, " 222222222222 "

    .line 124
    .line 125
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v1, " index "

    .line 140
    .line 141
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-virtual {v2, v4, v1}, Ll/oq70;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :catchall_0
    move-exception p0

    .line 157
    goto :goto_1

    .line 158
    :cond_1
    monitor-exit p2

    .line 159
    goto :goto_2

    .line 160
    :goto_1
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    throw p0

    .line 162
    :cond_2
    :goto_2
    invoke-virtual {p1}, Ll/g510;->m()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-virtual {p0, p1}, Ll/o410;->U(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method public g(IIILjava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o410;->o:Ll/a410;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Ll/o410;->o:Ll/a410;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public h(Ll/g510;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o410;->k:Ll/g510;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/o410$b;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Ll/o410$b;-><init>(Ll/o410;Ll/g510;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ll/g510;->m()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, v0, p1}, Ll/o410;->V(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public declared-synchronized h0(Ljava/lang/Object;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/o410;->b:Ll/wej;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/o410;->a:Z

    .line 8
    .line 9
    iput-object p1, p0, Ll/o410;->u:Ljava/lang/Object;

    .line 10
    .line 11
    iget-object v0, p0, Ll/o410;->k:Ll/g510;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ll/g510;->N(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/o410;->k:Ll/g510;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/g510;->u()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    monitor-exit p0

    .line 25
    return-void

    .line 26
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    throw p1
.end method

.method public i()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o410;->w:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public i0(Lcom/momo/pipline/MomoInterface/MomoCodec;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->b0()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public j(Ll/g510;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o410;->k:Ll/g510;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/o410;->r:Ll/o410$e;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Ll/o410$e;->a()V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/sej;->d()Ll/sej;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ll/sej;->a()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public k(Ll/g510;)V
    .locals 8

    .line 1
    const-string v0, "mRootInputMap size"

    .line 2
    .line 3
    const-string v1, "Render to destory"

    .line 4
    .line 5
    const-string v2, "onDestory"

    .line 6
    .line 7
    iget-object v3, p0, Ll/o410;->g:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 8
    .line 9
    monitor-enter v3

    .line 10
    :try_start_0
    iget-object v4, p0, Ll/o410;->f:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/g510;->m()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v5

    .line 16
    invoke-virtual {v4, v5}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    check-cast v4, Ll/g510;

    .line 21
    .line 22
    if-nez v4, :cond_0

    .line 23
    .line 24
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    const-string v6, "Pipeline_Normal_pip->PIPLINE"

    .line 29
    .line 30
    new-instance v7, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v7, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v2, "bugs"

    .line 39
    .line 40
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v5, v6, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    goto/16 :goto_8

    .line 53
    .line 54
    :cond_0
    :goto_0
    iget-object v2, p0, Ll/o410;->g:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/g510;->m()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-virtual {v2, v4}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    check-cast v2, Ll/wej;

    .line 65
    .line 66
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    const-string v5, "Pipeline_Normal_pip->PIPLINE"

    .line 71
    .line 72
    new-instance v6, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v4, v5, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    if-eqz v2, :cond_1

    .line 88
    .line 89
    invoke-virtual {v2}, Ll/wej;->destroy()V

    .line 90
    .line 91
    .line 92
    :cond_1
    invoke-virtual {p1}, Ll/g510;->m()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {p0, v1}, Ll/o410;->U(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1}, Ll/g510;->m()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {p0, v1}, Ll/o410;->F(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-object v1, p0, Ll/o410;->i:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 107
    .line 108
    invoke-virtual {p1}, Ll/g510;->m()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-virtual {v1, v2}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    iget-object v1, p0, Ll/o410;->h:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 116
    .line 117
    invoke-virtual {p1}, Ll/g510;->m()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-virtual {v1, p1}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 129
    .line 130
    new-instance v2, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Ll/o410;->g:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 136
    .line 137
    invoke-virtual {v0}, Ljava/util/AbstractMap;->size()I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-virtual {p1, v1, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Ll/o410;->g:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 152
    .line 153
    invoke-virtual {p1}, Ljava/util/AbstractMap;->size()I

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    if-nez p1, :cond_5

    .line 158
    .line 159
    iget-object p1, p0, Ll/o410;->q:Ll/o410$d;

    .line 160
    .line 161
    if-eqz p1, :cond_2

    .line 162
    .line 163
    invoke-interface {p1}, Ll/o410$d;->c()V

    .line 164
    .line 165
    .line 166
    :cond_2
    iget-object p1, p0, Ll/o410;->w:Ljava/lang/Object;

    .line 167
    .line 168
    monitor-enter p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 169
    :try_start_1
    invoke-virtual {p0}, Ll/o410;->m()Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    const/4 v1, 0x0

    .line 174
    if-eqz v0, :cond_3

    .line 175
    .line 176
    invoke-virtual {p0}, Ll/o410;->m()Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-virtual {v0}, Ljava/util/AbstractMap;->values()Ljava/util/Collection;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 189
    .line 190
    .line 191
    move-result v2

    .line 192
    if-eqz v2, :cond_3

    .line 193
    .line 194
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    check-cast v2, Ll/wje;

    .line 199
    .line 200
    invoke-virtual {v2}, Ll/wje;->j()V

    .line 201
    .line 202
    .line 203
    iput-object v1, v2, Ll/wje;->c:Landroid/opengl/EGLContext;

    .line 204
    .line 205
    goto :goto_1

    .line 206
    :catchall_1
    move-exception p0

    .line 207
    goto :goto_4

    .line 208
    :cond_3
    iget-object v0, p0, Ll/o410;->e:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 209
    .line 210
    invoke-virtual {v0}, Ljava/util/AbstractMap;->clear()V

    .line 211
    .line 212
    .line 213
    iput-object v1, p0, Ll/o410;->e:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 214
    .line 215
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 216
    :try_start_2
    iput-object v1, p0, Ll/o410;->k:Ll/g510;

    .line 217
    .line 218
    iput-object v1, p0, Ll/o410;->b:Ll/wej;

    .line 219
    .line 220
    iget-object p1, p0, Ll/o410;->t:Ljava/lang/Object;

    .line 221
    .line 222
    monitor-enter p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 223
    :try_start_3
    iget-object v0, p0, Ll/o410;->s:Ll/wje;

    .line 224
    .line 225
    if-eqz v0, :cond_4

    .line 226
    .line 227
    invoke-virtual {v0}, Ll/wje;->j()V

    .line 228
    .line 229
    .line 230
    iput-object v1, p0, Ll/o410;->s:Ll/wje;

    .line 231
    .line 232
    goto :goto_2

    .line 233
    :catchall_2
    move-exception p0

    .line 234
    goto :goto_3

    .line 235
    :cond_4
    :goto_2
    monitor-exit p1

    .line 236
    goto :goto_5

    .line 237
    :goto_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 238
    :try_start_4
    throw p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 239
    :goto_4
    :try_start_5
    monitor-exit p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 240
    :try_start_6
    throw p0

    .line 241
    :cond_5
    :goto_5
    monitor-exit v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 242
    iget-object p1, p0, Ll/o410;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 243
    .line 244
    monitor-enter p1

    .line 245
    :try_start_7
    iget-object v0, p0, Ll/o410;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 246
    .line 247
    invoke-virtual {v0}, Ljava/util/AbstractMap;->values()Ljava/util/Collection;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 256
    .line 257
    .line 258
    move-result v1

    .line 259
    if-eqz v1, :cond_8

    .line 260
    .line 261
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    check-cast v1, Ljava/util/List;

    .line 266
    .line 267
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 268
    .line 269
    .line 270
    move-result-object v1

    .line 271
    :cond_7
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 272
    .line 273
    .line 274
    move-result v2

    .line 275
    if-eqz v2, :cond_6

    .line 276
    .line 277
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object v2

    .line 281
    check-cast v2, Ll/wej;

    .line 282
    .line 283
    if-eqz v2, :cond_7

    .line 284
    .line 285
    invoke-virtual {v2}, Ll/wej;->destroy()V

    .line 286
    .line 287
    .line 288
    goto :goto_6

    .line 289
    :catchall_3
    move-exception p0

    .line 290
    goto :goto_7

    .line 291
    :cond_8
    iget-object p0, p0, Ll/o410;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 292
    .line 293
    invoke-virtual {p0}, Ljava/util/AbstractMap;->clear()V

    .line 294
    .line 295
    .line 296
    monitor-exit p1

    .line 297
    return-void

    .line 298
    :goto_7
    monitor-exit p1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 299
    throw p0

    .line 300
    :goto_8
    :try_start_8
    monitor-exit v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 301
    throw p0
.end method

.method public k0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/o410;->m:Ll/o410$c;

    .line 2
    .line 3
    const/16 v1, 0x65

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/o410;->m:Ll/o410$c;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-virtual {v0, v1, v2, v2, v3}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object p0, p0, Ll/o410;->m:Ll/o410$c;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public l(Ll/wje;Ll/g510;Ll/omw;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ll/g510;->m()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/o410;->T(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/sej;->d()Ll/sej;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ll/sej;->e()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-static {}, Ll/sej;->d()Ll/sej;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ll/sej;->a()V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/sej;->d()Ll/sej;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p1, v0}, Ll/sej;->f(Z)V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0}, Ll/o410;->L()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_5

    .line 38
    .line 39
    iget-object p1, p0, Ll/o410;->y:Ll/suf;

    .line 40
    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    if-eqz p3, :cond_1

    .line 44
    .line 45
    invoke-interface {p1, p3}, Ll/suf;->setMMCVInfo(Ll/omw;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object p1, p0, Ll/o410;->z:Ll/suf;

    .line 49
    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    if-eqz p3, :cond_2

    .line 53
    .line 54
    invoke-interface {p1, p3}, Ll/suf;->setMMCVInfo(Ll/omw;)V

    .line 55
    .line 56
    .line 57
    :cond_2
    iget-object p1, p0, Ll/o410;->g:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 58
    .line 59
    monitor-enter p1

    .line 60
    :try_start_0
    iget-object p3, p0, Ll/o410;->g:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 61
    .line 62
    invoke-virtual {p2}, Ll/g510;->m()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p3, v0}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p3

    .line 70
    check-cast p3, Ll/wej;

    .line 71
    .line 72
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 73
    sget-boolean p1, Ll/o410;->B:Z

    .line 74
    .line 75
    if-eqz p1, :cond_4

    .line 76
    .line 77
    iget-object p1, p0, Ll/o410;->x:Ljava/lang/Object;

    .line 78
    .line 79
    monitor-enter p1

    .line 80
    if-eqz p3, :cond_3

    .line 81
    .line 82
    :try_start_1
    invoke-virtual {p3}, Ll/wej;->onDrawFrame()V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :catchall_0
    move-exception p0

    .line 87
    goto :goto_1

    .line 88
    :cond_3
    :goto_0
    monitor-exit p1

    .line 89
    goto :goto_2

    .line 90
    :goto_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    throw p0

    .line 92
    :cond_4
    if-eqz p3, :cond_5

    .line 93
    .line 94
    invoke-virtual {p3}, Ll/wej;->onDrawFrame()V

    .line 95
    .line 96
    .line 97
    goto :goto_2

    .line 98
    :catchall_1
    move-exception p0

    .line 99
    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 100
    throw p0

    .line 101
    :cond_5
    :goto_2
    iget-object p1, p0, Ll/o410;->d:Ljava/util/List;

    .line 102
    .line 103
    if-eqz p1, :cond_6

    .line 104
    .line 105
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-eqz p1, :cond_6

    .line 110
    .line 111
    iget-object p1, p0, Ll/o410;->k:Ll/g510;

    .line 112
    .line 113
    if-eq p1, p2, :cond_7

    .line 114
    .line 115
    :cond_6
    invoke-virtual {p2}, Ll/g510;->m()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p0, p1}, Ll/o410;->U(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    :cond_7
    iget-object p0, p0, Ll/o410;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 123
    .line 124
    invoke-virtual {p2}, Ll/g510;->m()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {p0, p1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    check-cast p0, Ljava/util/ArrayList;

    .line 133
    .line 134
    if-eqz p0, :cond_a

    .line 135
    .line 136
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    :cond_8
    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 141
    .line 142
    .line 143
    move-result p2

    .line 144
    if-eqz p2, :cond_9

    .line 145
    .line 146
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    check-cast p2, Ll/wej;

    .line 151
    .line 152
    if-eqz p2, :cond_8

    .line 153
    .line 154
    invoke-virtual {p2}, Ll/wej;->destroy()V

    .line 155
    .line 156
    .line 157
    goto :goto_3

    .line 158
    :cond_9
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 159
    .line 160
    .line 161
    :cond_a
    return-void
.end method

.method public l0(Lcom/momo/pipline/MomoInterface/MomoCodec;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/o410;->j0(Lcom/momo/pipline/MomoInterface/MomoCodec;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/o410;->m:Ll/o410$c;

    .line 5
    .line 6
    const/16 v1, 0x320

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/o410;->m:Ll/o410$c;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2, v2, p1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p0, p0, Ll/o410;->m:Ll/o410$c;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public m()Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/wje;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/o410;->w:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/o410;->e:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 9
    .line 10
    invoke-direct {v1}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v1, p0, Ll/o410;->e:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    iget-object p0, p0, Ll/o410;->e:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 20
    .line 21
    return-object p0

    .line 22
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw p0
.end method

.method public m0(Lcom/momo/pipline/MomoInterface/MomoCodec;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->A()V

    .line 4
    .line 5
    .line 6
    :cond_0
    iget-object p1, p0, Ll/o410;->m:Ll/o410$c;

    .line 7
    .line 8
    const/16 v0, 0xab

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/o410;->m:Ll/o410$c;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {p1, v0, v2, v2, v1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p0, p0, Ll/o410;->m:Ll/o410$c;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public n(Ll/g510;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o410;->f:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/g510;->m()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/o410;->g:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/g510;->m()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public n0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/o410;->k:Ll/g510;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/g510;->O()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/o410;->w:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object v1, p0, Ll/o410;->d:Ljava/util/List;

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-lez v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Ll/o410;->d:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 38
    .line 39
    invoke-interface {v2}, Lcom/momo/pipline/MomoInterface/MomoCodec;->A()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    const/16 v1, 0x4001

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    invoke-virtual {p0, v1, v2, v2, p0}, Ll/o410;->g(IIILjava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    iget-object p0, p0, Ll/o410;->d:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 54
    .line 55
    .line 56
    monitor-exit v0

    .line 57
    return-void

    .line 58
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    throw p0
.end method

.method public o(Ll/g510;IIII)V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "FPS:"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, "renderUse"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v2, "codecUse"

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v2, "renderKey"

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v2, "codecFps:"

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 56
    .line 57
    invoke-virtual {v0, v2, v1}, Ll/oq70;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/o410;->A:Ll/o410$f;

    .line 61
    .line 62
    if-eqz p0, :cond_0

    .line 63
    .line 64
    invoke-interface/range {p0 .. p5}, Ll/o410$f;->P0(Ll/g510;IIII)V

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void
.end method

.method public p()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public q(Ljava/lang/String;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/o410;->m:Ll/o410$c;

    .line 2
    .line 3
    const/16 v1, 0xac

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/o410;->m:Ll/o410$c;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, v1, v2, p2, p1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Ll/o410;->m:Ll/o410$c;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public r(Ljava/lang/String;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o410;->w:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/o410;->d:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-lez v1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/o410;->d:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 29
    .line 30
    invoke-interface {v1, p1, p2}, Lcom/momo/pipline/MomoInterface/MomoCodec;->p(Ljava/lang/String;I)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    monitor-exit v0

    .line 37
    return-void

    .line 38
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    throw p0
.end method

.method public s()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/o410;->m:Ll/o410$c;

    .line 2
    .line 3
    const/16 v1, 0xad

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/o410;->m:Ll/o410$c;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-virtual {v0, v1, v2, v2, v3}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object p0, p0, Ll/o410;->m:Ll/o410$c;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public z(Ll/g510;Lcom/momo/pipline/MomoInterface/MomoCodec;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o410;->w:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p1, p2}, Ll/g510;->h(Lcom/momo/pipline/MomoInterface/MomoCodec;)V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    iget-object p0, p0, Ll/o410;->d:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    monitor-exit v0

    .line 18
    return-void

    .line 19
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw p0
.end method
