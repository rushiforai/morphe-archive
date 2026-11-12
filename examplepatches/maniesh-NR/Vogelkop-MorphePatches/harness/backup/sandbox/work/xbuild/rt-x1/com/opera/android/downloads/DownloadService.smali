.class public Lcom/opera/android/downloads/DownloadService;
.super Lzp5;
.source "SourceFile"


# static fields
.field public static final e:Z

.field public static final f:Lbp;


# instance fields
.field public c:Lcg;

.field public d:Leg7;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x22

    if-lt v0, v1, :cond_12

    const-string v0, "Xiaomi"

    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_12

    const/4 v0, 0x0

    goto :goto_13

    :cond_12
    const/4 v0, 0x1

    :goto_13
    sput-boolean v0, Lcom/opera/android/downloads/DownloadService;->e:Z

    new-instance v0, Lbp;

    const-class v1, Lcom/opera/android/downloads/DownloadService;

    invoke-direct {v0, v1}, Lbp;-><init>(Ljava/lang/Class;)V

    sput-object v0, Lcom/opera/android/downloads/DownloadService;->f:Lbp;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    sget-object v0, Lcom/opera/android/downloads/DownloadService;->f:Lbp;

    invoke-direct {p0, v0}, Lzp5;-><init>(Lbp;)V

    const/4 p0, 0x0

    const-string v0, "<init>"

    invoke-static {p0, v0}, Lcom/opera/android/downloads/DownloadService;->e(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public static d(Landroid/content/Context;Z)V
    .registers 3

    sget-boolean v0, Lcom/opera/android/downloads/DownloadService;->e:Z

    if-eqz v0, :cond_20

    sget-object v0, Lcom/opera/android/downloads/DownloadService;->f:Lbp;

    if-eqz p1, :cond_17

    const-string p1, "start"

    invoke-static {p0, p1}, Lcom/opera/android/downloads/DownloadService;->e(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Lbp;->b0(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_16

    invoke-static {p0}, Lcom/opera/android/downloads/DownloadService;->g(Landroid/content/Context;)V

    :cond_16
    return-void

    :cond_17
    const-string p1, "stop"

    invoke-static {p0, p1}, Lcom/opera/android/downloads/DownloadService;->e(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Lbp;->c0(Landroid/content/Context;)V

    return-void

    :cond_20
    sget v0, Lcom/opera/android/downloads/DownloadJobService;->d:I

    invoke-static {p0, p1}, Lg8;->g(Landroid/content/Context;Z)V

    return-void
.end method

.method public static e(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    sget-object v0, Lcom/opera/android/downloads/DownloadService;->f:Lbp;

    invoke-virtual {v0, p0, p1}, Lbp;->T(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public static g(Landroid/content/Context;)V
    .registers 7

    new-instance v0, Lcm;

    const v1, 0x7f0a02ed

    const/4 v2, 0x5

    const/4 v3, 0x0

    invoke-direct {v0, v3, v1, v2}, Lcm;-><init>(Ljava/lang/String;IB)V

    const-string v1, "downloads_active"

    invoke-static {v1, v0}, Lzi4;->t(Ljava/lang/String;Lcm;)Lua7;

    move-result-object v0

    const v1, 0x1080081

    invoke-virtual {v0, v1}, Lua7;->S(I)V

    iget-object v1, v0, Lua7;->b:Ljava/lang/Object;

    check-cast v1, Ll1f;

    const/16 v2, 0x8

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Ll1f;->h(IZ)V

    const v2, 0x7f1405cc

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lua7;->P(Ljava/lang/CharSequence;)V

    const v2, 0x7f1405ca

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lua7;->O(Ljava/lang/CharSequence;)V

    const v2, 0x7f1405cb

    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Landroid/content/Intent;

    const-class v4, Lcom/opera/android/downloads/DownloadNotifierReceiver;

    invoke-direct {v3, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v4, "com.opera.android.action.RESUME_DOWNLOADS"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v4, 0x4000000

    const/4 v5, 0x0

    invoke-static {p0, v5, v3, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    invoke-virtual {v1, v5, v2, p0}, Ll1f;->a(ILjava/lang/String;Landroid/app/PendingIntent;)V

    invoke-static {}, Laib;->t()Lwub;

    move-result-object p0

    invoke-virtual {v0}, Lua7;->l()Li16;

    move-result-object v0

    invoke-virtual {p0, v0}, Lwub;->H(Li16;)V

    return-void
.end method


# virtual methods
.method public final c()V
    .registers 1

    invoke-static {p0}, Lcom/opera/android/downloads/DownloadService;->g(Landroid/content/Context;)V

    invoke-super {p0}, Lzp5;->c()V

    return-void
.end method

.method public final f()V
    .registers 8

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "ctrl_disconnect"

    invoke-static {v0, v1}, Lcom/opera/android/downloads/DownloadService;->e(Landroid/content/Context;Ljava/lang/String;)V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v0

    iget-object v0, v0, Lsf7;->a:Lrf7;

    invoke-virtual {v0}, Lrf7;->v()V

    :try_start_1a
    iget-object v1, v0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_24
    :goto_24
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lre7;

    invoke-virtual {v2}, Lre7;->m()Z

    move-result v3

    if-nez v3, :cond_3a

    iget-boolean v3, v2, Lre7;->w:Z

    if-eqz v3, :cond_24

    :cond_3a
    iget-object v3, v2, Lre7;->a:Lxf7;

    iget-object v3, v3, Lxf7;->b:Lcom/opera/android/downloads/DownloadPauseManager;

    iget-object v2, v2, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {v2}, Lcom/opera/android/downloads/DownloadItem;->getId()J

    move-result-wide v4

    iget-wide v2, v3, Lcom/opera/android/downloads/DownloadPauseManager;->a:J

    const/4 v6, 0x2

    invoke-static {v2, v3, v4, v5, v6}, LJ/N;->MUhg9A8g(JJI)V
    :try_end_4a
    .catchall {:try_start_1a .. :try_end_4a} :catchall_61

    goto :goto_24

    :cond_4b
    invoke-virtual {v0}, Lrf7;->w()V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/opera/android/downloads/DownloadJobService;->d:I

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lg8;->g(Landroid/content/Context;Z)V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/opera/android/downloads/DownloadService;->d(Landroid/content/Context;Z)V

    return-void

    :catchall_61
    move-exception p0

    invoke-virtual {v0}, Lrf7;->w()V

    throw p0
.end method

.method public final onCreate()V
    .registers 5

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "create"

    invoke-static {v0, v1}, Lcom/opera/android/downloads/DownloadService;->e(Landroid/content/Context;Ljava/lang/String;)V

    new-instance v0, Lcg;

    new-instance v1, Ldg7;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Ldg7;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, p0, v1}, Lcg;-><init>(Landroid/app/Service;Lcom/opera/api/Callback;)V

    iput-object v0, p0, Lcom/opera/android/downloads/DownloadService;->c:Lcg;

    const v1, 0x7f0a02ed

    invoke-virtual {v0}, Lcg;->g()Landroid/app/Notification;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Lzp5;->b(Landroid/app/Notification;I)V

    sget-object v0, Lcom/opera/android/downloads/DownloadService;->f:Lbp;

    iget v0, v0, Lbp;->a:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2b

    return-void

    :cond_2b
    iget-object v0, p0, Lcom/opera/android/downloads/DownloadService;->c:Lcg;

    iget-object v1, v0, Ln14;->b:Landroid/content/Context;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v1

    iget-object v2, v1, Lsf7;->c:Lfg7;

    iget-object v3, v0, Lcg;->i:Lbg;

    invoke-virtual {v2, v3}, Lfg7;->a(Lbg;)V

    iget-object v1, v1, Lsf7;->a:Lrf7;

    iget-object v0, v0, Lcg;->h:Lag;

    invoke-virtual {v1, v0}, Lrf7;->b(Lqf7;)V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->n:Lorg/chromium/base/CommandLine;

    if-nez v0, :cond_54

    const/4 v0, 0x0

    :cond_54
    invoke-static {p0, v0}, Lfsp;->g(Landroid/content/Context;Lorg/chromium/base/CommandLine;)V

    new-instance v0, Lwt2;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lwt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0, v0}, Le7d;->a(Landroid/content/Context;Lc7d;)V

    return-void
.end method

.method public final onDestroy()V
    .registers 4

    invoke-super {p0}, Lzp5;->onDestroy()V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "destroy"

    invoke-static {v0, v1}, Lcom/opera/android/downloads/DownloadService;->e(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/opera/android/downloads/DownloadService;->d:Leg7;

    const/4 v1, 0x0

    if-eqz v0, :cond_22

    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    if-eqz v0, :cond_22

    iget-object v2, p0, Lcom/opera/android/downloads/DownloadService;->d:Leg7;

    invoke-virtual {v0, v2}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    iput-object v1, p0, Lcom/opera/android/downloads/DownloadService;->d:Leg7;

    :cond_22
    iget-object v0, p0, Lcom/opera/android/downloads/DownloadService;->c:Lcg;

    invoke-virtual {v0}, Lcg;->h()V

    iput-object v1, p0, Lcom/opera/android/downloads/DownloadService;->c:Lcg;

    return-void
.end method

.method public final onStartCommand(Landroid/content/Intent;II)I
    .registers 7

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onStart["

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-nez p1, :cond_10

    const-string v2, "null"

    goto :goto_12

    :cond_10
    const-string v2, "avail"

    :goto_12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ",fl="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/opera/android/downloads/DownloadService;->e(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/opera/android/downloads/DownloadService;->c:Lcg;

    invoke-virtual {v0}, Lcg;->g()Landroid/app/Notification;

    move-result-object v0

    const v1, 0x7f0a02ed

    invoke-virtual {p0, v0, v1}, Lzp5;->b(Landroid/app/Notification;I)V

    invoke-super {p0, p1, p2, p3}, Lzp5;->onStartCommand(Landroid/content/Intent;II)I

    move-result p0

    return p0
.end method
