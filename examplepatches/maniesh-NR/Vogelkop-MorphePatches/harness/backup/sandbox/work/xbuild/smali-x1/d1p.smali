.class public abstract Ld1p;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lt5p;

.field public static final b:Lt5p;

.field public static c:Z

.field public static final d:Ljava/util/LinkedHashSet;

.field public static final e:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lt5p;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    const/4 v2, -0x1

    const/4 v3, 0x0

    invoke-direct {v0, v2, v1, v3}, Lt5p;-><init>(ILjava/lang/Boolean;Z)V

    sput-object v0, Ld1p;->a:Lt5p;

    new-instance v0, Lt5p;

    const/4 v1, 0x0

    invoke-direct {v0, v3, v1, v3}, Lt5p;-><init>(ILjava/lang/Boolean;Z)V

    sput-object v0, Ld1p;->b:Lt5p;

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    sput-object v0, Ld1p;->d:Ljava/util/LinkedHashSet;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Ld1p;->e:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method public static a(Landroid/content/Context;Landroid/net/NetworkCapabilities;)Lt5p;
    .registers 8

    new-instance v0, Lt5p;

    const/4 v1, 0x3

    invoke-virtual {p1, v1}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v2

    const/4 v3, 0x4

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v2, :cond_e

    move p0, v5

    goto :goto_38

    :cond_e
    invoke-virtual {p1, v5}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v2

    if-eqz v2, :cond_16

    const/4 p0, 0x2

    goto :goto_38

    :cond_16
    invoke-virtual {p1, v4}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v2

    if-eqz v2, :cond_37

    :try_start_1c
    sget-object v2, Lr8p;->a:Ljava/util/List;

    const-string v2, "phone"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/telephony/TelephonyManager;

    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getDataNetworkType()I

    move-result p0
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_2a} :catch_35

    packed-switch p0, :pswitch_data_56

    :pswitch_2d
    goto :goto_35

    :pswitch_2e
    const/4 v1, 0x7

    goto :goto_35

    :pswitch_30
    const/4 v1, 0x6

    goto :goto_35

    :pswitch_32
    const/4 v1, 0x5

    goto :goto_35

    :pswitch_34
    move v1, v3

    :catch_35
    :goto_35
    move p0, v1

    goto :goto_38

    :cond_37
    move p0, v4

    :goto_38
    const/16 v1, 0xc

    invoke-virtual {p1, v1}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v1

    if-eqz v1, :cond_49

    const/16 v1, 0x10

    invoke-virtual {p1, v1}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v1

    if-eqz v1, :cond_49

    move v4, v5

    :cond_49
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p1, v3}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result p1

    invoke-direct {v0, p0, v1, p1}, Lt5p;-><init>(ILjava/lang/Boolean;Z)V

    return-object v0

    nop

    :pswitch_data_56
    .packed-switch 0x1
        :pswitch_34
        :pswitch_34
        :pswitch_32
        :pswitch_34
        :pswitch_32
        :pswitch_32
        :pswitch_34
        :pswitch_32
        :pswitch_32
        :pswitch_32
        :pswitch_34
        :pswitch_32
        :pswitch_30
        :pswitch_32
        :pswitch_32
        :pswitch_34
        :pswitch_32
        :pswitch_30
        :pswitch_2d
        :pswitch_2e
    .end packed-switch
.end method

.method public static b(Landroid/content/Context;Ln1p;)V
    .registers 8

    sget-object v0, Ld1p;->d:Ljava/util/LinkedHashSet;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    sget-object v0, Ld1p;->e:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt5p;

    const/4 v1, 0x3

    const/4 v2, 0x0

    if-eqz v0, :cond_21

    sget-object v3, Lw2p;->a:La64;

    new-instance v4, Leno;

    const/16 v5, 0x8

    invoke-direct {v4, p1, v0, v2, v5}, Leno;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v3, v2, v2, v4, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    goto :goto_2d

    :cond_21
    sget-object p1, Lw2p;->b:La64;

    new-instance v0, Lwr;

    const/16 v3, 0xa

    invoke-direct {v0, p0, v2, v3}, Lwr;-><init>(Landroid/content/Context;Lmt5;B)V

    invoke-static {p1, v2, v2, v0, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :goto_2d
    sget-boolean p1, Ld1p;->c:Z

    if-nez p1, :cond_46

    new-instance p1, Lb1p;

    invoke-direct {p1, p0}, Lb1p;-><init>(Landroid/content/Context;)V

    :try_start_36
    sget-object v0, Lr8p;->a:Ljava/util/List;

    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    invoke-virtual {p0, p1}, Landroid/net/ConnectivityManager;->registerDefaultNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    const/4 p0, 0x1

    sput-boolean p0, Ld1p;->c:Z
    :try_end_46
    .catch Ljava/lang/RuntimeException; {:try_start_36 .. :try_end_46} :catch_46

    :catch_46
    :cond_46
    return-void
.end method

.method public static c(Lt5p;)V
    .registers 5

    sget-object v0, Ld1p;->e:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt5p;

    invoke-static {v0, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    sget-object v0, Lw2p;->a:La64;

    new-instance v1, Lhmo;

    const/4 v2, 0x7

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p0}, Lhmo;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 p0, 0x3

    invoke-static {v0, v3, v3, v1, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_1b
    return-void
.end method

.method public static d(Landroid/content/Context;)Lt5p;
    .registers 3

    sget-object v0, Ld1p;->e:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt5p;

    if-eqz v0, :cond_b

    return-object v0

    :cond_b
    sget-object v0, Lr8p;->a:Ljava/util/List;

    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    :try_start_15
    sget-object v1, Lt0i;->b:Lp0i;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v1

    if-nez v1, :cond_20

    sget-object p0, Ld1p;->a:Lt5p;

    return-object p0

    :cond_20
    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v0
    :try_end_24
    .catchall {:try_start_15 .. :try_end_24} :catchall_25

    goto :goto_2e

    :catchall_25
    move-exception v0

    sget-object v1, Lt0i;->b:Lp0i;

    new-instance v1, Lq0i;

    invoke-direct {v1, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v1

    :goto_2e
    instance-of v1, v0, Lq0i;

    if-eqz v1, :cond_33

    const/4 v0, 0x0

    :cond_33
    check-cast v0, Landroid/net/NetworkCapabilities;

    if-nez v0, :cond_3a

    sget-object p0, Ld1p;->b:Lt5p;

    return-object p0

    :cond_3a
    invoke-static {p0, v0}, Ld1p;->a(Landroid/content/Context;Landroid/net/NetworkCapabilities;)Lt5p;

    move-result-object p0

    invoke-static {p0}, Ld1p;->c(Lt5p;)V

    return-object p0
.end method

.method public static e()Lt5p;
    .registers 1

    sget-object v0, Ld1p;->e:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt5p;

    if-nez v0, :cond_c

    sget-object v0, Ld1p;->b:Lt5p;

    :cond_c
    return-object v0
.end method
