.class public Ll/wu5;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/wu5$c;,
        Ll/wu5$b;,
        Ll/wu5$a;
    }
.end annotation


# instance fields
.field public final a:Ll/wu5$c;

.field public b:Ll/wu5$b;

.field public c:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wu5$c;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ll/wu5$c;-><init>(Ll/yu5;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/wu5;->a:Ll/wu5$c;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Ll/wu5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wu5;->c()V

    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/longlink/msg/livegift/LongLinkConfession$ConfessionGiftReceiveMsg;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wu5;->a:Ll/wu5$c;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/wu5$c;->a(Lcom/p1/mobile/longlink/msg/livegift/LongLinkConfession$ConfessionGiftReceiveMsg;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/wu5;->a:Ll/wu5$c;

    .line 7
    .line 8
    monitor-enter p1

    .line 9
    :try_start_0
    iget-object p0, p0, Ll/wu5;->a:Ll/wu5$c;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 12
    .line 13
    .line 14
    monitor-exit p1

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    throw p0
.end method

.method public final synthetic c()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/wu5;->b:Ll/wu5$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/hdu;->b:Ll/hdu;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/hdu;->a(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wu5;->c:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/wu5;->b:Ll/wu5$b;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/wu5$b;->d()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Ll/wu5;->b:Ll/wu5$b;

    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Ll/wu5;->a:Ll/wu5$c;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/wu5$c;->b()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wu5;->a:Ll/wu5$c;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/wu5;->a:Ll/wu5$c;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public f(Ll/wu5$a;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wu5;->g()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wu5$b;

    .line 5
    .line 6
    iget-object v1, p0, Ll/wu5;->a:Ll/wu5$c;

    .line 7
    .line 8
    invoke-direct {v0, v1, p1}, Ll/wu5$b;-><init>(Ll/wu5$c;Ll/wu5$a;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/wu5;->b:Ll/wu5$b;

    .line 12
    .line 13
    new-instance p1, Ll/vu5;

    .line 14
    .line 15
    invoke-direct {p1, p0}, Ll/vu5;-><init>(Ll/wu5;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/wu5;->c:Ljava/lang/Runnable;

    .line 19
    .line 20
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 21
    .line 22
    const-wide/16 v0, 0x3e8

    .line 23
    .line 24
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public g()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wu5;->b:Ll/wu5$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wu5$b;->d()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
