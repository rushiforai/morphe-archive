.class public Lcom/tencent/liteav/videoencoder/b;
.super Lcom/tencent/liteav/basic/module/a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/videoencoder/b$a;
    }
.end annotation


# static fields
.field private static r:Ljava/lang/Integer;

.field private static final u:Ljava/lang/String;

.field private static v:I


# instance fields
.field private a:Lcom/tencent/liteav/videoencoder/c;

.field private b:Lcom/tencent/liteav/videoencoder/d;

.field private c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/basic/b/b;",
            ">;"
        }
    .end annotation
.end field

.field private d:I

.field private e:I

.field private f:I

.field private g:Ljava/util/Timer;

.field private h:Ljava/util/TimerTask;

.field private i:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private j:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

.field private k:F

.field private l:F

.field private m:F

.field private n:I

.field private o:I

.field private p:Lcom/tencent/liteav/basic/c/b;

.field private q:Lcom/tencent/liteav/basic/util/g;

.field private s:Z

.field private t:Lcom/tencent/liteav/beauty/b/k;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    sput-object v0, Lcom/tencent/liteav/videoencoder/b;->r:Ljava/lang/Integer;

    .line 7
    .line 8
    const-class v0, Lcom/tencent/liteav/videoencoder/b;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lcom/tencent/liteav/videoencoder/b;->u:Ljava/lang/String;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    sput v0, Lcom/tencent/liteav/videoencoder/b;->v:I

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(I)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/basic/module/a;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->b:Lcom/tencent/liteav/videoencoder/d;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->c:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput v1, p0, Lcom/tencent/liteav/videoencoder/b;->d:I

    .line 13
    .line 14
    const/4 v2, 0x2

    .line 15
    iput v2, p0, Lcom/tencent/liteav/videoencoder/b;->e:I

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    iput v2, p0, Lcom/tencent/liteav/videoencoder/b;->f:I

    .line 19
    .line 20
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->g:Ljava/util/Timer;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->h:Ljava/util/TimerTask;

    .line 23
    .line 24
    new-instance v0, Ljava/util/LinkedList;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->i:Ljava/util/LinkedList;

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    iput v0, p0, Lcom/tencent/liteav/videoencoder/b;->k:F

    .line 33
    .line 34
    iput v0, p0, Lcom/tencent/liteav/videoencoder/b;->l:F

    .line 35
    .line 36
    iput v0, p0, Lcom/tencent/liteav/videoencoder/b;->m:F

    .line 37
    .line 38
    iput v1, p0, Lcom/tencent/liteav/videoencoder/b;->n:I

    .line 39
    .line 40
    iput v1, p0, Lcom/tencent/liteav/videoencoder/b;->o:I

    .line 41
    .line 42
    iput p1, p0, Lcom/tencent/liteav/videoencoder/b;->e:I

    .line 43
    .line 44
    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/videoencoder/b;F)F
    .locals 0

    .line 193
    iput p1, p0, Lcom/tencent/liteav/videoencoder/b;->k:F

    return p1
.end method

.method public static synthetic a(Lcom/tencent/liteav/videoencoder/b;I)I
    .locals 0

    .line 187
    iput p1, p0, Lcom/tencent/liteav/videoencoder/b;->f:I

    return p1
.end method

