.class public final Lxn4;
.super Llcp;
.source "SourceFile"


# instance fields
.field public final s:Ljava/util/HashMap;

.field public final synthetic t:Lyn4;


# direct methods
.method public constructor <init>(Lyn4;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxn4;->t:Lyn4;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lxn4;->s:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public final A(Lcom/google/android/gms/cast/framework/CastSession;)V
    .registers 3

    invoke-virtual {p0, p1}, Lxn4;->Q(Lcom/google/android/gms/cast/framework/CastSession;)V

    iget-object p0, p0, Lxn4;->t:Lyn4;

    iput-object p1, p0, Lyn4;->j:Lcom/google/android/gms/cast/framework/CastSession;

    iget-object p0, p0, Lyn4;->c:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_d
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/media/PlayerContainerView;

    invoke-virtual {v0, p1}, Lcom/opera/android/media/PlayerContainerView;->e(Lcom/google/android/gms/cast/framework/CastSession;)V

    goto :goto_d

    :cond_1d
    return-void
.end method

.method public final B(Lcom/google/android/gms/cast/framework/CastSession;I)V
    .registers 3

    invoke-virtual {p0, p1}, Lxn4;->O(Lcom/google/android/gms/cast/framework/CastSession;)V

    return-void
.end method

.method public final O(Lcom/google/android/gms/cast/framework/CastSession;)V
    .registers 3

    iget-object v0, p0, Lxn4;->s:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb18;

    if-eqz v0, :cond_11

    iget-object v0, v0, Lb18;->a:Lzn4;

    if-eqz v0, :cond_11

    invoke-virtual {v0}, Lzn4;->a()V

    :cond_11
    invoke-virtual {p0, p1}, Lxn4;->P(Lcom/google/android/gms/cast/framework/CastSession;)V

    return-void
.end method

.method public final P(Lcom/google/android/gms/cast/framework/CastSession;)V
    .registers 3

    iget-object p0, p0, Lxn4;->t:Lyn4;

    iget-object v0, p0, Lyn4;->j:Lcom/google/android/gms/cast/framework/CastSession;

    if-ne v0, p1, :cond_1f

    const/4 p1, 0x0

    iput-object p1, p0, Lyn4;->j:Lcom/google/android/gms/cast/framework/CastSession;

    iget-object p0, p0, Lyn4;->c:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_f
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1f

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/media/PlayerContainerView;

    invoke-virtual {v0, p1}, Lcom/opera/android/media/PlayerContainerView;->e(Lcom/google/android/gms/cast/framework/CastSession;)V

    goto :goto_f

    :cond_1f
    return-void
.end method

.method public final Q(Lcom/google/android/gms/cast/framework/CastSession;)V
    .registers 15

    iget-object v0, p0, Lxn4;->s:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d9

    new-instance v1, Lb18;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lhu5;

    const/4 v1, 0x7

    invoke-direct {v0, p0, p1, v1}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lcom/opera/android/http/server/HttpServer;

    invoke-direct {p0}, Lcom/opera/android/http/server/HttpServer;-><init>()V

    invoke-static {}, Li0l;->g()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v1, :cond_42

    const-string p1, "arc.net.ipv4.host_address"

    invoke-static {p1}, Li0l;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_30

    :try_start_2b
    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object p1
    :try_end_2f
    .catch Ljava/net/UnknownHostException; {:try_start_2b .. :try_end_2f} :catch_30

    goto :goto_31

    :catch_30
    :cond_30
    move-object p1, v3

    :goto_31
    const/4 v1, 0x4

    :try_start_32
    new-array v1, v1, [B

    fill-array-data v1, :array_da

    invoke-static {v1}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v1
    :try_end_3b
    .catch Ljava/net/UnknownHostException; {:try_start_32 .. :try_end_3b} :catch_3d

    goto/16 :goto_bf

    :catch_3d
    move-exception p0

    invoke-static {p0}, Lrqd;->p(Ljava/lang/Throwable;)V

    return-void

    :cond_42
    invoke-virtual {p1}, Lcom/google/android/gms/cast/framework/CastSession;->getCastDevice()Lcom/google/android/gms/cast/CastDevice;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/cast/CastDevice;->getInetAddress()Ljava/net/InetAddress;

    move-result-object p1

    :try_start_4a
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v1

    :cond_4e
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_bd

    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/net/NetworkInterface;

    invoke-virtual {v4}, Ljava/net/NetworkInterface;->getInterfaceAddresses()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_62
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4e

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/net/InterfaceAddress;

    invoke-virtual {v5}, Ljava/net/InterfaceAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v6

    invoke-virtual {v5}, Ljava/net/InterfaceAddress;->getNetworkPrefixLength()S

    move-result v7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_b5

    if-gez v7, :cond_8b

    invoke-virtual {p1, v6}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z

    move-result v6

    goto :goto_b6

    :cond_8b
    invoke-virtual {p1}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v8

    invoke-virtual {v6}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v6

    div-int/lit8 v9, v7, 0x8

    rem-int/lit8 v7, v7, 0x8

    const v10, 0xff00

    shr-int/2addr v10, v7

    int-to-byte v7, v10

    move v10, v2

    :goto_9d
    if-ge v10, v9, :cond_a8

    aget-byte v11, v8, v10

    aget-byte v12, v6, v10

    if-ne v11, v12, :cond_b5

    add-int/lit8 v10, v10, 0x1

    goto :goto_9d

    :cond_a8
    const/4 v10, 0x1

    if-eqz v7, :cond_b3

    aget-byte v8, v8, v9

    and-int/2addr v8, v7

    aget-byte v6, v6, v9

    and-int/2addr v6, v7

    if-ne v8, v6, :cond_b5

    :cond_b3
    move v6, v10

    goto :goto_b6

    :cond_b5
    move v6, v2

    :goto_b6
    if-eqz v6, :cond_62

    invoke-virtual {v5}, Ljava/net/InterfaceAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object p1
    :try_end_bc
    .catch Ljava/net/SocketException; {:try_start_4a .. :try_end_bc} :catch_bd

    goto :goto_be

    :catch_bd
    :cond_bd
    move-object p1, v3

    :goto_be
    move-object v1, p1

    :goto_bf
    if-eqz v1, :cond_d6

    if-eqz p1, :cond_d6

    new-instance v3, Lsu;

    const/16 v4, 0x9

    invoke-direct {v3, p1, p0, v0, v4}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v3, p0, Lcom/opera/android/http/server/HttpServer;->d:Lsu;

    iget-wide p0, p0, Lcom/opera/android/http/server/HttpServer;->b:J

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, v2}, LJ/N;->M8i2vxZx(JLjava/lang/Object;I)V

    goto :goto_d9

    :cond_d6
    invoke-virtual {v0, v3}, Lhu5;->run(Ljava/lang/Object;)V

    :cond_d9
    :goto_d9
    return-void

    :array_da
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method public final R(Lcom/google/android/gms/cast/framework/CastSession;Lb18;)V
    .registers 9

    iget-object v0, p2, Lb18;->a:Lzn4;

    if-eqz v0, :cond_84

    iget-boolean v0, p2, Lb18;->b:Z

    if-eqz v0, :cond_84

    iget-object v0, p0, Lxn4;->s:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p2, Lb18;->a:Lzn4;

    iget-object p0, p0, Lxn4;->t:Lyn4;

    iget-object v0, p0, Lyn4;->j:Lcom/google/android/gms/cast/framework/CastSession;

    if-eqz v0, :cond_2e

    const/4 v0, 0x0

    iput-object v0, p0, Lyn4;->j:Lcom/google/android/gms/cast/framework/CastSession;

    iget-object v1, p0, Lyn4;->c:Li7f;

    invoke-static {v1, v1}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v1

    :goto_1e
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2e

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/opera/android/media/PlayerContainerView;

    invoke-virtual {v2, v0}, Lcom/opera/android/media/PlayerContainerView;->e(Lcom/google/android/gms/cast/framework/CastSession;)V

    goto :goto_1e

    :cond_2e
    iget-object p0, p0, Lyn4;->f:Lxbf;

    if-eqz p0, :cond_81

    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Ltjg;

    iget-object v0, p0, Ltjg;->a:Landroid/content/Context;

    iget-object v1, p0, Ltjg;->x:Lnjg;

    if-eqz v1, :cond_43

    iget-object v2, v1, Lnjg;->t:Lcom/google/android/gms/cast/framework/SessionManager;

    const-class v3, Lcom/google/android/gms/cast/framework/CastSession;

    invoke-virtual {v2, v1, v3}, Lcom/google/android/gms/cast/framework/SessionManager;->removeSessionManagerListener(Lcom/google/android/gms/cast/framework/SessionManagerListener;Ljava/lang/Class;)V

    :cond_43
    new-instance v1, Lnjg;

    invoke-direct {v1, p0, p1}, Lnjg;-><init>(Ltjg;Lcom/google/android/gms/cast/framework/CastSession;)V

    iput-object v1, p0, Ltjg;->x:Lnjg;

    iget-object p1, p0, Ltjg;->h:Lzo4;

    if-eqz p1, :cond_52

    invoke-virtual {p2}, Lzn4;->a()V

    return-void

    :cond_52
    new-instance p1, Lxmf;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lzo4;

    invoke-static {}, Lcom/google/android/gms/cast/framework/CastContext;->getSharedInstance()Lcom/google/android/gms/cast/framework/CastContext;

    move-result-object v2

    invoke-virtual {p0}, Ltjg;->c()Ljx6;

    move-result-object v3

    invoke-direct {v1, v0, v2, p1, v3}, Lzo4;-><init>(Landroid/content/Context;Lcom/google/android/gms/cast/framework/CastContext;Lxmf;Ljx6;)V

    new-instance v2, Lokg;

    new-instance v3, Lkjg;

    const/4 v4, 0x3

    invoke-direct {v3, p0, v4}, Lkjg;-><init>(Ltjg;B)V

    new-instance v4, La32;

    const/16 v5, 0x19

    invoke-direct {v4, p0, v1, p2, v5}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v2, v0, v3, v4}, Lokg;-><init>(Landroid/content/Context;Lkjg;Ljr9;)V

    new-instance p2, Lmjg;

    invoke-direct {p2, v2}, Lmjg;-><init>(Lokg;)V

    iput-object p2, p1, Lxmf;->a:Lmjg;

    invoke-virtual {p0, v1, v2}, Ltjg;->m(Lg83;Lokg;)V

    return-void

    :cond_81
    invoke-virtual {p2}, Lzn4;->a()V

    :cond_84
    return-void
