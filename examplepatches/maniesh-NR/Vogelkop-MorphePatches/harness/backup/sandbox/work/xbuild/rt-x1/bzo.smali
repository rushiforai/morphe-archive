.class public abstract Lbzo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmro;


# instance fields
.field public final a:Landroid/content/Context;

.field public b:Lbn;

.field public c:Lltm;

.field public d:Lw06;

.field public e:D

.field public f:Lfio;

.field public final g:Ljava/lang/String;

.field public final h:Lpqo;

.field public final i:Lmhk;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;

.field public n:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ldro;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lrbe;->B:Lrbe;

    iput-object v0, p0, Lbzo;->b:Lbn;

    new-instance v0, Lpqo;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const/4 v1, 0x7

    iput-byte v1, v0, Lpqo;->e:B

    const/4 v1, 0x1

    iput-boolean v1, v0, Lpqo;->f:Z

    iput-object v0, p0, Lbzo;->h:Lpqo;

    sget-object v1, Lphf;->a:Lx79;

    iget-object v1, v1, Lx79;->b:Ljava/lang/Object;

    check-cast v1, Lmhk;

    iput-object v1, p0, Lbzo;->i:Lmhk;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lbzo;->a:Landroid/content/Context;

    iput-object p2, p0, Lbzo;->g:Ljava/lang/String;

    iput-object p2, v0, Lpqo;->a:Ljava/lang/String;

    iput-object p3, v0, Lpqo;->d:Ldro;

    return-void
.end method


# virtual methods
.method public a()Ll0p;
    .registers 3

    new-instance v0, Lga6;

    const/16 v1, 0x15

    invoke-direct {v0, p0, v1}, Lga6;-><init>(Ljava/lang/Object;B)V

    return-object v0
.end method

.method public abstract b(Lvho;Lpqo;)Z
.end method

.method public c(Lpqo;)Lqyo;
    .registers 5

    new-instance p1, Lqyo;

    invoke-direct {p1, p0}, Lqyo;-><init>(Lbzo;)V

    new-instance v0, Le1p;

    iget-object v1, p0, Lbzo;->i:Lmhk;

    invoke-virtual {p0}, Lbzo;->a()Ll0p;

    move-result-object v2

    iget-object p0, p0, Lbzo;->a:Landroid/content/Context;

    invoke-direct {v0, p0, v1, v2}, Le1p;-><init>(Landroid/content/Context;Lmhk;Ll0p;)V

    iput-object v0, p1, Lejo;->a:Ljava/lang/Object;

    return-object p1
.end method

.method public final d(DD)V
    .registers 8

    iget-object p0, p0, Lbzo;->h:Lpqo;

    iput-wide p1, p0, Lpqo;->c:D

    iput-wide p3, p0, Lpqo;->b:D

    sget-object p0, Lg1p;->h:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_f

    return-void

    :cond_f
    sget-object p0, Lphf;->a:Lx79;

    iget-object p0, p0, Lx79;->c:Ljava/lang/Object;

    check-cast p0, Ltfp;

    iget-object v0, p0, Ltfp;->a:Landroid/os/HandlerThread;

    const/16 v1, 0x3e8

    if-eqz v0, :cond_31

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_31

    iget-object v0, p0, Ltfp;->b:Lxy0;

    if-eqz v0, :cond_4a

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_4a

    iget-object v0, p0, Ltfp;->b:Lxy0;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    goto :goto_4a

    :cond_31
    new-instance v0, Landroid/os/HandlerThread;

    const-string v2, "GeoLocationHandlerThread"

    invoke-direct {v0, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Ltfp;->a:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    new-instance v0, Lxy0;

    iget-object v2, p0, Ltfp;->a:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v2, p0}, Lxy0;-><init>(Landroid/os/Looper;Ltfp;)V

    iput-object v0, p0, Ltfp;->b:Lxy0;

    :cond_4a
    :goto_4a
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    iput v1, v0, Landroid/os/Message;->what:I

    const/4 v1, 0x2

    new-array v1, v1, [D

    const/4 v2, 0x0

    aput-wide p1, v1, v2

    const/4 p1, 0x1

    aput-wide p3, v1, p1

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p0, p0, Ltfp;->b:Lxy0;

    const-wide/16 p1, 0x0

    invoke-virtual {p0, v0, p1, p2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void
.end method

.method public final e(Lltm;)V
    .registers 5

    iget-object v0, p0, Lbzo;->a:Landroid/content/Context;

    iput-object p1, p0, Lbzo;->c:Lltm;

    sget-object p1, Lgxo;->c:Lgxo;

    :try_start_6
    invoke-static {v0}, Landroid/webkit/WebSettings;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1
    :try_end_a
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_a} :catch_b

    goto :goto_c

    :catch_b
    const/4 p1, 0x0

    :goto_c
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_38

    sget-object p1, Lsjo;->a:Ljava/util/List;

    const-string p1, " OPR/"

    :try_start_16
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    :try_end_1d
    .catch Ljava/lang/RuntimeException; {:try_start_16 .. :try_end_1d} :catch_38

    :try_start_1d
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p1

    iget-object p1, p1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_2c} :catch_2d

    goto :goto_2f

    :catch_2d
    :try_start_2d
    const-string p1, ""

    :goto_2f
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    sget-object p1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object p1, Landroid/os/Build;->ID:Ljava/lang/String;
    :try_end_38
    .catch Ljava/lang/RuntimeException; {:try_start_2d .. :try_end_38} :catch_38

    :catch_38
    :cond_38
    iget-object p0, p0, Lbzo;->c:Lltm;

    invoke-interface {p0}, Lltm;->k()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_4e

    sget-object p1, Lg1p;->g:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4e

    sput-object p0, Lg1p;->g:Ljava/lang/String;

    :cond_4e
    return-void
.end method
