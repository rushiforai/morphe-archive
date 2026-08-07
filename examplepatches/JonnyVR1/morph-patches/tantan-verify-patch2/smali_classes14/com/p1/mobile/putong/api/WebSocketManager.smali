.class public Lcom/p1/mobile/putong/api/WebSocketManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/api/WebSocketManager$c;,
        Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;,
        Lcom/p1/mobile/putong/api/WebSocketManager$e;,
        Lcom/p1/mobile/putong/api/WebSocketManager$g;,
        Lcom/p1/mobile/putong/api/WebSocketManager$h;,
        Lcom/p1/mobile/putong/api/WebSocketManager$f;,
        Lcom/p1/mobile/putong/api/WebSocketManager$d;,
        Lcom/p1/mobile/putong/api/WebSocketManager$i;
    }
.end annotation


# static fields
.field public static v:Ll/jxd0;


# instance fields
.field public a:Ljava/lang/String;

.field public volatile b:Z

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

.field public e:I

.field public f:I

.field public final g:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Lokio/ByteString;",
            ">;>;"
        }
    .end annotation
.end field

.field public h:Lcom/p1/mobile/putong/api/WebSocketManager$e;

.field public i:Lcom/p1/mobile/putong/data/Connector;

.field public j:Ll/isp0;

.field public k:Lcom/p1/mobile/putong/api/WebSocketManager$d;

.field public l:Lcom/p1/mobile/putong/api/WebSocketManager$i;

.field public m:Lcom/p1/mobile/putong/api/WebSocketManager$f;

.field public n:Ll/kcg0;

.field public o:Ll/kcg0;

.field public volatile p:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

.field public q:Z

.field public volatile r:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public s:Landroid/os/HandlerThread;

.field public t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