.method public static synthetic a(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/basic/c/b;
    .locals 0

    .line 188
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b;->p:Lcom/tencent/liteav/basic/c/b;

    return-object p0
.end method

.method public static synthetic a(Lcom/tencent/liteav/videoencoder/b;Lcom/tencent/liteav/basic/c/b;)Lcom/tencent/liteav/basic/c/b;
    .locals 0

    .line 189
    iput-object p1, p0, Lcom/tencent/liteav/videoencoder/b;->p:Lcom/tencent/liteav/basic/c/b;

    return-object p1
.end method

.method public static synthetic a(Lcom/tencent/liteav/videoencoder/b;Lcom/tencent/liteav/beauty/b/k;)Lcom/tencent/liteav/beauty/b/k;
    .locals 0

    .line 190
    iput-object p1, p0, Lcom/tencent/liteav/videoencoder/b;->t:Lcom/tencent/liteav/beauty/b/k;

    return-object p1
.end method

.method public static synthetic a(Lcom/tencent/liteav/videoencoder/b;Lcom/tencent/liteav/videoencoder/c;)Lcom/tencent/liteav/videoencoder/c;
    .locals 0

    .line 191
    iput-object p1, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    return-object p1
.end method

.method private a(ILjava/lang/String;)V
    .locals 4

    .line 246
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b;->c:Ljava/lang/ref/WeakReference;

    if-nez p0, :cond_0

    goto :goto_0

    .line 247
    :cond_0
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/tencent/liteav/basic/b/b;

    if-nez p0, :cond_1

    :goto_0
    return-void

    .line 248
    :cond_1
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 249
    const-string v1, "EVT_ID"

    invoke-virtual {v0, v1, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 250
    const-string v1, "EVT_TIME"

    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 251
    const-string v1, "EVT_MSG"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 252
    invoke-interface {p0, p1, v0}, Lcom/tencent/liteav/basic/b/b;->onNotifyEvent(ILandroid/os/Bundle;)V

    return-void
.end method

.method private a(ILjava/lang/String;I)V
    .locals 4

    .line 253
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b;->c:Ljava/lang/ref/WeakReference;

    if-nez p0, :cond_0

    goto :goto_0

    .line 254
    :cond_0
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/tencent/liteav/basic/b/b;

    if-nez p0, :cond_1

    :goto_0
    return-void

    .line 255
    :cond_1
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 256
    const-string v1, "EVT_ID"

    invoke-virtual {v0, v1, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 257
    const-string v1, "EVT_TIME"

    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 258
    const-string v1, "EVT_MSG"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 259
    const-string p2, "EVT_PARAM1"

    invoke-virtual {v0, p2, p3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 260
    invoke-interface {p0, p1, v0}, Lcom/tencent/liteav/basic/b/b;->onNotifyEvent(ILandroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/videoencoder/b;ILjava/lang/String;)V
    .locals 0

    .line 192
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/videoencoder/b;->a(ILjava/lang/String;)V

    return-void
.end method

.method private a(Ljava/util/Queue;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;)Z"
        }
    .end annotation

    .line 208
    monitor-enter p1

    .line 209
    :try_start_0
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    monitor-exit p1

    return v0

    :catchall_0
    move-exception p0

    goto :goto_0

    .line 210
    :cond_0
    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Runnable;

    .line 211
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p0, :cond_1

    return v0

    .line 212
    :cond_1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    return p0

    .line 213
    :goto_0
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static synthetic b(Lcom/tencent/liteav/videoencoder/b;F)F
    .locals 0

    .line 18
    iput p1, p0, Lcom/tencent/liteav/videoencoder/b;->l:F

    return p1
.end method

.method public static synthetic b(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/beauty/b/k;
    .locals 0

    .line 14
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b;->t:Lcom/tencent/liteav/beauty/b/k;

    return-object p0
.end method

.method public static synthetic c(Lcom/tencent/liteav/videoencoder/b;F)F
    .locals 0

    .line 16
    iput p1, p0, Lcom/tencent/liteav/videoencoder/b;->m:F

    return p1
.end method

.method public static synthetic c(Lcom/tencent/liteav/videoencoder/b;)Ljava/util/LinkedList;
    .locals 0

    .line 13
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b;->i:Ljava/util/LinkedList;

    return-object p0
.end method

.method public static synthetic d(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/videoencoder/c;
    .locals 0

    .line 15
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    return-object p0
.end method

.method public static synthetic e(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/videoencoder/d;
    .locals 0

    .line 13
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b;->b:Lcom/tencent/liteav/videoencoder/d;

    return-object p0
.end method

.method public static synthetic f(Lcom/tencent/liteav/videoencoder/b;)I
    .locals 0

    .line 29
    iget p0, p0, Lcom/tencent/liteav/videoencoder/b;->d:I

    return p0
.end method

.method private f()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->h:Ljava/util/TimerTask;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/tencent/liteav/videoencoder/b$a;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/tencent/liteav/videoencoder/b$a;-><init>(Lcom/tencent/liteav/videoencoder/b;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->h:Ljava/util/TimerTask;

    .line 11
    .line 12
    :cond_0
    new-instance v1, Ljava/util/Timer;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Lcom/tencent/liteav/videoencoder/b;->g:Ljava/util/Timer;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/tencent/liteav/videoencoder/b;->h:Ljava/util/TimerTask;

    .line 20
    .line 21
    const-wide/16 v3, 0x3e8

    .line 22
    .line 23
    const-wide/16 v5, 0x3e8

    .line 24
    .line 25
    invoke-virtual/range {v1 .. v6}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic g(Lcom/tencent/liteav/videoencoder/b;)I
    .locals 0

    .line 18
    iget p0, p0, Lcom/tencent/liteav/videoencoder/b;->f:I

    return p0
.end method

.method private g()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->g:Ljava/util/Timer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/tencent/liteav/videoencoder/b;->g:Ljava/util/Timer;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->h:Ljava/util/TimerTask;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iput-object v1, p0, Lcom/tencent/liteav/videoencoder/b;->h:Ljava/util/TimerTask;

    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method public static synthetic h(Lcom/tencent/liteav/videoencoder/b;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b;->j:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    return-object p0
.end method

.method private h()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/liteav/videoencoder/b$7;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/liteav/videoencoder/b$7;-><init>(Lcom/tencent/liteav/videoencoder/b;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/videoencoder/b;->a(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    const-string p0, "TXCVideoEncoder"

    .line 10
    .line 11
    const-string v0, "switchSWToHW"

    .line 12
    .line 13
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic i(Lcom/tencent/liteav/videoencoder/b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/videoencoder/b;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic j(Lcom/tencent/liteav/videoencoder/b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/videoencoder/b;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic k(Lcom/tencent/liteav/videoencoder/b;)I
    .locals 1

    .line 1
    iget v0, p0, Lcom/tencent/liteav/videoencoder/b;->n:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/tencent/liteav/videoencoder/b;->n:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic l(Lcom/tencent/liteav/videoencoder/b;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/videoencoder/b;->k:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic m(Lcom/tencent/liteav/videoencoder/b;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/videoencoder/b;->l:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic n(Lcom/tencent/liteav/videoencoder/b;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/videoencoder/b;->m:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic o(Lcom/tencent/liteav/videoencoder/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/b;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p(Lcom/tencent/liteav/videoencoder/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/b;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;)I
    .locals 8

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/videoencoder/b;->j:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->enableBlackList:Z

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/tencent/liteav/basic/d/c;->a()Lcom/tencent/liteav/basic/d/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/d/c;->c()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v1

    .line 18
    :goto_0
    iget v2, p0, Lcom/tencent/liteav/videoencoder/b;->e:I

    .line 19
    .line 20
    const/4 v3, 0x3

    .line 21
    const-string v4, "Enables hardware encoding"

    .line 22
    .line 23
    const/16 v5, 0x3f0

    .line 24
    .line 25
    const/4 v6, 0x1

    .line 26
    if-ne v2, v6, :cond_1

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    new-instance v0, Lcom/tencent/liteav/videoencoder/a;

    .line 31
    .line 32
    invoke-direct {v0}, Lcom/tencent/liteav/videoencoder/a;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    .line 36
    .line 37
    iput v6, p0, Lcom/tencent/liteav/videoencoder/b;->f:I

    .line 38
    .line 39
    invoke-direct {p0, v5, v4, v6}, Lcom/tencent/liteav/videoencoder/b;->a(ILjava/lang/String;I)V

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    if-ne v2, v3, :cond_2

    .line 44
    .line 45
    iget v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 46
    .line 47
    const/16 v7, 0x2d0

    .line 48
    .line 49
    if-ne v2, v7, :cond_2

    .line 50
    .line 51
    iget v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 52
    .line 53
    const/16 v7, 0x500

    .line 54
    .line 55
    if-ne v2, v7, :cond_2

    .line 56
    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    new-instance v0, Lcom/tencent/liteav/videoencoder/a;

    .line 60
    .line 61
    invoke-direct {v0}, Lcom/tencent/liteav/videoencoder/a;-><init>()V

    .line 62
    .line 63
    .line 64
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    .line 65
    .line 66
    iput v6, p0, Lcom/tencent/liteav/videoencoder/b;->f:I

    .line 67
    .line 68
    invoke-direct {p0, v5, v4, v6}, Lcom/tencent/liteav/videoencoder/b;->a(ILjava/lang/String;I)V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_2
    new-instance v0, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;

    .line 73
    .line 74
    invoke-direct {v0}, Lcom/tencent/liteav/videoencoder/TXCSWVideoEncoder;-><init>()V

    .line 75
    .line 76
    .line 77
    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    .line 78
    .line 79
    iput v1, p0, Lcom/tencent/liteav/videoencoder/b;->f:I

    .line 80
    .line 81
    const-string v0, "Enables software encoding"

    .line 82
    .line 83
    invoke-direct {p0, v5, v0, v1}, Lcom/tencent/liteav/videoencoder/b;->a(ILjava/lang/String;I)V

    .line 84
    .line 85
    .line 86
    :goto_1
    iget v0, p0, Lcom/tencent/liteav/videoencoder/b;->f:I

    .line 87
    .line 88
    int-to-long v0, v0

    .line 89
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const/16 v1, 0xfa7

    .line 94
    .line 95
    invoke-virtual {p0, v1, v0}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(ILjava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    .line 99
    .line 100
    if-eqz v0, :cond_6

    .line 101
    .line 102
    iget-object v1, p0, Lcom/tencent/liteav/videoencoder/b;->b:Lcom/tencent/liteav/videoencoder/d;

    .line 103
    .line 104
    if-eqz v1, :cond_3

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/videoencoder/c;->setListener(Lcom/tencent/liteav/videoencoder/d;)V

    .line 107
    .line 108
    .line 109
    :cond_3
    iget v0, p0, Lcom/tencent/liteav/videoencoder/b;->d:I

    .line 110
    .line 111
    if-eqz v0, :cond_4

    .line 112
    .line 113
    iget-object v1, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    .line 114
    .line 115
    invoke-virtual {v1, v0}, Lcom/tencent/liteav/videoencoder/c;->setBitrate(I)V

    .line 116
    .line 117
    .line 118
    :cond_4
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    .line 119
    .line 120
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/basic/module/a;->setID(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    .line 128
    .line 129
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/videoencoder/c;->start(Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;)I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eqz p1, :cond_7

    .line 134
    .line 135
    iget p0, p0, Lcom/tencent/liteav/videoencoder/b;->f:I

    .line 136
    .line 137
    if-ne p0, v6, :cond_5

    .line 138
    .line 139
    const-string p0, "hw"

    .line 140
    .line 141
    goto :goto_2

    .line 142
    :cond_5
    const-string p0, "sw"

    .line 143
    .line 144
    :goto_2
    sget-object v0, Lcom/tencent/liteav/videoencoder/b;->u:Ljava/lang/String;

    .line 145
    .line 146
    const-string v1, "start video encode "

    .line 147
    .line 148
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    return p1

    .line 156
    :cond_6
    const p1, 0x989682

    .line 157
    .line 158
    .line 159
    :cond_7
    iget v0, p0, Lcom/tencent/liteav/videoencoder/b;->e:I

    .line 160
    .line 161
    if-ne v0, v3, :cond_8

    .line 162
    .line 163
    const/4 v0, 0x0

    .line 164
    iput v0, p0, Lcom/tencent/liteav/videoencoder/b;->k:F

    .line 165
    .line 166
    iput v0, p0, Lcom/tencent/liteav/videoencoder/b;->l:F

    .line 167
    .line 168
    iput v0, p0, Lcom/tencent/liteav/videoencoder/b;->m:F

    .line 169
    .line 170
    const/4 v0, 0x0

    .line 171
    iput v0, p0, Lcom/tencent/liteav/videoencoder/b;->n:I

    .line 172
    .line 173
    invoke-static {}, Lcom/tencent/liteav/basic/d/c;->a()Lcom/tencent/liteav/basic/d/c;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/d/c;->e()I

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    iput v0, p0, Lcom/tencent/liteav/videoencoder/b;->o:I

    .line 182
    .line 183
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/b;->f()V

    .line 184
    .line 185
    .line 186
    :cond_8
    return p1
.end method

.method public a(IIIJ)J
    .locals 3

    .line 236
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->i:Ljava/util/LinkedList;

    invoke-direct {p0, v0}, Lcom/tencent/liteav/videoencoder/b;->a(Ljava/util/Queue;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 237
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    if-eqz v0, :cond_2

    .line 238
    invoke-virtual {p0}, Lcom/tencent/liteav/videoencoder/b;->d()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/16 v1, 0xfa2

    invoke-virtual {p0, v1, v0}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(ILjava/lang/Object;)Z

    .line 239
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->j:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    iget v0, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->streamType:I

    invoke-virtual {p0}, Lcom/tencent/liteav/videoencoder/b;->c()D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    const/16 v2, 0xfa1

    invoke-virtual {p0, v2, v0, v1}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 240
    iget v0, p0, Lcom/tencent/liteav/videoencoder/b;->f:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 241
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->j:Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    iget v0, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->streamType:I

    invoke-virtual {p0}, Lcom/tencent/liteav/videoencoder/b;->e()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x1f42

    invoke-virtual {p0, v2, v0, v1}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 242
    :cond_1
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    invoke-virtual/range {p0 .. p5}, Lcom/tencent/liteav/videoencoder/c;->pushVideoFrame(IIIJ)J

    move-result-wide p0

    return-wide p0

    :cond_2
    const-wide/32 p0, 0x989682

    return-wide p0
.end method

.method public a([BIIIJ)J
    .locals 9

    .line 214
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->p:Lcom/tencent/liteav/basic/c/b;

    if-nez v0, :cond_0

    const-wide/16 p0, -0x1

    return-wide p0

    .line 215
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->q:Lcom/tencent/liteav/basic/util/g;

    new-instance v1, Lcom/tencent/liteav/videoencoder/b$2;

    move-object v2, p0

    move-object v6, p1

    move v5, p2

    move v3, p3

    move v4, p4

    move-wide v7, p5

    invoke-direct/range {v1 .. v8}, Lcom/tencent/liteav/videoencoder/b$2;-><init>(Lcom/tencent/liteav/videoencoder/b;III[BJ)V

    invoke-virtual {v0, v1}, Lcom/tencent/liteav/basic/util/g;->b(Ljava/lang/Runnable;)V

    const-wide/16 p0, 0x0

    return-wide p0
.end method

.method public a(II)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 7

    .line 194
    const-string v0, "CVGLThread"

    iget-boolean v1, p0, Lcom/tencent/liteav/videoencoder/b;->s:Z

    const/4 v2, 0x0

    if-nez v1, :cond_1

    const/4 v1, 0x1

    .line 195
    iput-boolean v1, p0, Lcom/tencent/liteav/videoencoder/b;->s:Z

    .line 196
    sget-object v3, Lcom/tencent/liteav/videoencoder/b;->r:Ljava/lang/Integer;

    monitor-enter v3

    .line 197
    :try_start_0
    new-instance v4, Lcom/tencent/liteav/basic/util/g;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Lcom/tencent/liteav/videoencoder/b;->r:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int/2addr v6, v1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    sput-object v6, Lcom/tencent/liteav/videoencoder/b;->r:Ljava/lang/Integer;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Lcom/tencent/liteav/basic/util/g;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lcom/tencent/liteav/videoencoder/b;->q:Lcom/tencent/liteav/basic/util/g;

    .line 198
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 199
    new-array v0, v1, [Z

    .line 200
    new-instance v1, Lcom/tencent/liteav/videoencoder/b$1;

    invoke-direct {v1, p0, p1, p2, v0}, Lcom/tencent/liteav/videoencoder/b$1;-><init>(Lcom/tencent/liteav/videoencoder/b;II[Z)V

    invoke-virtual {v4, v1}, Lcom/tencent/liteav/basic/util/g;->a(Ljava/lang/Runnable;)V

    const/4 p1, 0x0

    .line 201
    aget-boolean p1, v0, p1

    if-eqz p1, :cond_0

    .line 202
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b;->p:Lcom/tencent/liteav/basic/c/b;

    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/b;->d()Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object p0

    return-object p0

    :cond_0
    return-object v2

    :catchall_0
    move-exception p0

    .line 203
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    .line 204
    :cond_1
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b;->p:Lcom/tencent/liteav/basic/c/b;

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/b;->d()Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object p0

    return-object p0

    :cond_2
    return-object v2
.end method

.method public a()V
    .locals 4

    .line 216
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->q:Lcom/tencent/liteav/basic/util/g;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 217
    iget-object v2, p0, Lcom/tencent/liteav/videoencoder/b;->p:Lcom/tencent/liteav/basic/c/b;

    .line 218
    new-instance v3, Lcom/tencent/liteav/videoencoder/b$3;

    invoke-direct {v3, p0, v2}, Lcom/tencent/liteav/videoencoder/b$3;-><init>(Lcom/tencent/liteav/videoencoder/b;Lcom/tencent/liteav/basic/c/b;)V

    invoke-virtual {v0, v3}, Lcom/tencent/liteav/basic/util/g;->b(Ljava/lang/Runnable;)V

    .line 219
    iput-object v1, p0, Lcom/tencent/liteav/videoencoder/b;->q:Lcom/tencent/liteav/basic/util/g;

    .line 220
    iput-object v1, p0, Lcom/tencent/liteav/videoencoder/b;->p:Lcom/tencent/liteav/basic/c/b;

    goto :goto_0

    .line 221
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->i:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 222
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    if-eqz v0, :cond_1

    .line 223
    invoke-virtual {v0}, Lcom/tencent/liteav/videoencoder/c;->stop()V

    .line 224
    :cond_1
    :goto_0
    iget v0, p0, Lcom/tencent/liteav/videoencoder/b;->e:I

    const/4 v2, 0x3

    const/4 v3, 0x0

    if-ne v0, v2, :cond_2

    const/4 v0, 0x0

    .line 225
    iput v0, p0, Lcom/tencent/liteav/videoencoder/b;->k:F

    .line 226
    iput v0, p0, Lcom/tencent/liteav/videoencoder/b;->l:F

    .line 227
    iput v0, p0, Lcom/tencent/liteav/videoencoder/b;->m:F

    .line 228
    iput v3, p0, Lcom/tencent/liteav/videoencoder/b;->n:I

    .line 229
    invoke-direct {p0}, Lcom/tencent/liteav/videoencoder/b;->g()V

    .line 230
    :cond_2
    iput-object v1, p0, Lcom/tencent/liteav/videoencoder/b;->b:Lcom/tencent/liteav/videoencoder/d;

    .line 231
    iput v3, p0, Lcom/tencent/liteav/videoencoder/b;->d:I

    return-void
.end method

.method public a(I)V
    .locals 0

    .line 232
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    if-eqz p0, :cond_0

    .line 233
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/videoencoder/c;->setRotation(I)V

    :cond_0
    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/b/b;)V
    .locals 1

    .line 243
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->c:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public a(Lcom/tencent/liteav/videoencoder/d;)V
    .locals 0

    .line 244
    iput-object p1, p0, Lcom/tencent/liteav/videoencoder/b;->b:Lcom/tencent/liteav/videoencoder/d;

    .line 245
    new-instance p1, Lcom/tencent/liteav/videoencoder/b$4;

    invoke-direct {p1, p0}, Lcom/tencent/liteav/videoencoder/b$4;-><init>(Lcom/tencent/liteav/videoencoder/b;)V

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/videoencoder/b;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public a(Ljava/lang/Runnable;)V
    .locals 1

    .line 205
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->i:Ljava/util/LinkedList;

    monitor-enter v0

    .line 206
    :try_start_0
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b;->i:Ljava/util/LinkedList;

    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 207
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public a(Z)V
    .locals 0

    .line 234
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    if-eqz p0, :cond_0

    .line 235
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/videoencoder/c;->setXMirror(Z)V

    :cond_0
    return-void
.end method

.method public b()V
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/tencent/liteav/videoencoder/c;->restartIDR()V

    :cond_0
    return-void
.end method

.method public b(I)Z
    .locals 0

    .line 15
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    if-eqz p0, :cond_0

    .line 16
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/videoencoder/c;->setFPS(I)V

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public b(II)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lcom/tencent/liteav/videoencoder/b;->d:I

    .line 6
    .line 7
    invoke-virtual {v0, p1, p2}, Lcom/tencent/liteav/videoencoder/c;->setBitrateFromQos(II)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public c()D
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tencent/liteav/videoencoder/c;->getRealFPS()D

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

.method public c(I)V
    .locals 0

    .line 14
    iput p1, p0, Lcom/tencent/liteav/videoencoder/b;->d:I

    .line 15
    new-instance p1, Lcom/tencent/liteav/videoencoder/b$5;

    invoke-direct {p1, p0}, Lcom/tencent/liteav/videoencoder/b$5;-><init>(Lcom/tencent/liteav/videoencoder/b;)V

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/videoencoder/b;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public d()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tencent/liteav/videoencoder/c;->getRealBitrate()J

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

.method public d(I)Z
    .locals 0

    .line 13
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    if-eqz p0, :cond_0

    .line 14
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/videoencoder/c;->setEncodeIdrFpsFromQos(I)V

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tencent/liteav/videoencoder/c;->getEncodeCost()I

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

.method public e(I)V
    .locals 1

    .line 12
    new-instance v0, Lcom/tencent/liteav/videoencoder/b$6;

    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/videoencoder/b$6;-><init>(Lcom/tencent/liteav/videoencoder/b;I)V

    invoke-virtual {p0, v0}, Lcom/tencent/liteav/videoencoder/b;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setID(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/basic/module/a;->setID(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/b;->a:Lcom/tencent/liteav/videoencoder/c;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/basic/module/a;->setID(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget p1, p0, Lcom/tencent/liteav/videoencoder/b;->f:I

    .line 12
    .line 13
    int-to-long v0, p1

    .line 14
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/16 v0, 0xfa7

    .line 19
    .line 20
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(ILjava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method
