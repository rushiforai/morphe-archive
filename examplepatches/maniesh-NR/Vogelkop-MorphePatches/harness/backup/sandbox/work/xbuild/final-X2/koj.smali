.class public final synthetic Lkoj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 7
    iput-byte p1, p0, Lkoj;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lbp2;I)V
    .registers 3

    const/4 p1, 0x6

    iput-byte p1, p0, Lkoj;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lbp2;Ljava/lang/Object;B)V
    .registers 4

    .line 8
    iput-byte p3, p0, Lkoj;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Lkoj;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a()V
    .registers 1

    return-void
.end method

.method private final b()V
    .registers 1

    return-void
.end method

.method private final c()V
    .registers 1

    return-void
.end method

.method private final d()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 8

    iget-byte p0, p0, Lkoj;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch p0, :pswitch_data_140

    sput-boolean v0, Lfip;->f:Z

    invoke-static {}, Lfip;->e()V

    return-void

    :pswitch_e
    const-string p0, "StoredCPDAds.txt"

    invoke-static {p0}, Lvtp;->t(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_1f

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1f

    invoke-static {p0}, Lsjo;->g(Ljava/io/File;)V

    :cond_1f
    const/4 p0, 0x3

    invoke-static {p0}, Lsjo;->b(I)Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_55

    new-instance v1, Lo3b;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Lo3b;-><init>(B)V

    invoke-virtual {p0, v1}, Ljava/io/File;->list(Ljava/io/FilenameFilter;)[Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_55

    array-length v1, p0

    :goto_33
    if-ge v0, v1, :cond_55

    aget-object v3, p0, v0

    invoke-static {v3}, Lvtp;->t(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    if-eqz v4, :cond_52

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_52

    new-instance v4, Lt3p;

    invoke-direct {v4, v2}, Lt3p;-><init>(B)V

    new-instance v5, Lfmn;

    const/16 v6, 0x13

    invoke-direct {v5, v3, v4, v6}, Lfmn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v5}, Lgxo;->a(Ljava/lang/Runnable;)V

    :cond_52
    add-int/lit8 v0, v0, 0x1

    goto :goto_33

    :cond_55
    :pswitch_55
    return-void

    :pswitch_56
    sget-object p0, Lezo;->a:Ljava/util/List;

    new-instance p0, Ltyo;

    new-instance v0, Lxyo;

    invoke-direct {v0}, Lxyo;-><init>()V

    invoke-direct {p0, v0}, Lejo;-><init>(Ljava/lang/Object;)V

    const-string v0, "https://res.adx.opera.com/om/omjs/Service/omsdk-v2.js"

    invoke-static {v0}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_6e

    invoke-static {p0}, Lhyg;->b(Lmjo;)V

    goto :goto_77

    :cond_6e
    new-instance v1, Ljro;

    const/4 v3, 0x4

    invoke-direct {v1, v0, p0, v2, v3}, Ljro;-><init>(Ljava/lang/String;Lmjo;II)V

    invoke-static {v1}, Lhyg;->c(Ljro;)V

    :goto_77
    return-void

    :pswitch_78
    new-instance p0, Lh9o;

    const/16 v0, 0x15

    invoke-direct {p0, v0}, Lh9o;-><init>(B)V

    const-string v0, "https://res.adx.opera.com/om/omjs/Service/omsdk-v2.js"

    new-instance v1, Lh9o;

    const/16 v2, 0x17

    invoke-direct {v1, v2}, Lh9o;-><init>(B)V

    invoke-static {v0}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9a

    sget-object v2, Lgxo;->c:Lgxo;

    new-instance v3, Lh4m;

    const/16 v4, 0xd

    invoke-direct {v3, v0, v1, p0, v4}, Lh4m;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Lgxo;->b(Ljava/lang/Runnable;)V

    :cond_9a
    return-void

    :pswitch_9b
    invoke-static {v2}, Lsjo;->b(I)Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_c2

    invoke-static {p0}, Lsjo;->g(Ljava/io/File;)V

    invoke-static {v2}, Lsjo;->b(I)Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_c2

    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    sget-object p0, Ljava/io/File;->separator:Ljava/lang/String;

    const-string v2, ".nomedia"

    invoke-static {v1, p0, v2}, Lz1m;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    :try_start_bf
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z
    :try_end_c2
    .catch Ljava/io/IOException; {:try_start_bf .. :try_end_c2} :catch_c2

    :catch_c2
    :cond_c2
    return-void

    :pswitch_c3
    :try_start_c3
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;
    :try_end_c6
    .catch Ljava/lang/Exception; {:try_start_c3 .. :try_end_c6} :catch_c6

    :catch_c6
    return-void

    :pswitch_c7
    sget-object p0, Lxne;->b:Lii;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_d8

    check-cast p0, Lt9f;

    iget-object p0, p0, Lt9f;->E:Lfm5;

    iget-object p0, p0, Lfm5;->a:Lokhttp3/internal/connection/RealConnectionPool;

    invoke-virtual {p0}, Lokhttp3/internal/connection/RealConnectionPool;->evictAll()V

    :cond_d8
    return-void

    :pswitch_d9
    invoke-static {}, LJ/N;->MnfJQqTB()Z

    move-result p0

    sget-object v0, Lyxl;->b:Lyxl;

    if-nez v0, :cond_f4

    if-eqz p0, :cond_101

    new-instance p0, Lyxl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sput-object p0, Lyxl;->b:Lyxl;

    invoke-static {}, Landroid/os/Looper;->myQueue()Landroid/os/MessageQueue;

    move-result-object p0

    sget-object v0, Lyxl;->b:Lyxl;

    invoke-virtual {p0, v0}, Landroid/os/MessageQueue;->addIdleHandler(Landroid/os/MessageQueue$IdleHandler;)V

    goto :goto_101

    :cond_f4
    if-nez p0, :cond_101

    invoke-static {}, Landroid/os/Looper;->myQueue()Landroid/os/MessageQueue;

    move-result-object p0

    sget-object v0, Lyxl;->b:Lyxl;

    invoke-virtual {p0, v0}, Landroid/os/MessageQueue;->removeIdleHandler(Landroid/os/MessageQueue$IdleHandler;)V

    sput-object v1, Lyxl;->b:Lyxl;

    :cond_101
    :goto_101
    :pswitch_101
    return-void

    :pswitch_102
    throw v1

    :pswitch_103
    sget-object p0, Lrmj;->a:Ln9h;

    iget-object v0, p0, Ln9h;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_108
    iget-object v1, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast v1, Lwub;

    invoke-virtual {v1}, Lwub;->F()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_114
    :goto_114
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_132

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/NotificationChannel;

    invoke-virtual {v2}, Landroid/app/NotificationChannel;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ln9h;->n(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_114

    iget-object v3, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast v3, Lwub;

    invoke-virtual {v3, v2}, Lwub;->A(Ljava/lang/String;)V

    goto :goto_114

    :cond_132
    monitor-exit v0

    return-void

    :goto_134
    monitor-exit v0
    :try_end_135
    .catchall {:try_start_108 .. :try_end_135} :catchall_136

    throw p0

    :catchall_136
    move-exception p0

    goto :goto_134

    :pswitch_138
    return-void

    :pswitch_139
    sput-object v1, Lxbf;->h:Lxbf;

    return-void

    :pswitch_13c
    invoke-static {}, LJ/N;->MZdYbHPD()V

    return-void

    :pswitch_data_140
    .packed-switch 0x0
        :pswitch_13c
        :pswitch_139
        :pswitch_138
        :pswitch_103
        :pswitch_102
        :pswitch_101
        :pswitch_101
        :pswitch_d9
        :pswitch_c7
        :pswitch_c3
        :pswitch_9b
        :pswitch_78
        :pswitch_56
        :pswitch_55
        :pswitch_e
    .end packed-switch
.end method
