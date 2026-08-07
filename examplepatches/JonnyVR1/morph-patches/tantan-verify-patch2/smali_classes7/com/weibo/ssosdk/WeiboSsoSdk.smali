.class public Lcom/weibo/ssosdk/WeiboSsoSdk;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/weibo/ssosdk/WeiboSsoSdk$d;
    }
.end annotation


# static fields
.field private static final AID_FILE_NAME:Ljava/lang/String; = "weibo_sso_sdk_aid"

.field private static final INIT_FILE_NAME:Ljava/lang/String; = "weibo_sso_sdk_init"

.field private static final LOGIN_URL:Ljava/lang/String; = "https://login.sina.com.cn/visitor/signin"

.field private static final SDK_ACT_UPLOAD:I = 0x2

.field private static final SDK_ACT_VISITORLOGIN:I = 0x1

.field public static final SDK_VERSION_CODE:Ljava/lang/String; = "1.0"

.field private static final TAG:Ljava/lang/String; = "WeiboSsoSdk"

.field private static final VERSION:I = 0x1

.field private static config:Ll/pwp0;

.field private static sInstance:Lcom/weibo/ssosdk/WeiboSsoSdk;


# instance fields
.field private isFirstUpload:Z

.field private mCallCount:I

.field private volatile mTaskLock:Ljava/util/concurrent/locks/ReentrantLock;

