.class public Ll/nvq0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile k:Ll/nvq0;


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Ljava/lang/String;

.field private final c:Ljava/lang/String;

.field private final d:Ljava/lang/String;

.field private e:Landroid/content/Context;

.field private f:Ljava/lang/String;

.field private g:Ljava/lang/String;

.field private h:Ll/tsq0$c;

.field private i:Ll/tsq0$c;

.field private j:Ll/tsq0$c;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "push_stat_sp"

    .line 5
    .line 6
    iput-object v0, p0, Ll/nvq0;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "upload_time"

    .line 9
    .line 10
    iput-object v0, p0, Ll/nvq0;->b:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "delete_time"

    .line 13
    .line 14
    iput-object v0, p0, Ll/nvq0;->c:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "check_time"

    .line 17
    .line 18
    iput-object v0, p0, Ll/nvq0;->d:Ljava/lang/String;

    .line 19
    .line 20
    new-instance v0, Ll/nvq0$a;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/nvq0$a;-><init>(Ll/nvq0;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/nvq0;->h:Ll/tsq0$c;

    .line 26
    .line 27
    new-instance v0, Ll/nvq0$b;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/nvq0$b;-><init>(Ll/nvq0;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/nvq0;->i:Ll/tsq0$c;

    .line 33
    .line 34
    new-instance v0, Ll/nvq0$c;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/nvq0$c;-><init>(Ll/nvq0;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/nvq0;->j:Ll/tsq0$c;

    .line 40
    .line 41
    iput-object p1, p0, Ll/nvq0;->e:Landroid/content/Context;

    .line 42
    .line 43
    return-void
.end method

.method public static synthetic a(Ll/nvq0;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nvq0;->e:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ll/nvq0;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/nvq0;->n()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static d(Landroid/content/Context;)Ll/nvq0;
    .locals 2

    .line 1
    sget-object v0, Ll/nvq0;->k:Ll/nvq0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/nvq0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/nvq0;->k:Ll/nvq0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/nvq0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/nvq0;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/nvq0;->k:Ll/nvq0;

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
    sget-object p0, Ll/nvq0;->k:Ll/nvq0;

    .line 27
    .line 28
    return-object p0
.end method

.method public static synthetic e(Ll/nvq0;)Ll/wvq0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static synthetic i(Ll/nvq0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nvq0;->m(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private k()Z
    .locals 2

    .line 1
    iget-object p0, p0, Ll/nvq0;->e:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lcom/xiaomi/push/gk;->bn:Lcom/xiaomi/push/gk;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/xiaomi/push/gk;->a()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/xiaomi/push/service/ah;->a(IZ)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method private m(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/nvq0;->e:Landroid/content/Context;

    .line 2
    .line 3
    const-string v0, "push_stat_sp"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    invoke-interface {p0, p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 19
    .line 20
    .line 21
    invoke-static {p0}, Ll/n5r0;->a(Landroid/content/SharedPreferences$Editor;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private n()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/nvq0;->e:Landroid/content/Context;

    .line 2
    .line 3
    sget-object v0, Ll/ovq0;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nvq0;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Lcom/xiaomi/push/gj;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/nvq0;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p1}, Lcom/xiaomi/push/gj;->e()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lcom/xiaomi/push/service/az;->a(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    invoke-direct {p0}, Ll/nvq0;->n()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/nvq0;->e:Landroid/content/Context;

    .line 24
    .line 25
    invoke-static {v1, v0, p1}, Ll/tvq0;->i(Landroid/content/Context;Ljava/lang/String;Lcom/xiaomi/push/gj;)Ll/tvq0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Ll/nvq0;->j(Ll/vvq0$a;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public g(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/nvq0;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    iget-object v0, p0, Ll/nvq0;->e:Landroid/content/Context;

    .line 16
    .line 17
    invoke-static {v0, p1}, Ll/xvq0;->a(Landroid/content/Context;Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Ll/nvq0;->f(Lcom/xiaomi/push/gj;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public j(Ll/vvq0$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nvq0;->e:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Ll/vvq0;->c(Landroid/content/Context;)Ll/vvq0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/vvq0;->e(Ll/vvq0$a;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public l()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nvq0;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
