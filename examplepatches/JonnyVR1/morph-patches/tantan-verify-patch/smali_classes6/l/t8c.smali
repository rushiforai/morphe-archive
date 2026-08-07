.class public Ll/t8c;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile e:Ll/t8c;


# instance fields
.field public a:Z

.field public b:Ljava/lang/String;

.field public c:I

.field public d:Ll/t2m;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/t8c;->c:I

    .line 6
    .line 7
    return-void
.end method

.method public static e()Ll/t8c;
    .locals 2

    .line 1
    sget-object v0, Ll/t8c;->e:Ll/t8c;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/t8c;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/t8c;->e:Ll/t8c;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/t8c;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/t8c;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/t8c;->e:Ll/t8c;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

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
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/t8c;->e:Ll/t8c;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t8c;->d:Ll/t2m;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1}, Ll/t2m;->v3(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b()Z
    .locals 2

    .line 1
    iget-object p0, p0, Ll/t8c;->d:Ll/t2m;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 8
    .line 9
    const-string v1, "follow"

    .line 10
    .line 11
    iput-object v1, v0, Ll/jka;->I1:Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/t2m;->j0()V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public c(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/t8c;->a:Z

    .line 3
    .line 4
    iput-object p1, p0, Ll/t8c;->b:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/t8c;->b()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public d()Z
    .locals 2

    .line 1
    iget-object p0, p0, Ll/t8c;->d:Ll/t2m;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 8
    .line 9
    const-string v1, "dating"

    .line 10
    .line 11
    iput-object v1, v0, Ll/jka;->I1:Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/t2m;->j0()V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public f(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t8c;->d:Ll/t2m;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1, p2}, Ll/t2m;->O0(Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/t8c;->d:Ll/t2m;

    .line 3
    .line 4
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t8c;->d:Ll/t2m;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0}, Ll/t2m;->g2()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public i(Ll/t2m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t8c;->d:Ll/t2m;

    .line 2
    .line 3
    return-void
.end method