.field public u:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    const-string v1, "long_link_open_in_debug"

    .line 4
    .line 5
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/api/WebSocketManager;->v:Ll/jxd0;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "WebSocketManager"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->c:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->e:I

    .line 13
    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->f:I

    .line 15
    .line 16
    new-instance v1, Ljava/util/LinkedList;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->g:Ljava/util/Queue;

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->CLOSE:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->p:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->q:Z

    .line 28
    .line 29
    new-instance v0, Lcom/p1/mobile/putong/api/WebSocketManager$a;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/api/WebSocketManager$a;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->u:Ljava/lang/Runnable;

    .line 35
    .line 36
    new-instance v0, Lcom/p1/mobile/putong/api/WebSocketManager$e;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/api/WebSocketManager$e;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->h:Lcom/p1/mobile/putong/api/WebSocketManager$e;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/WebSocketManager$e;->d()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/putong/api/WebSocketManager;Lokio/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->j0(Lokio/ByteString;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/putong/api/WebSocketManager;Lokio/ByteString;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->k0(Lokio/ByteString;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/putong/api/WebSocketManager;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->n0()V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/putong/api/WebSocketManager;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->p0()V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/putong/api/WebSocketManager;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->r0(I)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/putong/api/WebSocketManager;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->s0()V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/putong/api/WebSocketManager;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->u0()V

    return-void
.end method

.method public static N()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x4

    .line 14
    invoke-static {v0, v1}, Ll/te2;->c([BI)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    return-object v0
.end method

.method public static Q()Lcom/p1/mobile/putong/api/WebSocketManager;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager$c;->a()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/api/WebSocketManager;Lokio/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->X(Lokio/ByteString;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/api/WebSocketManager;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->V()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/api/WebSocketManager;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->Y(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/api/WebSocketManager;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->a0()V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/api/WebSocketManager;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->Z(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/api/WebSocketManager;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->W()V

    return-void
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/api/WebSocketManager;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->u:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/putong/data/Connector;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->i:Lcom/p1/mobile/putong/data/Connector;

    return-object p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/putong/api/WebSocketManager$f;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->m:Lcom/p1/mobile/putong/api/WebSocketManager$f;

    return-object p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/api/WebSocketManager;)Ll/isp0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->j:Ll/isp0;

    return-object p0
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/api/WebSocketManager;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->f:I

    return p0
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/putong/api/WebSocketManager$g;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    return-object p0
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/api/WebSocketManager;Lcom/p1/mobile/putong/data/Connector;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->i:Lcom/p1/mobile/putong/data/Connector;

    return-void
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/putong/api/WebSocketManager;Ll/isp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->j:Ll/isp0;

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/api/WebSocketManager;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->f:I

    return-void
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/putong/api/WebSocketManager;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->e:I

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/putong/api/WebSocketManager;Ljava/lang/String;)Ll/isp0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->J(Ljava/lang/String;)Ll/isp0;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/api/WebSocketManager;Ljava/lang/String;Lokio/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/api/WebSocketManager;->L(Ljava/lang/String;Lokio/ByteString;)V

    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->M()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/putong/api/WebSocketManager;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->O()V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/putong/api/WebSocketManager;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->P()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/putong/api/WebSocketManager;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->R()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/putong/api/WebSocketManager;Lokio/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->c0(Lokio/ByteString;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/putong/api/WebSocketManager;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->d0()V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/putong/api/WebSocketManager;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->h0(Landroid/util/Pair;)V

    return-void
.end method


# virtual methods
.method public H()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->S()Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->CONNECTED:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 14
    .line 15
    if-ne v0, v1, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->j:Ll/isp0;

    .line 18
    .line 19
    const/16 v1, 0x3e8

    .line 20
    .line 21
    const-string v2, "CloseNormalClosure"

    .line 22
    .line 23
    invoke-interface {v0, v1, v2}, Ll/isp0;->close(ILjava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->CLOSE:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->m0(Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;)V

    .line 29
    .line 30
    .line 31
    monitor-enter p0

    .line 32
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->s:Landroid/os/HandlerThread;

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 37
    .line 38
    new-instance v1, Ll/nsp0;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/nsp0;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catchall_0
    move-exception v0

    .line 48
    goto :goto_1

    .line 49
    :cond_2
    :goto_0
    monitor-exit p0

    .line 50
    return-void

    .line 51
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    throw v0
.end method

.method public final I()I
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->i:Lcom/p1/mobile/putong/data/Connector;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Connector;->config:Lcom/p1/mobile/putong/data/ConnectorConfig;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget v1, v0, Lcom/p1/mobile/putong/data/ConnectorConfig;->reconnect_backoff_min:I

    .line 10
    .line 11
    iget v0, v0, Lcom/p1/mobile/putong/data/ConnectorConfig;->reconnect_backoff_max:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v1, 0x5

    .line 15
    const/16 v0, 0xa

    .line 16
    .line 17
    :goto_0
    iget v2, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->e:I

    .line 18
    .line 19
    const/4 v3, 0x3

    .line 20
    if-lt v2, v3, :cond_1

    .line 21
    .line 22
    div-int/2addr v2, v3

    .line 23
    int-to-double v2, v2

    .line 24
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    .line 25
    .line 26
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 27
    .line 28
    .line 29
    move-result-wide v2

    .line 30
    double-to-int v0, v2

    .line 31
    mul-int/2addr v1, v0

    .line 32
    add-int/lit8 v0, v1, 0x5

    .line 33
    .line 34
    :cond_1
    iget v2, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->e:I

    .line 35
    .line 36
    add-int/lit8 v2, v2, 0x1

    .line 37
    .line 38
    iput v2, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->e:I

    .line 39
    .line 40
    const/16 v3, 0x14

    .line 41
    .line 42
    if-le v2, v3, :cond_2

    .line 43
    .line 44
    iput v3, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->e:I

    .line 45
    .line 46
    :cond_2
    if-gt v0, v1, :cond_3

    .line 47
    .line 48
    return v1

    .line 49
    :cond_3
    new-instance p0, Ljava/util/Random;

    .line 50
    .line 51
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 52
    .line 53
    .line 54
    move-result-wide v2

    .line 55
    invoke-direct {p0, v2, v3}, Ljava/util/Random;-><init>(J)V

    .line 56
    .line 57
    .line 58
    sub-int/2addr v0, v1

    .line 59
    invoke-virtual {p0, v0}, Ljava/util/Random;->nextInt(I)I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    add-int/2addr p0, v1

    .line 64
    return p0
.end method

.method public final J(Ljava/lang/String;)Ll/isp0;
    .locals 6

    .line 1
    new-instance v0, Ll/x1d0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/x1d0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0, p1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Ll/uqb0;->D:Ll/rg50;

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->getUA()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    new-instance v5, Lcom/p1/mobile/putong/api/WebSocketManager$b;

    .line 25
    .line 26
    invoke-direct {v5, p0}, Lcom/p1/mobile/putong/api/WebSocketManager$b;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    .line 27
    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    const/4 v4, 0x0

    .line 31
    invoke-static/range {v0 .. v5}, Ll/jsp0;->m(Ll/x1d0;Ll/rg50;ILjava/lang/String;ZLl/lsp0;)Ll/isp0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public K(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final L(Ljava/lang/String;Lokio/ByteString;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->g:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-static {p1, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->v0()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final M()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->APP_STAY_SIDE_BACKGROUND:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->APP_STAY_SIDE_FOREGROUND:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 11
    .line 12
    :goto_0
    iput-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->d:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 13
    .line 14
    return-object v0
.end method

.method public final O()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->i:Lcom/p1/mobile/putong/data/Connector;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Connector;->wss_addr_list:Ljava/util/List;

    .line 9
    .line 10
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->i:Lcom/p1/mobile/putong/data/Connector;

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    iget-object v1, v2, Lcom/p1/mobile/putong/data/Connector;->wss_addr_list:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v1, v2, Lcom/p1/mobile/putong/data/Connector;->addr_list:Ljava/util/List;

    .line 25
    .line 26
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->i:Lcom/p1/mobile/putong/data/Connector;

    .line 31
    .line 32
    if-nez v1, :cond_1

    .line 33
    .line 34
    iget-object v1, v2, Lcom/p1/mobile/putong/data/Connector;->addr_list:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    iget-object v1, v2, Lcom/p1/mobile/putong/data/Connector;->addr:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_2

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->i:Lcom/p1/mobile/putong/data/Connector;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Connector;->addr:Ljava/lang/String;

    .line 51
    .line 52
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    :cond_2
    :goto_0
    invoke-static {v0}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->r:Ljava/util/List;

    .line 59
    .line 60
    return-void
.end method

.method public final P()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->r:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->r:Ljava/util/List;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/lang/String;

    .line 20
    .line 21
    return-object p0
.end method

.method public final R()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->language()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "zh-Hant"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string p0, "zh-TW"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string v0, "zh-Hans"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const-string p0, "zh-CN"

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    const-string v0, "en"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const-string v1, "en-US"

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    return-object v1

    .line 38
    :cond_2
    const-string v0, "ko"

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    const-string p0, "ko-KR"

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_3
    const-string v0, "ja"

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_4

    .line 56
    .line 57
    const-string p0, "ja-JP"

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_4
    const-string v0, "id"

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_5

    .line 67
    .line 68
    const-string p0, "id-ID"

    .line 69
    .line 70
    return-object p0

    .line 71
    :cond_5
    return-object v1
.end method

.method public S()Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->p:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-object p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public T()Ljava/util/List;
    .locals 4
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->c:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->c:Ljava/util/List;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->h:Lcom/p1/mobile/putong/api/WebSocketManager$e;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->a:Ljava/util/LinkedHashMap;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_0

    .line 45
    .line 46
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Ll/fxl;

    .line 51
    .line 52
    invoke-interface {v2}, Ll/fxl;->c()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    if-eqz v2, :cond_1

    .line 57
    .line 58
    iget-object v3, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->c:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->c:Ljava/util/List;

    .line 65
    .line 66
    const-string v1, "conversation.single"

    .line 67
    .line 68
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->c:Ljava/util/List;

    .line 72
    .line 73
    return-object p0
.end method

.method public U()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public final synthetic V()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->n0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic W()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->g0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic X(Lokio/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->c0(Lokio/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Y(Ljava/lang/Boolean;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->S()Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->b:Z

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->q:Z

    .line 11
    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    iput-boolean v2, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->q:Z

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->d:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 17
    .line 18
    if-eqz v1, :cond_3

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->d:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 25
    .line 26
    sget-object v3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->APP_STAY_SIDE_FOREGROUND:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    if-ne v1, v3, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move v2, v4

    .line 33
    :goto_0
    if-eq p1, v2, :cond_3

    .line 34
    .line 35
    sget-object p1, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->CONNECTED:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 36
    .line 37
    if-ne v0, p1, :cond_3

    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->newBuilder()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide$Builder;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1, v3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide$Builder;->setToSide(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide$Builder;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1, v4}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide$Builder;->setMute(Z)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide$Builder;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    .line 56
    .line 57
    new-instance v0, Ll/pq60;

    .line 58
    .line 59
    sget-object v1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->MSG_TYPE_SWITCH_SIDE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->N()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-direct {v0, v1, v2, p1}, Ll/pq60;-><init>(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;Ljava/lang/String;Lcom/google/protobuf/q;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ll/pq60;->a()Lokio/ByteString;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->c0(Lokio/ByteString;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->FORBIDDEN:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 77
    .line 78
    if-eq v0, v1, :cond_3

    .line 79
    .line 80
    sget-object v1, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->CLOSE:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 81
    .line 82
    if-eq v0, v1, :cond_3

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 85
    .line 86
    if-eqz v1, :cond_3

    .line 87
    .line 88
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-eqz p1, :cond_2

    .line 93
    .line 94
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->u:Ljava/lang/Runnable;

    .line 97
    .line 98
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->CONNECTED:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 103
    .line 104
    if-ne v0, p1, :cond_3

    .line 105
    .line 106
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->newBuilder()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide$Builder;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->APP_STAY_SIDE_BACKGROUND:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 111
    .line 112
    invoke-virtual {p1, v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide$Builder;->setToSide(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide$Builder;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-virtual {p1, v2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide$Builder;->setMute(Z)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide$Builder;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    .line 125
    .line 126
    new-instance v0, Ll/pq60;

    .line 127
    .line 128
    sget-object v1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->MSG_TYPE_SWITCH_SIDE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 129
    .line 130
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->N()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-direct {v0, v1, v2, p1}, Ll/pq60;-><init>(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;Ljava/lang/String;Lcom/google/protobuf/q;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v0}, Ll/pq60;->a()Lokio/ByteString;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->c0(Lokio/ByteString;)V

    .line 142
    .line 143
    .line 144
    :cond_3
    return-void
.end method

.method public final synthetic Z(Landroid/net/NetworkInfo;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->S()Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->FORBIDDEN:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 6
    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->CLOSE:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 10
    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->u:Ljava/lang/Runnable;

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic a0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->o:Ll/kcg0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/qsp0;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/qsp0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 23
    .line 24
    invoke-static {v1}, Ll/qxk;->a(Landroid/os/Handler;)Ll/qxk;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/rsp0;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/rsp0;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->o:Ll/kcg0;

    .line 46
    .line 47
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->n:Ll/kcg0;

    .line 48
    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 60
    .line 61
    invoke-static {v1}, Ll/qxk;->a(Landroid/os/Handler;)Ll/qxk;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ll/ssp0;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/ssp0;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->n:Ll/kcg0;

    .line 83
    .line 84
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->DISCONNECTED:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->m0(Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->u:Ljava/lang/Runnable;

    .line 92
    .line 93
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final b0(Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->CONNECTED:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/bn5;->U4()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 14
    .line 15
    invoke-interface {p0}, Ll/bn5;->pollUserCounters()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final c0(Lokio/ByteString;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->S()Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->CONNECTED:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->j:Ll/isp0;

    .line 11
    .line 12
    invoke-interface {v0, p1}, Ll/isp0;->c(Lokio/ByteString;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->j:Ll/isp0;

    .line 19
    .line 20
    new-instance p1, Ljava/lang/Exception;

    .line 21
    .line 22
    const-string v0, "send msg error"

    .line 23
    .line 24
    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-interface {p0, p1, v0}, Ll/isp0;->f(Ljava/lang/Exception;Ll/i5d0;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method public final d0()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->S()Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->FORBIDDEN:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 14
    .line 15
    if-eq v0, v1, :cond_3

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->CLOSE:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 18
    .line 19
    if-ne v0, v1, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->j:Ll/isp0;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-interface {v0}, Ll/isp0;->release()V

    .line 27
    .line 28
    .line 29
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->DISCONNECTED:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->m0(Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->I()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 39
    .line 40
    new-instance v2, Ll/psp0;

    .line 41
    .line 42
    invoke-direct {v2, p0}, Ll/psp0;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->u:Ljava/lang/Runnable;

    .line 51
    .line 52
    int-to-long v2, v0

    .line 53
    const-wide/16 v4, 0x3e8

    .line 54
    .line 55
    mul-long/2addr v2, v4

    .line 56
    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 57
    .line 58
    .line 59
    :cond_3
    :goto_0
    return-void
.end method

.method public e0(Ll/exl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->h:Lcom/p1/mobile/putong/api/WebSocketManager$e;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->b:Ll/n4w;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/n4w;->h(Ll/exl;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f0(Ll/fxl;)V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->h:Lcom/p1/mobile/putong/api/WebSocketManager$e;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->a:Ljava/util/LinkedHashMap;

    .line 4
    .line 5
    invoke-interface {p1}, Ll/fxl;->f()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/util/List;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->h:Lcom/p1/mobile/putong/api/WebSocketManager$e;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->a:Ljava/util/LinkedHashMap;

    .line 25
    .line 26
    invoke-interface {p1}, Ll/fxl;->f()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p0, v1, v0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-lez p0, :cond_2

    .line 38
    .line 39
    const/4 p0, 0x0

    .line 40
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Ll/fxl;

    .line 45
    .line 46
    invoke-interface {v1}, Ll/fxl;->b()Ljava/lang/Class;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-interface {p1}, Ll/fxl;->b()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    if-ne v1, v2, :cond_1

    .line 55
    .line 56
    const/4 p0, 0x1

    .line 57
    :cond_1
    invoke-static {p0}, Ll/u11;->h(Z)V

    .line 58
    .line 59
    .line 60
    :cond_2
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final g0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->r:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->r:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p0, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final h0(Landroid/util/Pair;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Lokio/ByteString;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->g:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->v0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public i0(Lokio/ByteString;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 2
    .line 3
    new-instance v1, Ll/msp0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/msp0;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager;Lokio/ByteString;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final j0(Lokio/ByteString;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->j:Ll/isp0;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/isp0;->c(Lokio/ByteString;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->q0(Lokio/ByteString;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->j:Ll/isp0;

    .line 14
    .line 15
    new-instance p1, Ljava/lang/Exception;

    .line 16
    .line 17
    const-string v0, "send msg error"

    .line 18
    .line 19
    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-interface {p0, p1, v0}, Ll/isp0;->f(Ljava/lang/Exception;Ll/i5d0;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final k0(Lokio/ByteString;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->j:Ll/isp0;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/isp0;->e(Lokio/ByteString;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->j:Ll/isp0;

    .line 10
    .line 11
    new-instance p1, Ljava/lang/Exception;

    .line 12
    .line 13
    const-string v0, "send ping error"

    .line 14
    .line 15
    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-interface {p0, p1, v0}, Ll/isp0;->f(Ljava/lang/Exception;Ll/i5d0;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public l0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->b:Z

    .line 2
    .line 3
    return-void
.end method

.method public m0(Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;)V
    .locals 2

    .line 1
    const-class v0, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->p:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->p:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 7
    .line 8
    if-eq v1, p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->b0(Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p0
.end method

.method public final n0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->n:Ll/kcg0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->n:Ll/kcg0;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->o:Ll/kcg0;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->o:Ll/kcg0;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->s:Landroid/os/HandlerThread;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->s:Landroid/os/HandlerThread;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->s:Landroid/os/HandlerThread;

    .line 35
    .line 36
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/cmb0;->c0()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public o0()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->r:Ljava/util/List;

    .line 3
    .line 4
    monitor-enter p0

    .line 5
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->s:Landroid/os/HandlerThread;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/os/HandlerThread;

    .line 10
    .line 11
    const-string v1, "longlink"

    .line 12
    .line 13
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->s:Landroid/os/HandlerThread;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    new-instance v0, Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->s:Landroid/os/HandlerThread;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/api/WebSocketManager$g;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager;Landroid/os/Looper;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 36
    .line 37
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    new-instance v1, Ll/osp0;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/osp0;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    throw v0
.end method

.method public final p0()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->k:Lcom/p1/mobile/putong/api/WebSocketManager$d;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/api/WebSocketManager$d;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/api/WebSocketManager$d;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager;Ll/zsp0;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->k:Lcom/p1/mobile/putong/api/WebSocketManager$d;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->k:Lcom/p1/mobile/putong/api/WebSocketManager$d;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->k:Lcom/p1/mobile/putong/api/WebSocketManager$d;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->i:Lcom/p1/mobile/putong/data/Connector;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Connector;->config:Lcom/p1/mobile/putong/data/ConnectorConfig;

    .line 27
    .line 28
    iget p0, p0, Lcom/p1/mobile/putong/data/ConnectorConfig;->keepalive_interval:I

    .line 29
    .line 30
    int-to-long v2, p0

    .line 31
    const-wide/16 v4, 0x3e8

    .line 32
    .line 33
    mul-long/2addr v2, v4

    .line 34
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final q0(Lokio/ByteString;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->m:Lcom/p1/mobile/putong/api/WebSocketManager$f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/api/WebSocketManager$f;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->i:Lcom/p1/mobile/putong/data/Connector;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Connector;->config:Lcom/p1/mobile/putong/data/ConnectorConfig;

    .line 15
    .line 16
    iget v1, v1, Lcom/p1/mobile/putong/data/ConnectorConfig;->keepalive_tries:I

    .line 17
    .line 18
    invoke-direct {v0, p0, p1, v1}, Lcom/p1/mobile/putong/api/WebSocketManager$f;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager;Lokio/ByteString;I)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->m:Lcom/p1/mobile/putong/api/WebSocketManager$f;

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->i:Lcom/p1/mobile/putong/data/Connector;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Connector;->config:Lcom/p1/mobile/putong/data/ConnectorConfig;

    .line 28
    .line 29
    iget p0, p0, Lcom/p1/mobile/putong/data/ConnectorConfig;->keepalive_timeout:I

    .line 30
    .line 31
    int-to-long v1, p0

    .line 32
    const-wide/16 v3, 0x3e8

    .line 33
    .line 34
    mul-long/2addr v1, v3

    .line 35
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final r0(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->l:Lcom/p1/mobile/putong/api/WebSocketManager$i;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/api/WebSocketManager$i;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager$i;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager;I)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->l:Lcom/p1/mobile/putong/api/WebSocketManager$i;

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->i:Lcom/p1/mobile/putong/data/Connector;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Connector;->config:Lcom/p1/mobile/putong/data/ConnectorConfig;

    .line 22
    .line 23
    iget p0, p0, Lcom/p1/mobile/putong/data/ConnectorConfig;->keepalive_timeout:I

    .line 24
    .line 25
    int-to-long v1, p0

    .line 26
    const-wide/16 v3, 0x3e8

    .line 27
    .line 28
    mul-long/2addr v1, v3

    .line 29
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final s0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->k:Lcom/p1/mobile/putong/api/WebSocketManager$d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public t0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->m:Lcom/p1/mobile/putong/api/WebSocketManager$f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final u0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->l:Lcom/p1/mobile/putong/api/WebSocketManager$i;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final v0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager;->t:Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/api/WebSocketManager$h;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v1, p0, v2}, Lcom/p1/mobile/putong/api/WebSocketManager$h;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager;Ll/zsp0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method