.end method

.method public final S(Lcom/google/android/gms/cast/framework/CastSession;)V
    .registers 4

    iget-object v0, p0, Lxn4;->s:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb18;

    if-nez v0, :cond_14

    new-instance v0, La18;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, La18;-><init>(Lxn4;Lcom/google/android/gms/cast/framework/CastSession;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :cond_14
    const/4 v1, 0x1

    iput-boolean v1, v0, Lb18;->b:Z

    invoke-virtual {p0, p1, v0}, Lxn4;->R(Lcom/google/android/gms/cast/framework/CastSession;Lb18;)V

    return-void
.end method

.method public final onSessionEnded(Lcom/google/android/gms/cast/framework/Session;I)V
    .registers 3

    check-cast p1, Lcom/google/android/gms/cast/framework/CastSession;

    invoke-virtual {p0, p1}, Lxn4;->O(Lcom/google/android/gms/cast/framework/CastSession;)V

    return-void
.end method

.method public final onSessionResumeFailed(Lcom/google/android/gms/cast/framework/Session;I)V
    .registers 3

    check-cast p1, Lcom/google/android/gms/cast/framework/CastSession;

    invoke-virtual {p0, p1}, Lxn4;->O(Lcom/google/android/gms/cast/framework/CastSession;)V

    return-void
.end method

.method public final onSessionResumed(Lcom/google/android/gms/cast/framework/Session;Z)V
    .registers 3

    check-cast p1, Lcom/google/android/gms/cast/framework/CastSession;

    invoke-virtual {p0, p1}, Lxn4;->S(Lcom/google/android/gms/cast/framework/CastSession;)V

    return-void
.end method

.method public final onSessionResuming(Lcom/google/android/gms/cast/framework/Session;Ljava/lang/String;)V
    .registers 3

    check-cast p1, Lcom/google/android/gms/cast/framework/CastSession;

    invoke-virtual {p0, p1}, Lxn4;->Q(Lcom/google/android/gms/cast/framework/CastSession;)V

    return-void
.end method

.method public final bridge synthetic onSessionStartFailed(Lcom/google/android/gms/cast/framework/Session;I)V
    .registers 3

    check-cast p1, Lcom/google/android/gms/cast/framework/CastSession;

    invoke-virtual {p0, p1, p2}, Lxn4;->y(Lcom/google/android/gms/cast/framework/CastSession;I)V

    return-void
.end method

.method public final onSessionStarted(Lcom/google/android/gms/cast/framework/Session;Ljava/lang/String;)V
    .registers 3

    check-cast p1, Lcom/google/android/gms/cast/framework/CastSession;

    invoke-virtual {p0, p1}, Lxn4;->S(Lcom/google/android/gms/cast/framework/CastSession;)V

    return-void
.end method

.method public final bridge synthetic onSessionStarting(Lcom/google/android/gms/cast/framework/Session;)V
    .registers 2

    check-cast p1, Lcom/google/android/gms/cast/framework/CastSession;

    invoke-virtual {p0, p1}, Lxn4;->A(Lcom/google/android/gms/cast/framework/CastSession;)V

    return-void
.end method

.method public final onSessionSuspended(Lcom/google/android/gms/cast/framework/Session;I)V
    .registers 3

    check-cast p1, Lcom/google/android/gms/cast/framework/CastSession;

    invoke-virtual {p0, p1}, Lxn4;->O(Lcom/google/android/gms/cast/framework/CastSession;)V

    return-void
.end method

.method public final v(Lcom/google/android/gms/cast/framework/CastSession;I)V
    .registers 3

    invoke-virtual {p0, p1}, Lxn4;->O(Lcom/google/android/gms/cast/framework/CastSession;)V

    return-void
.end method

.method public final w(Lcom/google/android/gms/cast/framework/CastSession;Z)V
    .registers 3

    invoke-virtual {p0, p1}, Lxn4;->S(Lcom/google/android/gms/cast/framework/CastSession;)V

    return-void
.end method

.method public final x(Lcom/google/android/gms/cast/framework/CastSession;Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p0, p1}, Lxn4;->Q(Lcom/google/android/gms/cast/framework/CastSession;)V

    return-void
.end method

.method public final y(Lcom/google/android/gms/cast/framework/CastSession;I)V
    .registers 3

    invoke-virtual {p0, p1}, Lxn4;->O(Lcom/google/android/gms/cast/framework/CastSession;)V

    iget-object p0, p0, Lxn4;->t:Lyn4;

    iget-object p1, p0, Lyn4;->j:Lcom/google/android/gms/cast/framework/CastSession;

    if-eqz p1, :cond_22

    const/4 p1, 0x0

    iput-object p1, p0, Lyn4;->j:Lcom/google/android/gms/cast/framework/CastSession;

    iget-object p0, p0, Lyn4;->c:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_12
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_22

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/opera/android/media/PlayerContainerView;

    invoke-virtual {p2, p1}, Lcom/opera/android/media/PlayerContainerView;->e(Lcom/google/android/gms/cast/framework/CastSession;)V

    goto :goto_12

    :cond_22
    return-void
.end method

.method public final z(Lcom/google/android/gms/cast/framework/CastSession;Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p0, p1}, Lxn4;->S(Lcom/google/android/gms/cast/framework/CastSession;)V

    return-void
.end method
