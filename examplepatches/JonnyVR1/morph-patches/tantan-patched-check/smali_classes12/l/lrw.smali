.class public Ll/lrw;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final b:Ljava/lang/String; = "lrw"

.field private static volatile c:Ll/lrw;


# instance fields
.field private a:Ll/cyl;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/lrw;->l()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static declared-synchronized j()Ll/lrw;
    .locals 3

    .line 1
    const-class v0, Ll/lrw;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/lrw;->c:Ll/lrw;

    .line 5
    .line 6
    if-nez v1, :cond_1

    .line 7
    .line 8
    const-class v1, Ll/lrw;

    .line 9
    .line 10
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 11
    :try_start_1
    sget-object v2, Ll/lrw;->c:Ll/lrw;

    .line 12
    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    new-instance v2, Ll/lrw;

    .line 16
    .line 17
    invoke-direct {v2}, Ll/lrw;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v2, Ll/lrw;->c:Ll/lrw;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception v2

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    monitor-exit v1

    .line 26
    goto :goto_2

    .line 27
    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    :try_start_2
    throw v2

    .line 29
    :catchall_1
    move-exception v1

    .line 30
    goto :goto_3

    .line 31
    :cond_1
    :goto_2
    sget-object v1, Ll/lrw;->c:Ll/lrw;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 32
    .line 33
    monitor-exit v0

    .line 34
    return-object v1

    .line 35
    :goto_3
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 36
    throw v1
.end method

.method private l()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lrw;->a:Ll/cyl;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    const-string v0, "com.mm.MagicEffectRegisterProvider"

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/cyl;

    .line 16
    .line 17
    iput-object v0, p0, Ll/lrw;->a:Ll/cyl;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    sget-object v0, Ll/lrw;->b:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lrw;->a:Ll/cyl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public b()Ll/opl;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/lrw;->a:Ll/cyl;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p0}, Ll/cyl;->f()Ll/opl;

    .line 7
    .line 8
    .line 9
    :cond_0
    return-object v0
.end method

.method public c()Ll/tpl;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/lrw;->a:Ll/cyl;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p0}, Ll/cyl;->i()Ll/tpl;

    .line 7
    .line 8
    .line 9
    :cond_0
    return-object v0
.end method

.method public d()Ll/upl;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/lrw;->a:Ll/cyl;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p0}, Ll/cyl;->h()Ll/upl;

    .line 7
    .line 8
    .line 9
    :cond_0
    return-object v0
.end method

.method public e()Ll/p3m;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/lrw;->a:Ll/cyl;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p0}, Ll/cyl;->d()Ll/p3m;

    .line 7
    .line 8
    .line 9
    :cond_0
    return-object v0
.end method

.method public f()Ll/awl;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/lrw;->a:Ll/cyl;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p0}, Ll/cyl;->b()Ll/awl;

    .line 7
    .line 8
    .line 9
    :cond_0
    return-object v0
.end method

.method public g()Ll/o3m;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/lrw;->a:Ll/cyl;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p0}, Ll/cyl;->g()Ll/o3m;

    .line 7
    .line 8
    .line 9
    :cond_0
    return-object v0
.end method

.method public h()Lcom/immomo/components/interfaces/IProcessOutput;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lrw;->a:Ll/cyl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/cyl;->a()Lcom/immomo/components/interfaces/IProcessOutput;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public i()Ll/cam;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/lrw;->a:Ll/cyl;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p0}, Ll/cyl;->e()Ll/cam;

    .line 7
    .line 8
    .line 9
    :cond_0
    return-object v0
.end method

.method public k()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lrw;->a:Ll/cyl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/cyl;->j()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public m(Landroid/app/Application;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lrw;->a:Ll/cyl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/cyl;->c(Landroid/app/Application;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
