.class Ll/ftq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zsq0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ftq0$d;,
        Ll/ftq0$b;,
        Ll/ftq0$c;
    }
.end annotation


# static fields
.field private static f:Z


# instance fields
.field private a:Landroid/content/Context;

.field private b:Landroid/content/ServiceConnection;

.field private volatile c:I

.field private volatile d:Ll/ftq0$b;

.field private final e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/ftq0;->c:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Ll/ftq0;->d:Ll/ftq0$b;

    .line 9
    .line 10
    new-instance v0, Ljava/lang/Object;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/ftq0;->e:Ljava/lang/Object;

    .line 16
    .line 17
    iput-object p1, p0, Ll/ftq0;->a:Landroid/content/Context;

    .line 18
    .line 19
    invoke-direct {p0}, Ll/ftq0;->g()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic a(Ll/ftq0;I)I
    .locals 0

    .line 18
    iput p1, p0, Ll/ftq0;->c:I

    return p1
.end method

.method public static synthetic b(Ll/ftq0;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ftq0;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ll/ftq0;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ftq0;->e:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/ftq0;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ftq0;->k()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Ll/ftq0;)Ll/ftq0$b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ftq0;->d:Ll/ftq0$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Ll/ftq0;Ll/ftq0$b;)Ll/ftq0$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ftq0;->d:Ll/ftq0$b;

    .line 2
    .line 3
    return-object p1
.end method

.method private g()V
    .locals 4

    .line 1
    new-instance v0, Ll/ftq0$c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/ftq0$c;-><init>(Ll/ftq0;Ll/ftq0$a;)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Ll/ftq0;->b:Landroid/content/ServiceConnection;

    .line 8
    .line 9
    new-instance v0, Landroid/content/Intent;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v1, "com.heytap.openid"

    .line 15
    .line 16
    const-string v2, "com.heytap.openid.IdentifyService"

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    const-string v1, "action.com.heytap.openid.OPEN_ID_SERVICE"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    :try_start_0
    iget-object v2, p0, Ll/ftq0;->a:Landroid/content/Context;

    .line 28
    .line 29
    iget-object v3, p0, Ll/ftq0;->b:Landroid/content/ServiceConnection;

    .line 30
    .line 31
    invoke-virtual {v2, v0, v3, v1}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 32
    .line 33
    .line 34
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    goto :goto_0

    .line 36
    :catch_0
    const/4 v0, 0x0

    .line 37
    :goto_0
    if-eqz v0, :cond_0

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_0
    const/4 v1, 0x2

    .line 41
    :goto_1
    iput v1, p0, Ll/ftq0;->c:I

    .line 42
    .line 43
    return-void
.end method

.method private h(Ljava/lang/String;)V
    .locals 4

    .line 1
    const-string v0, "oppo\'s "

    .line 2
    .line 3
    iget v1, p0, Ll/ftq0;->c:I

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
    iget-object v1, p0, Ll/ftq0;->e:Ljava/lang/Object;

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
    iget-object p0, p0, Ll/ftq0;->e:Ljava/lang/Object;

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

.method public static synthetic i(Ll/ftq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ftq0;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static j(Landroid/content/Context;)Z
    .locals 6

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
    const-string v1, "com.heytap.openid"

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
    if-eqz p0, :cond_3

    .line 15
    .line 16
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 17
    .line 18
    const/16 v2, 0x1c

    .line 19
    .line 20
    if-lt v1, v2, :cond_0

    .line 21
    .line 22
    invoke-static {p0}, Lcom/appsflyer/internal/h;->a(Landroid/content/pm/PackageInfo;)J

    .line 23
    .line 24
    .line 25
    move-result-wide v1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget v1, p0, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 28
    .line 29
    int-to-long v1, v1

    .line 30
    :goto_0
    iget-object p0, p0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 31
    .line 32
    iget p0, p0, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 33
    .line 34
    const/4 v3, 0x1

    .line 35
    and-int/2addr p0, v3

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    move p0, v3

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    move p0, v0

    .line 41
    :goto_1
    const-wide/16 v4, 0x1

    .line 42
    .line 43
    cmp-long v1, v1, v4

    .line 44
    .line 45
    if-ltz v1, :cond_2

    .line 46
    .line 47
    move v1, v3

    .line 48
    goto :goto_2

    .line 49
    :cond_2
    move v1, v0

    .line 50
    :goto_2
    sput-boolean v1, Ll/ftq0;->f:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    return v3

    .line 55
    :catch_0
    :cond_3
    return v0
.end method

.method private k()Ljava/lang/String;
    .locals 5

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/ftq0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/ftq0;->a:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/16 v1, 0x40

    .line 14
    .line 15
    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 20
    .line 21
    const-string v0, "SHA1"

    .line 22
    .line 23
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    aget-object p0, p0, v2

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/content/pm/Signature;->toByteArray()[B

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->digest([B)[B

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    :goto_0
    array-length v0, p0

    .line 44
    if-ge v2, v0, :cond_0

    .line 45
    .line 46
    aget-byte v0, p0, v2

    .line 47
    .line 48
    and-int/lit16 v0, v0, 0xff

    .line 49
    .line 50
    or-int/lit16 v0, v0, 0x100

    .line 51
    .line 52
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const/4 v3, 0x3

    .line 57
    const/4 v4, 0x1

    .line 58
    invoke-virtual {v0, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    add-int/lit8 v2, v2, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    return-object p0

    .line 73
    :catch_0
    const-string p0, ""

    .line 74
    .line 75
    return-object p0
.end method

.method private l()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ftq0;->b:Landroid/content/ServiceConnection;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    iget-object p0, p0, Ll/ftq0;->a:Landroid/content/Context;

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
    invoke-direct {p0, v0}, Ll/ftq0;->h(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ftq0;->d:Ll/ftq0$b;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Ll/ftq0;->d:Ll/ftq0$b;

    .line 13
    .line 14
    iget-object p0, p0, Ll/ftq0$b;->b:Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method public a()Z
    .locals 0

    .line 17
    sget-boolean p0, Ll/ftq0;->f:Z

    return p0
.end method
