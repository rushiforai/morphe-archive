.class public Lcom/xiaomi/push/service/ax;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/service/ax$a;
    }
.end annotation


# static fields
.field private static a:Lcom/xiaomi/push/service/ax;

.field private static a:Ljava/lang/String;


# instance fields
.field private a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/xiaomi/push/service/ax$a;",
            ">;"
        }
    .end annotation
.end field

.field private a:Ll/ezq0;

.field private a:Ll/vsq0$d;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/xiaomi/push/service/ax;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/xiaomi/push/service/ax;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/xiaomi/push/service/ax;->a:Lcom/xiaomi/push/service/ax;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/xiaomi/push/service/ax;->a:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public static a()Lcom/xiaomi/push/service/ax;
    .locals 1

    .line 70
    sget-object v0, Lcom/xiaomi/push/service/ax;->a:Lcom/xiaomi/push/service/ax;

    return-object v0
.end method

.method public static declared-synchronized a()Ljava/lang/String;
    .locals 5

    .line 1
    const-class v0, Lcom/xiaomi/push/service/ax;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/xiaomi/push/service/ax;->a:Ljava/lang/String;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/t5r0;->b()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "XMPushServiceConfig"

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "DeviceUUID"

    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    sput-object v2, Lcom/xiaomi/push/service/ax;->a:Ljava/lang/String;

    .line 27
    .line 28
    if-nez v2, :cond_0

    .line 29
    .line 30
    invoke-static {}, Ll/t5r0;->b()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-static {v2, v3}, Ll/u3r0;->h(Landroid/content/Context;Z)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    sput-object v2, Lcom/xiaomi/push/service/ax;->a:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const-string v2, "DeviceUUID"

    .line 47
    .line 48
    sget-object v3, Lcom/xiaomi/push/service/ax;->a:Ljava/lang/String;

    .line 49
    .line 50
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catchall_0
    move-exception v1

    .line 59
    goto :goto_1

    .line 60
    :cond_0
    :goto_0
    sget-object v1, Lcom/xiaomi/push/service/ax;->a:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    .line 62
    monitor-exit v0

    .line 63
    return-object v1

    .line 64
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    throw v1
.end method

.method public static synthetic a(Lcom/xiaomi/push/service/ax;)Ljava/util/List;
    .locals 0

    .line 88
    iget-object p0, p0, Lcom/xiaomi/push/service/ax;->a:Ljava/util/List;

    return-object p0
.end method

.method public static synthetic a(Lcom/xiaomi/push/service/ax;)Ll/ezq0;
    .locals 0

    .line 67
    iget-object p0, p0, Lcom/xiaomi/push/service/ax;->a:Ll/ezq0;

    return-object p0
.end method

.method public static synthetic a(Lcom/xiaomi/push/service/ax;Ll/ezq0;)Ll/ezq0;
    .locals 0

    .line 68
    iput-object p1, p0, Lcom/xiaomi/push/service/ax;->a:Ll/ezq0;

    return-object p1
.end method

.method public static synthetic a(Lcom/xiaomi/push/service/ax;Ll/vsq0$d;)Ll/vsq0$d;
    .locals 0

    .line 66
    iput-object p1, p0, Lcom/xiaomi/push/service/ax;->a:Ll/vsq0$d;

    return-object p1
.end method

.method public static synthetic a(Lcom/xiaomi/push/service/ax;)V
    .locals 0

    .line 69
    invoke-direct {p0}, Lcom/xiaomi/push/service/ax;->e()V

    return-void
.end method

