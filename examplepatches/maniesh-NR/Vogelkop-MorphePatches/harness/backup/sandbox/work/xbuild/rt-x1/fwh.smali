.class public final Lfwh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lsm5;


# instance fields
.field public final a:Ltm5;

.field public final b:Lyhe;

.field public final c:Lvl9;

.field public d:Z

.field public e:Z

.field public f:J

.field public g:J

.field public h:Z


# direct methods
.method public constructor <init>(Ltm5;Lyhe;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lvl9;

    const/16 v1, 0x18

    invoke-direct {v0, p0, v1}, Lvl9;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lfwh;->c:Lvl9;

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lfwh;->f:J

    iput-object p1, p0, Lfwh;->a:Ltm5;

    iput-object p2, p0, Lfwh;->b:Lyhe;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 2

    invoke-virtual {p0}, Lfwh;->d()V

    if-eqz p1, :cond_8

    invoke-virtual {p0}, Lfwh;->c()V

    :cond_8
    return-void
.end method

.method public final b(Z)V
    .registers 8

    iget-object v0, p0, Lfwh;->c:Lvl9;

    if-eqz p1, :cond_40

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lfwh;->g:J

    sub-long/2addr v3, v1

    const-wide/16 v1, 0x0

    cmp-long p1, v3, v1

    const/4 v1, 0x1

    if-gtz p1, :cond_2d

    const-wide/16 v2, 0x3

    iget-wide v4, p0, Lfwh;->f:J

    mul-long/2addr v4, v2

    const-wide/32 v2, 0x927c0

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lfwh;->f:J

    iput-boolean v1, p0, Lfwh;->h:Z

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    add-long/2addr v4, v2

    iput-wide v4, p0, Lfwh;->g:J

    invoke-static {v0, v2, v3}, Lvml;->d(Ljava/lang/Runnable;J)V

    goto :goto_39

    :cond_2d
    iput-boolean v1, p0, Lfwh;->h:Z

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lfwh;->g:J

    invoke-static {v0, v3, v4}, Lvml;->d(Ljava/lang/Runnable;J)V

    :goto_39
    invoke-virtual {p0}, Lfwh;->d()V

    invoke-virtual {p0}, Lfwh;->c()V

    return-void

    :cond_40
    iget-boolean p1, p0, Lfwh;->e:Z

    const/4 v1, 0x0

    if-eqz p1, :cond_60

    iput-boolean v1, p0, Lfwh;->e:Z

    iget-object p1, p0, Lfwh;->a:Ltm5;

    iget-object v2, p1, Ltm5;->d:Ljava/util/HashSet;

    invoke-virtual {v2, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v2}, Ljava/util/HashSet;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_60

    iget-object v2, p1, Ltm5;->c:Lrle;

    if-eqz v2, :cond_60

    iget-object v2, v2, Lrle;->a:Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;

    invoke-static {v2}, Lorg/chromium/net/NetworkChangeNotifier;->removeConnectionTypeObserver(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V

    const/4 v2, 0x0

    iput-object v2, p1, Ltm5;->c:Lrle;

    :cond_60
    iget-boolean p1, p0, Lfwh;->h:Z

    if-nez p1, :cond_65

    return-void

    :cond_65
    iput-boolean v1, p0, Lfwh;->h:Z

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final c()V
    .registers 3

    iget-boolean v0, p0, Lfwh;->d:Z

    if-eqz v0, :cond_21

    iget-object v0, p0, Lfwh;->a:Ltm5;

    iget-object v1, v0, Ltm5;->c:Lrle;

    if-nez v1, :cond_10

    invoke-static {}, Lsle;->d()Z

    move-result v1

    iput-boolean v1, v0, Ltm5;->a:Z

    :cond_10
    iget-boolean v1, v0, Ltm5;->a:Z

    if-eqz v1, :cond_21

    iget-boolean v0, v0, Ltm5;->b:Z

    if-eqz v0, :cond_21

    iget-object p0, p0, Lfwh;->b:Lyhe;

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lt7j;

    invoke-virtual {p0}, Lt7j;->c()V

    :cond_21
    return-void
.end method

.method public final d()V
    .registers 7

    iget-boolean v0, p0, Lfwh;->d:Z

    iget-object v1, p0, Lfwh;->a:Ltm5;

    if-eqz v0, :cond_c

    iget-object v0, v1, Ltm5;->e:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_c
    iget-object v0, v1, Ltm5;->e:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :goto_11
    iget-boolean v0, p0, Lfwh;->d:Z

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_37

    iget-boolean v0, v1, Ltm5;->b:Z

    if-eqz v0, :cond_37

    iget-boolean v0, p0, Lfwh;->e:Z

    if-nez v0, :cond_54

    iput-boolean v3, p0, Lfwh;->e:Z

    iget-object v0, v1, Ltm5;->d:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, v1, Ltm5;->c:Lrle;

    if-nez v0, :cond_54

    invoke-static {v1}, Lsle;->a(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)Lrle;

    move-result-object v0

    iput-object v0, v1, Ltm5;->c:Lrle;

    invoke-static {}, Lsle;->d()Z

    move-result v0

    iput-boolean v0, v1, Ltm5;->a:Z

    goto :goto_54

    :cond_37
    iget-boolean v0, p0, Lfwh;->e:Z

    if-eqz v0, :cond_54

    iput-boolean v2, p0, Lfwh;->e:Z

    iget-object v0, v1, Ltm5;->d:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object v0, v1, Ltm5;->c:Lrle;

    if-eqz v0, :cond_54

    iget-object v0, v0, Lrle;->a:Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifier;->removeConnectionTypeObserver(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V

    const/4 v0, 0x0

    iput-object v0, v1, Ltm5;->c:Lrle;

    :cond_54
    :goto_54
    iget-object v0, v1, Ltm5;->c:Lrle;

    if-nez v0, :cond_5e

    invoke-static {}, Lsle;->d()Z

    move-result v0

    iput-boolean v0, v1, Ltm5;->a:Z

    :cond_5e
    iget-boolean v0, v1, Ltm5;->a:Z

    iget-boolean v4, p0, Lfwh;->d:Z

    iget-object v5, p0, Lfwh;->c:Lvl9;

    if-eqz v4, :cond_81

    if-eqz v0, :cond_81

    iget-boolean v0, v1, Ltm5;->b:Z

    if-eqz v0, :cond_80

    iget-boolean v0, p0, Lfwh;->h:Z

    if-nez v0, :cond_80

    const-wide/16 v0, 0x2710

    iput-wide v0, p0, Lfwh;->f:J

    iput-boolean v3, p0, Lfwh;->h:Z

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    add-long/2addr v2, v0

    iput-wide v2, p0, Lfwh;->g:J

    invoke-static {v5, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    :cond_80
    return-void

    :cond_81
    iget-boolean v0, p0, Lfwh;->h:Z

    if-eqz v0, :cond_8a

    iput-boolean v2, p0, Lfwh;->h:Z

    invoke-static {v5}, Lvml;->a(Ljava/lang/Runnable;)V

    :cond_8a
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lfwh;->f:J

    return-void
.end method
