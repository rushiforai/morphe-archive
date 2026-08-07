.class public Lcom/cmic/sso/sdk/a/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cmic/sso/sdk/a/b$a;


# static fields
.field private static a:Lcom/cmic/sso/sdk/a/c;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation
.end field


# instance fields
.field private b:Lcom/cmic/sso/sdk/a/a;

.field private c:Lcom/cmic/sso/sdk/a/a;

.field private d:Lcom/cmic/sso/sdk/a/b;

.field private e:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/cmic/sso/sdk/a/c;->e:Landroid/content/Context;

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/cmic/sso/sdk/a/c;->b()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static a(Landroid/content/Context;)Lcom/cmic/sso/sdk/a/c;
    .locals 2

    .line 1
    sget-object v0, Lcom/cmic/sso/sdk/a/c;->a:Lcom/cmic/sso/sdk/a/c;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/cmic/sso/sdk/a/c;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/cmic/sso/sdk/a/c;->a:Lcom/cmic/sso/sdk/a/c;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/cmic/sso/sdk/a/c;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Lcom/cmic/sso/sdk/a/c;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/cmic/sso/sdk/a/c;->a:Lcom/cmic/sso/sdk/a/c;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0

    .line 26
    :cond_1
    :goto_2
    sget-object p0, Lcom/cmic/sso/sdk/a/c;->a:Lcom/cmic/sso/sdk/a/c;

    .line 27
    .line 28
    return-object p0
.end method

.method private b()V
    .locals 2

    .line 1
    const-string v0, "sdk_config_version"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cmic/sso/sdk/e/k;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    const-string v1, "quick_login_android_9.5.5.3"

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-static {v0}, Lcom/cmic/sso/sdk/a/b;->a(Z)Lcom/cmic/sso/sdk/a/b;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/cmic/sso/sdk/a/c;->d:Lcom/cmic/sso/sdk/a/b;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/cmic/sso/sdk/a/b;->b()Lcom/cmic/sso/sdk/a/a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Lcom/cmic/sso/sdk/a/c;->b:Lcom/cmic/sso/sdk/a/a;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 v1, 0x1

    .line 38
    invoke-static {v1}, Lcom/cmic/sso/sdk/a/b;->a(Z)Lcom/cmic/sso/sdk/a/b;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iput-object v1, p0, Lcom/cmic/sso/sdk/a/c;->d:Lcom/cmic/sso/sdk/a/b;

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/cmic/sso/sdk/a/b;->a()Lcom/cmic/sso/sdk/a/a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iput-object v1, p0, Lcom/cmic/sso/sdk/a/c;->b:Lcom/cmic/sso/sdk/a/a;

    .line 49
    .line 50
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_1

    .line 55
    .line 56
    invoke-direct {p0}, Lcom/cmic/sso/sdk/a/c;->c()V

    .line 57
    .line 58
    .line 59
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/cmic/sso/sdk/a/c;->d:Lcom/cmic/sso/sdk/a/b;

    .line 60
    .line 61
    invoke-virtual {v0, p0}, Lcom/cmic/sso/sdk/a/b;->a(Lcom/cmic/sso/sdk/a/b$a;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/cmic/sso/sdk/a/c;->d:Lcom/cmic/sso/sdk/a/b;

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/cmic/sso/sdk/a/b;->a()Lcom/cmic/sso/sdk/a/a;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iput-object v0, p0, Lcom/cmic/sso/sdk/a/c;->c:Lcom/cmic/sso/sdk/a/a;

    .line 71
    .line 72
    return-void
.end method

.method private c()V
    .locals 2

    .line 1
    const-string v0, "UmcConfigManager"

    .line 2
    .line 3
    const-string v1, "delete localConfig"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/cmic/sso/sdk/a/c;->d:Lcom/cmic/sso/sdk/a/b;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/cmic/sso/sdk/a/b;->c()V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a()Lcom/cmic/sso/sdk/a/a;
    .locals 1

    .line 29
    :try_start_0
    iget-object v0, p0, Lcom/cmic/sso/sdk/a/c;->b:Lcom/cmic/sso/sdk/a/a;

    invoke-virtual {v0}, Lcom/cmic/sso/sdk/a/a;->m()Lcom/cmic/sso/sdk/a/a;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 30
    :catch_0
    iget-object p0, p0, Lcom/cmic/sso/sdk/a/c;->c:Lcom/cmic/sso/sdk/a/a;

    return-object p0
.end method

.method public a(Lcom/cmic/sso/sdk/a/a;)V
    .locals 0

    .line 31
    iput-object p1, p0, Lcom/cmic/sso/sdk/a/c;->b:Lcom/cmic/sso/sdk/a/a;

    return-void
.end method

.method public a(Lcom/cmic/sso/sdk/a;)V
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/cmic/sso/sdk/a/c;->d:Lcom/cmic/sso/sdk/a/b;

    invoke-virtual {p0, p1}, Lcom/cmic/sso/sdk/a/b;->a(Lcom/cmic/sso/sdk/a;)V

    return-void
.end method