.method private b()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/service/ax;->a:Ll/ezq0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/xiaomi/push/service/ax;->d()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private c()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/service/ax;->a:Ll/vsq0$d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Lcom/xiaomi/push/service/ax$1;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/ax$1;-><init>(Lcom/xiaomi/push/service/ax;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/xiaomi/push/service/ax;->a:Ll/vsq0$d;

    .line 12
    .line 13
    invoke-static {v0}, Ll/o2r0;->b(Ll/vsq0$d;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private d()V
    .locals 4

    .line 1
    const-string v0, "load config failure: "

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    invoke-static {}, Ll/t5r0;->b()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    const-string v3, "XMCloudCfg"

    .line 9
    .line 10
    invoke-virtual {v2, v3}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    new-instance v3, Ljava/io/BufferedInputStream;

    .line 15
    .line 16
    invoke-direct {v3, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 17
    .line 18
    .line 19
    :try_start_1
    invoke-static {v3}, Ll/suq0;->g(Ljava/io/InputStream;)Ll/suq0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v1}, Ll/ezq0;->r(Ll/suq0;)Ll/ezq0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, p0, Lcom/xiaomi/push/service/ax;->a:Ll/ezq0;

    .line 28
    .line 29
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    .line 31
    .line 32
    :goto_0
    invoke-static {v3}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 33
    .line 34
    .line 35
    goto :goto_2

    .line 36
    :catchall_0
    move-exception p0

    .line 37
    move-object v1, v3

    .line 38
    goto :goto_3

    .line 39
    :catch_0
    move-exception v1

    .line 40
    goto :goto_1

    .line 41
    :catchall_1
    move-exception p0

    .line 42
    goto :goto_3

    .line 43
    :catch_1
    move-exception v2

    .line 44
    move-object v3, v1

    .line 45
    move-object v1, v2

    .line 46
    :goto_1
    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :goto_2
    iget-object v0, p0, Lcom/xiaomi/push/service/ax;->a:Ll/ezq0;

    .line 67
    .line 68
    if-nez v0, :cond_0

    .line 69
    .line 70
    new-instance v0, Ll/ezq0;

    .line 71
    .line 72
    invoke-direct {v0}, Ll/ezq0;-><init>()V

    .line 73
    .line 74
    .line 75
    iput-object v0, p0, Lcom/xiaomi/push/service/ax;->a:Ll/ezq0;

    .line 76
    .line 77
    :cond_0
    return-void

    .line 78
    :goto_3
    invoke-static {v1}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 79
    .line 80
    .line 81
    throw p0
.end method

.method private e()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/push/service/ax;->a:Ll/ezq0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/t5r0;->b()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "XMCloudCfg"

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ljava/io/BufferedOutputStream;

    .line 17
    .line 18
    invoke-direct {v1, v0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Lcom/xiaomi/push/c;->n(Ljava/io/OutputStream;)Lcom/xiaomi/push/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object p0, p0, Lcom/xiaomi/push/service/ax;->a:Ll/ezq0;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/ezq0;->e(Lcom/xiaomi/push/c;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/xiaomi/push/c;->q()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void

    .line 37
    :catch_0
    move-exception p0

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v1, "save config failure: "

    .line 41
    .line 42
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 75
    invoke-direct {p0}, Lcom/xiaomi/push/service/ax;->b()V

    .line 76
    iget-object p0, p0, Lcom/xiaomi/push/service/ax;->a:Ll/ezq0;

    if-eqz p0, :cond_0

    .line 77
    invoke-virtual {p0}, Ll/ezq0;->u()I

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public a()Ll/ezq0;
    .locals 0

    .line 78
    invoke-direct {p0}, Lcom/xiaomi/push/service/ax;->b()V

    .line 79
    iget-object p0, p0, Lcom/xiaomi/push/service/ax;->a:Ll/ezq0;

    return-object p0
.end method

.method public declared-synchronized a()V
    .locals 1

    monitor-enter p0

    .line 73
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/push/service/ax;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public declared-synchronized a(Lcom/xiaomi/push/service/ax$a;)V
    .locals 1

    monitor-enter p0

    .line 71
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/push/service/ax;->a:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public a(Ll/gzq0;)V
    .locals 3

    .line 80
    invoke-virtual {p1}, Ll/gzq0;->u()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ll/gzq0;->t()I

    move-result v0

    invoke-virtual {p0}, Lcom/xiaomi/push/service/ax;->a()I

    move-result v1

    if-le v0, v1, :cond_0

    .line 81
    invoke-direct {p0}, Lcom/xiaomi/push/service/ax;->c()V

    .line 82
    :cond_0
    monitor-enter p0

    .line 83
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/push/service/ax;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lcom/xiaomi/push/service/ax$a;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/xiaomi/push/service/ax$a;

    .line 84
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    array-length p0, v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p0, :cond_1

    aget-object v2, v0, v1

    .line 86
    invoke-virtual {v2, p1}, Lcom/xiaomi/push/service/ax$a;->a(Ll/gzq0;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void

    :catchall_0
    move-exception p1

    .line 87
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