.field private mVisitorLoginInfo:Lcom/weibo/ssosdk/WeiboSsoSdk$d;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "wind"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private constructor <init>()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->mTaskLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 11
    .line 12
    iput-boolean v1, p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->isFirstUpload:Z

    .line 13
    .line 14
    sget-object v0, Lcom/weibo/ssosdk/WeiboSsoSdk;->config:Ll/pwp0;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/pwp0;->q()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput v0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->mCallCount:I

    .line 26
    .line 27
    new-instance v0, Ljava/lang/Thread;

    .line 28
    .line 29
    new-instance v1, Lcom/weibo/ssosdk/WeiboSsoSdk$a;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Lcom/weibo/ssosdk/WeiboSsoSdk$a;-><init>(Lcom/weibo/ssosdk/WeiboSsoSdk;)V

    .line 32
    .line 33
    .line 34
    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 38
    .line 39
    .line 40
    new-instance v0, Ljava/lang/Thread;

    .line 41
    .line 42
    new-instance v1, Lcom/weibo/ssosdk/WeiboSsoSdk$b;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Lcom/weibo/ssosdk/WeiboSsoSdk$b;-><init>(Lcom/weibo/ssosdk/WeiboSsoSdk;)V

    .line 45
    .line 46
    .line 47
    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    const-string p0, "config error"

    .line 55
    .line 56
    invoke-static {p0}, Ll/brq0;->a(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const/4 p0, 0x0

    .line 60
    throw p0
.end method

.method public static synthetic a(Lcom/weibo/ssosdk/WeiboSsoSdk;)Lcom/weibo/ssosdk/WeiboSsoSdk$d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->mVisitorLoginInfo:Lcom/weibo/ssosdk/WeiboSsoSdk$d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/weibo/ssosdk/WeiboSsoSdk;Lcom/weibo/ssosdk/WeiboSsoSdk$d;)Lcom/weibo/ssosdk/WeiboSsoSdk$d;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->mVisitorLoginInfo:Lcom/weibo/ssosdk/WeiboSsoSdk$d;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic c(Lcom/weibo/ssosdk/WeiboSsoSdk;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/weibo/ssosdk/WeiboSsoSdk;->k()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Lcom/weibo/ssosdk/WeiboSsoSdk;Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/weibo/ssosdk/WeiboSsoSdk;->l(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/weibo/ssosdk/WeiboSsoSdk;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->isFirstUpload:Z

    .line 2
    .line 3
    return p0
.end method

.method private declared-synchronized f(Ljava/lang/String;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 3
    .line 4
    .line 5
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    monitor-exit p0

    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    const/4 v1, 0x0

    .line 12
    :try_start_1
    invoke-direct {p0, v0}, Lcom/weibo/ssosdk/WeiboSsoSdk;->h(I)Ljava/io/File;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v2, Ljava/io/FileOutputStream;

    .line 17
    .line 18
    invoke-direct {v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 19
    .line 20
    .line 21
    :try_start_2
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v2, p1}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 26
    .line 27
    .line 28
    :try_start_3
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 29
    .line 30
    .line 31
    goto :goto_2

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    goto :goto_3

    .line 34
    :catchall_1
    move-exception p1

    .line 35
    move-object v1, v2

    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move-object v1, v2

    .line 38
    goto :goto_1

    .line 39
    :catchall_2
    move-exception p1

    .line 40
    :goto_0
    if-eqz v1, :cond_1

    .line 41
    .line 42
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 43
    .line 44
    .line 45
    :catch_1
    :cond_1
    :try_start_5
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 46
    :catch_2
    :goto_1
    if-eqz v1, :cond_2

    .line 47
    .line 48
    :try_start_6
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 49
    .line 50
    .line 51
    :catch_3
    :cond_2
    :goto_2
    monitor-exit p0

    .line 52
    return-void

    .line 53
    :goto_3
    :try_start_7
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 54
    throw p1
.end method

.method private g(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 1
    :try_start_0
    new-instance p0, Ljava/net/URL;

    .line 2
    .line 3
    const-string v0, "https://login.sina.com.cn/visitor/signin"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/net/HttpURLConnection;

    .line 13
    .line 14
    const-string v0, "POST"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/16 v0, 0xbb8

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 22
    .line 23
    .line 24
    const/16 v0, 0x3e8

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    invoke-virtual {p0, v0}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ljava/net/URLConnection;->setDoInput(Z)V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-virtual {p0, v0}, Ljava/net/URLConnection;->setUseCaches(Z)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {v1, p1}, Ljava/io/OutputStream;->write([B)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    const/16 v1, 0xc8

    .line 59
    .line 60
    if-ne p1, v1, :cond_1

    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    new-instance p1, Ljava/io/ByteArrayOutputStream;

    .line 67
    .line 68
    invoke-direct {p1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 69
    .line 70
    .line 71
    const/16 v1, 0x400

    .line 72
    .line 73
    new-array v1, v1, [B

    .line 74
    .line 75
    :goto_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    const/4 v3, -0x1

    .line 80
    if-eq v2, v3, :cond_0

    .line 81
    .line 82
    invoke-virtual {p1, v1, v0, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_0
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 90
    .line 91
    .line 92
    new-instance p0, Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-direct {p0, p1}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    .line 100
    .line 101
    return-object p0

    .line 102
    :catch_0
    :cond_1
    const/4 p0, 0x0

    .line 103
    return-object p0
.end method

.method private h(I)Ljava/io/File;
    .locals 3

    .line 1
    sget-object p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->config:Ll/pwp0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pwp0;->b()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ljava/io/File;

    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, "weibo_sso_sdk_aid"

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method

.method public static declared-synchronized i()Lcom/weibo/ssosdk/WeiboSsoSdk;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-class v0, Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/weibo/ssosdk/WeiboSsoSdk;->sInstance:Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 9
    .line 10
    invoke-direct {v1}, Lcom/weibo/ssosdk/WeiboSsoSdk;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/weibo/ssosdk/WeiboSsoSdk;->sInstance:Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object v1, Lcom/weibo/ssosdk/WeiboSsoSdk;->sInstance:Lcom/weibo/ssosdk/WeiboSsoSdk;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object v1

    .line 22
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw v1
.end method

.method public static declared-synchronized j(Ll/pwp0;)Z
    .locals 3

    .line 1
    const-class v0, Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    monitor-exit v0

    .line 8
    return v1

    .line 9
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ll/pwp0;->q()Z

    .line 10
    .line 11
    .line 12
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    if-nez v2, :cond_1

    .line 14
    .line 15
    monitor-exit v0

    .line 16
    return v1

    .line 17
    :cond_1
    :try_start_1
    sget-object v2, Lcom/weibo/ssosdk/WeiboSsoSdk;->config:Ll/pwp0;

    .line 18
    .line 19
    if-nez v2, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/pwp0;->clone()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ll/pwp0;

    .line 26
    .line 27
    sput-object p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->config:Ll/pwp0;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/pwp0;->b()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0}, Ll/ra00;->w(Landroid/content/Context;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    .line 35
    .line 36
    monitor-exit v0

    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    monitor-exit v0

    .line 42
    return v1

    .line 43
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 44
    throw p0
.end method

.method private k()Ljava/lang/String;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    :try_start_0
    invoke-direct {p0, v0}, Lcom/weibo/ssosdk/WeiboSsoSdk;->h(I)Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ljava/io/FileInputStream;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 10
    .line 11
    .line 12
    :try_start_1
    invoke-virtual {v0}, Ljava/io/FileInputStream;->available()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    new-array p0, p0, [B

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/io/FileInputStream;->read([B)I

    .line 19
    .line 20
    .line 21
    new-instance v1, Ljava/lang/String;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ljava/lang/String;-><init>([B)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    .line 25
    .line 26
    :try_start_2
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 27
    .line 28
    .line 29
    :catch_0
    return-object v1

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    move-object v1, v0

    .line 32
    goto :goto_0

    .line 33
    :catch_1
    move-object v1, v0

    .line 34
    goto :goto_1

    .line 35
    :catchall_1
    move-exception p0

    .line 36
    :goto_0
    if-eqz v1, :cond_0

    .line 37
    .line 38
    :try_start_3
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 39
    .line 40
    .line 41
    :catch_2
    :cond_0
    throw p0

    .line 42
    :catch_3
    :goto_1
    if-eqz v1, :cond_1

    .line 43
    .line 44
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    .line 45
    .line 46
    .line 47
    :catch_4
    :cond_1
    const-string p0, ""

    .line 48
    .line 49
    return-object p0
.end method

.method private l(Ljava/lang/String;I)V
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/weibo/ssosdk/WeiboSsoSdk;->config:Ll/pwp0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ll/pwp0;->a(Z)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->mTaskLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->tryLock()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->mTaskLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->mTaskLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    iput-boolean v1, p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->isFirstUpload:Z

    .line 35
    .line 36
    sget-object v0, Lcom/weibo/ssosdk/WeiboSsoSdk;->config:Ll/pwp0;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/pwp0;->b()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0}, Ll/ra00;->n(Landroid/content/Context;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    :try_start_0
    const-string v0, "utf-8"

    .line 47
    .line 48
    move-object/from16 v1, p1

    .line 49
    .line 50
    invoke-static {v1, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    :goto_0
    move-object v4, v0

    .line 55
    goto :goto_1

    .line 56
    :catch_0
    const-string v0, ""

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :goto_1
    sget-object v0, Lcom/weibo/ssosdk/WeiboSsoSdk;->config:Ll/pwp0;

    .line 60
    .line 61
    invoke-virtual {v0}, Ll/pwp0;->b()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    sget-object v0, Lcom/weibo/ssosdk/WeiboSsoSdk;->config:Ll/pwp0;

    .line 70
    .line 71
    const/4 v14, 0x1

    .line 72
    invoke-virtual {v0, v14}, Ll/pwp0;->a(Z)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    sget-object v0, Lcom/weibo/ssosdk/WeiboSsoSdk;->config:Ll/pwp0;

    .line 77
    .line 78
    invoke-virtual {v0, v14}, Ll/pwp0;->d(Z)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v6

    .line 82
    sget-object v0, Lcom/weibo/ssosdk/WeiboSsoSdk;->config:Ll/pwp0;

    .line 83
    .line 84
    invoke-virtual {v0, v14}, Ll/pwp0;->e(Z)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v7

    .line 88
    sget-object v0, Lcom/weibo/ssosdk/WeiboSsoSdk;->config:Ll/pwp0;

    .line 89
    .line 90
    invoke-virtual {v0, v14}, Ll/pwp0;->k(Z)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v8

    .line 94
    sget-object v0, Lcom/weibo/ssosdk/WeiboSsoSdk;->config:Ll/pwp0;

    .line 95
    .line 96
    invoke-virtual {v0, v14}, Ll/pwp0;->j(Z)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v9

    .line 100
    sget-object v0, Lcom/weibo/ssosdk/WeiboSsoSdk;->config:Ll/pwp0;

    .line 101
    .line 102
    invoke-virtual {v0, v14}, Ll/pwp0;->f(Z)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v10

    .line 106
    sget-object v0, Lcom/weibo/ssosdk/WeiboSsoSdk;->config:Ll/pwp0;

    .line 107
    .line 108
    invoke-virtual {v0, v14}, Ll/pwp0;->c(Z)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v11

    .line 112
    iget v13, p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->mCallCount:I

    .line 113
    .line 114
    move-object v1, p0

    .line 115
    move/from16 v12, p2

    .line 116
    .line 117
    invoke-direct/range {v1 .. v13}, Lcom/weibo/ssosdk/WeiboSsoSdk;->riseWind(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-direct {p0, v0}, Lcom/weibo/ssosdk/WeiboSsoSdk;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iget v2, p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->mCallCount:I

    .line 126
    .line 127
    add-int/2addr v2, v14

    .line 128
    iput v2, p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->mCallCount:I

    .line 129
    .line 130
    if-eqz v0, :cond_4

    .line 131
    .line 132
    :try_start_1
    invoke-static {v0}, Lcom/weibo/ssosdk/WeiboSsoSdk$d;->c(Ljava/lang/String;)Lcom/weibo/ssosdk/WeiboSsoSdk$d;

    .line 133
    .line 134
    .line 135
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 136
    if-eqz v0, :cond_2

    .line 137
    .line 138
    invoke-virtual {v0}, Lcom/weibo/ssosdk/WeiboSsoSdk$d;->a()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    if-nez v2, :cond_2

    .line 147
    .line 148
    invoke-virtual {v0}, Lcom/weibo/ssosdk/WeiboSsoSdk$d;->a()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    invoke-direct {p0, v2}, Lcom/weibo/ssosdk/WeiboSsoSdk;->f(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    :cond_2
    move/from16 v12, p2

    .line 156
    .line 157
    if-ne v12, v14, :cond_3

    .line 158
    .line 159
    iput-object v0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->mVisitorLoginInfo:Lcom/weibo/ssosdk/WeiboSsoSdk$d;

    .line 160
    .line 161
    :cond_3
    iget-object p0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->mTaskLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 162
    .line 163
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :catch_1
    move-exception v0

    .line 168
    iget-object p0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->mTaskLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 169
    .line 170
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 171
    .line 172
    .line 173
    throw v0

    .line 174
    :cond_4
    iget-object p0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->mTaskLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 175
    .line 176
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 177
    .line 178
    .line 179
    const-string p0, "network error."

    .line 180
    .line 181
    invoke-static {p0}, Ll/brq0;->a(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    return-void
.end method

.method private native riseWind(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)Ljava/lang/String;
.end method


# virtual methods
.method public m(Lcom/weibo/ssosdk/a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->mVisitorLoginInfo:Lcom/weibo/ssosdk/WeiboSsoSdk$d;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/weibo/ssosdk/WeiboSsoSdk$d;->a()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->mVisitorLoginInfo:Lcom/weibo/ssosdk/WeiboSsoSdk$d;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/weibo/ssosdk/WeiboSsoSdk$d;->b()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object p0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk;->mVisitorLoginInfo:Lcom/weibo/ssosdk/WeiboSsoSdk$d;

    .line 29
    .line 30
    invoke-interface {p1, p0}, Lcom/weibo/ssosdk/a;->handler(Lcom/weibo/ssosdk/WeiboSsoSdk$d;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    :goto_0
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Lcom/weibo/ssosdk/WeiboSsoSdk$c;

    .line 39
    .line 40
    invoke-direct {v1, p0, p1}, Lcom/weibo/ssosdk/WeiboSsoSdk$c;-><init>(Lcom/weibo/ssosdk/WeiboSsoSdk;Lcom/weibo/ssosdk/a;)V

    .line 41
    .line 42
    .line 43
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
