.class Ll/ysq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zsq0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ysq0$c;,
        Ll/ysq0$b;
    }
.end annotation


# static fields
.field private static h:Z


# instance fields
.field private a:Landroid/content/Context;

.field private b:Landroid/content/ServiceConnection;

.field private volatile c:I

.field private volatile d:Ljava/lang/String;

.field private volatile e:Z

.field private volatile f:Ljava/lang/String;

.field private final g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/ysq0;->c:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Ll/ysq0;->d:Ljava/lang/String;

    .line 9
    .line 10
    iput-boolean v0, p0, Ll/ysq0;->e:Z

    .line 11
    .line 12
    iput-object v1, p0, Ll/ysq0;->f:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v0, Ljava/lang/Object;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/ysq0;->g:Ljava/lang/Object;

    .line 20
    .line 21
    iput-object p1, p0, Ll/ysq0;->a:Landroid/content/Context;

    .line 22
    .line 23
    invoke-direct {p0}, Ll/ysq0;->d()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic a(Ll/ysq0;I)I
    .locals 0

    .line 10
    iput p1, p0, Ll/ysq0;->c:I

    return p1
.end method

.method public static synthetic b(Ll/ysq0;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ysq0;->g:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ll/ysq0;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ysq0;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method private d()V
    .locals 4

    .line 1
    new-instance v0, Ll/ysq0$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/ysq0$b;-><init>(Ll/ysq0;Ll/ysq0$a;)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Ll/ysq0;->b:Landroid/content/ServiceConnection;

    .line 8
    .line 9
    new-instance v0, Landroid/content/Intent;

    .line 10
    .line 11
    const-string v1, "com.uodis.opendevice.OPENIDS_SERVICE"

    .line 12
    .line 13
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v1, "com.huawei.hwid"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    :try_start_0
    iget-object v2, p0, Ll/ysq0;->a:Landroid/content/Context;

    .line 23
    .line 24
    iget-object v3, p0, Ll/ysq0;->b:Landroid/content/ServiceConnection;

    .line 25
    .line 26
    invoke-virtual {v2, v0, v3, v1}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 27
    .line 28
    .line 29
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    goto :goto_0

    .line 31
    :catch_0
    const/4 v0, 0x0

    .line 32
    :goto_0
    if-eqz v0, :cond_0

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_0
    const/4 v1, 0x2

    .line 36
    :goto_1
    iput v1, p0, Ll/ysq0;->c:I

    .line 37
    .line 38
    return-void
.end method

.method private e(Ljava/lang/String;)V
    .locals 4

    .line 1
    const-string v0, "huawei\'s "

    .line 2
    .line 3
    iget v1, p0, Ll/ysq0;->c:I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-ne v1, v2, :cond_0

    .line 7
    .line 8
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    if-eq v1, v2, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Ll/ysq0;->g:Ljava/lang/Object;

    .line 19
    .line 20
    monitor-enter v1

    .line 21
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p1, " wait..."

    .line 30
    .line 31
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/ysq0;->g:Ljava/lang/Object;

    .line 42
    .line 43
    const-wide/16 v2, 0xbb8

    .line 44
    .line 45
    invoke-virtual {p0, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catchall_0
    move-exception p0

    .line 50
    goto :goto_1

    .line 51
    :catch_0
    :goto_0
    :try_start_1
    monitor-exit v1

    .line 52
    goto :goto_2

    .line 53
    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    throw p0

    .line 55
    :cond_0
    :goto_2
    return-void
.end method

.method public static synthetic f(Ll/ysq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ysq0;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static g(Landroid/content/Context;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    const-string v1, "com.huawei.hwid"

    .line 7
    .line 8
    const/16 v2, 0x80

    .line 9
    .line 10
    invoke-virtual {p0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-object v1, p0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 15
    .line 16
    iget v1, v1, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    and-int/2addr v1, v2

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    move v1, v2

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v1, v0

    .line 25
    :goto_0
    iget p0, p0, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 26
    .line 27
    const v3, 0x13a5c90

    .line 28
    .line 29
    .line 30
    if-lt p0, v3, :cond_1

    .line 31
    .line 32
    move p0, v2

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move p0, v0

    .line 35
    :goto_1
    sput-boolean p0, Ll/ysq0;->h:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    return v2

    .line 40
    :catch_0
    :cond_2
    return v0
.end method

.method public static synthetic h(Ll/ysq0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ysq0;->e:Z

    .line 2
    .line 3
    return p1
.end method

.method private i()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ysq0;->b:Landroid/content/ServiceConnection;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    iget-object p0, p0, Ll/ysq0;->a:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    :catch_0
    :cond_0
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "getOAID"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/ysq0;->e(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ysq0;->d:Ljava/lang/String;

    .line 7
    .line 8
    return-object p0
.end method

.method public a()Z
    .locals 0

    .line 9
    sget-boolean p0, Ll/ysq0;->h:Z

    return p0
.end method
