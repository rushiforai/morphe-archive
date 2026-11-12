.class public final Ld7d;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Ld7d;->a:B

    .line 13
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 14
    iput-object p1, p0, Ld7d;->b:Landroid/content/Context;

    return-void
.end method

.method public constructor <init>(Landroidx/fragment/app/r;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Ld7d;->a:B

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Ld7d;->b:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Ld7d;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_26

    check-cast p1, [Ljava/lang/Void;

    sget-object v0, Lcom/opera/android/browser/PrivateTabsBroadcastReceiver;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_b
    sget-boolean p1, Lcom/opera/android/browser/PrivateTabsBroadcastReceiver;->c:Z

    if-eqz p1, :cond_14

    iget-object p0, p0, Ld7d;->b:Landroid/content/Context;

    invoke-static {p0}, Lcom/opera/android/browser/PrivateTabsBroadcastReceiver;->a(Landroid/content/Context;)V

    :cond_14
    monitor-exit v0

    return-object v1

    :goto_16
    monitor-exit v0
    :try_end_17
    .catchall {:try_start_b .. :try_end_17} :catchall_18

    throw p0

    :catchall_18
    move-exception p0

    goto :goto_16

    :pswitch_1a
    check-cast p1, [Ljava/lang/Void;

    :try_start_1c
    sget-object p0, Lwbc;->g:Lwbc;

    invoke-virtual {p0}, Lwbc;->a()V
    :try_end_21
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_1c .. :try_end_21} :catch_22
    .catch Lh1h; {:try_start_1c .. :try_end_21} :catch_22

    goto :goto_24

    :catch_22
    move-exception p0

    move-object v1, p0

    :goto_24
    return-object v1

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_1a
    .end packed-switch
.end method

.method public final onPostExecute(Ljava/lang/Object;)V
    .registers 11

    iget-byte v0, p0, Ld7d;->a:B

    packed-switch v0, :pswitch_data_152

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    return-void

    :pswitch_9
    check-cast p1, Ljava/lang/Throwable;

    sget-object v0, Landroid/os/Build;->SUPPORTED_32_BIT_ABIS:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_f
    const/4 v3, 0x0

    if-ge v2, v1, :cond_2d

    aget-object v4, v0, v2

    const-string v5, "armeabi-v7a"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2d

    const-string v5, "x86"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2a

    const/4 p0, 0x3

    invoke-static {p0, v3}, Le7d;->b(ILjava/lang/Throwable;)V

    goto/16 :goto_151

    :cond_2a
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    :cond_2d
    const/4 v0, 0x1

    if-nez p1, :cond_14e

    iget-object p0, p0, Ld7d;->b:Landroid/content/Context;

    sget-object p1, Lks3;->k:Lks3;

    iget-object v1, p1, Lks3;->g:Ljava/lang/Object;

    check-cast v1, Lqz5;

    invoke-interface {v1}, Lqz5;->d()V

    new-instance v1, Lfv2;

    const/16 v2, 0x12

    invoke-direct {v1, p1, v2}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lvml;->e(Ljava/lang/Runnable;)V

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    sget-object v1, Lvml;->d:Lumi;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v2

    new-instance v4, Lk5o;

    const/16 v5, 0xc

    invoke-direct {v4, p0, v1, v5}, Lk5o;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v5, Ls9g;

    invoke-direct {v5, v1, v2, v4}, Ls9g;-><init>(Lumi;Lcom/opera/android/settings/SettingsManager;Lk5o;)V

    sput-object v5, Ls9g;->h:Ls9g;

    const-string v1, "version_code"

    invoke-virtual {v2, v1}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    sget-object v1, Ls9g;->h:Ls9g;

    iget-object v2, v1, Ls9g;->c:Lvzk;

    iget-object v1, v1, Ls9g;->e:Lk5o;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_6f
    new-instance v4, Ljava/io/ObjectInputStream;

    new-instance v5, Ljava/io/BufferedInputStream;

    iget-object v1, v1, Lk5o;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    const-string v6, "permissions.bin"

    invoke-virtual {v1, v6}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v1

    invoke-direct {v5, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v4, v5}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_83
    .catch Ljava/io/FileNotFoundException; {:try_start_6f .. :try_end_83} :catch_95
    .catch Ljava/lang/ClassNotFoundException; {:try_start_6f .. :try_end_83} :catch_95
    .catch Ljava/io/IOException; {:try_start_6f .. :try_end_83} :catch_95
    .catchall {:try_start_6f .. :try_end_83} :catchall_90

    :try_start_83
    invoke-static {v4}, Lk5o;->q(Ljava/io/ObjectInputStream;)Ljava/util/HashMap;

    move-result-object v1
    :try_end_87
    .catch Ljava/io/FileNotFoundException; {:try_start_83 .. :try_end_87} :catch_96
    .catch Ljava/lang/ClassNotFoundException; {:try_start_83 .. :try_end_87} :catch_96
    .catch Ljava/io/IOException; {:try_start_83 .. :try_end_87} :catch_96
    .catchall {:try_start_83 .. :try_end_87} :catchall_8d

    if-eqz v1, :cond_96

    invoke-static {v4}, Lxvg;->l(Ljava/io/Closeable;)V

    goto :goto_c5

    :catchall_8d
    move-exception p0

    move-object v3, v4

    goto :goto_91

    :catchall_90
    move-exception p0

    :goto_91
    invoke-static {v3}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :catch_95
    move-object v4, v3

    :catch_96
    :cond_96
    invoke-static {v4}, Lxvg;->l(Ljava/io/Closeable;)V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    new-instance v4, Ljag;

    invoke-direct {v4}, Ljag;-><init>()V

    sget-object v5, Llag;->b:Llag;

    sget-object v6, Lkag;->b:Lkag;

    iget-object v7, v4, Ljag;->a:Ljava/util/EnumMap;

    new-instance v8, Liag;

    invoke-direct {v8, v6, v0}, Liag;-><init>(Lkag;Z)V

    invoke-virtual {v7, v5, v8}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v5, "https://m.facebook.com/"

    new-instance v6, Ljag;

    invoke-direct {v6, v4}, Ljag;-><init>(Ljag;)V

    invoke-virtual {v1, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v5, "https://www.facebook.com/"

    new-instance v6, Ljag;

    invoke-direct {v6, v4}, Ljag;-><init>(Ljag;)V

    invoke-virtual {v1, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_c5
    iget-object v4, v2, Lvzk;->a:Ljava/lang/Object;

    monitor-enter v4

    :try_start_c8
    iget-object v5, v2, Lvzk;->b:Ljava/lang/Object;

    check-cast v5, Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->clear()V

    iget-object v2, v2, Lvzk;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    monitor-exit v4
    :try_end_d7
    .catchall {:try_start_c8 .. :try_end_d7} :catchall_14c

    sget-object v1, Lc0l;->e:Ldpj;

    invoke-virtual {v1, p0}, Ldpj;->j(Landroid/content/Context;)Lc0l;

    move-result-object v1

    iget-boolean v2, v1, Lc0l;->d:Z

    if-nez v2, :cond_102

    iput-boolean v0, v1, Lc0l;->d:Z

    iget-object v2, v1, Lc0l;->c:Lqie;

    iget-object v4, v1, Lc0l;->a:Lumi;

    new-instance v5, Lqlk;

    const/16 v6, 0x17

    invoke-direct {v5, v1, v6}, Lqlk;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v4, v5}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object v4

    new-instance v5, Loml;

    invoke-direct {v5, v4}, Loml;-><init>(Lnml;)V

    invoke-virtual {v2, v5, v3}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    invoke-virtual {v1}, Lc0l;->a()V

    sget-object v2, Ls9g;->h:Ls9g;

    invoke-virtual {v2, v1}, Ls9g;->a(Lq9g;)V

    :cond_102
    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, LJ/N;->MVDEKr1W(Ljava/lang/Object;)V

    iget-object v1, v1, Lcom/opera/android/settings/SettingsManager;->g:Lcom/opera/android/settings/SystemSettings;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, LJ/N;->MzXjq3Qm(Ljava/lang/Object;)V

    invoke-static {p0}, Lu59;->C(Landroid/content/Context;)Lu59;

    move-result-object p0

    new-instance v1, Lcom/opera/android/browser/FraudProtectionService;

    invoke-direct {v1, p0}, Lcom/opera/android/browser/FraudProtectionService;-><init>(Lu59;)V

    invoke-static {v1}, LJ/N;->M_MBrAUw(Ljava/lang/Object;)V

    new-instance p0, Lwy4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v1, Lrk3;->a:Ljava/util/concurrent/CompletableFuture;

    invoke-virtual {v1, p0}, Ljava/util/concurrent/CompletableFuture;->complete(Ljava/lang/Object;)Z

    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->init()Lorg/chromium/net/NetworkChangeNotifier;

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifier;->setAutoDetectConnectivityState(Z)V

    :try_start_130
    sget-object p0, Lorg/chromium/content/browser/BrowserStartupControllerImpl;->m:Lorg/chromium/content/browser/BrowserStartupControllerImpl;

    if-nez p0, :cond_13b

    new-instance p0, Lorg/chromium/content/browser/BrowserStartupControllerImpl;

    invoke-direct {p0}, Lorg/chromium/content/browser/BrowserStartupControllerImpl;-><init>()V

    sput-object p0, Lorg/chromium/content/browser/BrowserStartupControllerImpl;->m:Lorg/chromium/content/browser/BrowserStartupControllerImpl;

    :cond_13b
    new-instance v1, Lqy3;

    invoke-direct {v1, p1, v0}, Lqy3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v1}, Lorg/chromium/content/browser/BrowserStartupControllerImpl;->e(Lqy3;)V
    :try_end_143
    .catch Lh1h; {:try_start_130 .. :try_end_143} :catch_144

    goto :goto_151

    :catch_144
    move-exception p0

    const/4 p1, 0x2

    invoke-static {p1, p0}, Le7d;->b(ILjava/lang/Throwable;)V

    goto :goto_151

    :goto_14a
    :try_start_14a
    monitor-exit v4
    :try_end_14b
    .catchall {:try_start_14a .. :try_end_14b} :catchall_14c

    throw p0

    :catchall_14c
    move-exception p0

    goto :goto_14a

    :cond_14e
    invoke-static {v0, p1}, Le7d;->b(ILjava/lang/Throwable;)V

    :goto_151
    return-void

    :pswitch_data_152
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method
