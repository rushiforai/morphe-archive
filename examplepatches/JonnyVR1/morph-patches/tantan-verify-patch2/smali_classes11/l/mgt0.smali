.class public final Ll/mgt0;
.super Ll/aas0;
.source "SourceFile"


# instance fields
.field public final c:Ll/bft0;

.field public final d:Ll/ugt0;

.field public final e:Ljava/lang/String;

.field public final f:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/bft0;Ll/ugt0;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/aas0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mgt0;->c:Ll/bft0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/mgt0;->d:Ll/ugt0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/mgt0;->e:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Ll/mgt0;->f:[Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {}, Ll/bxy0;->A()Ll/ngt0;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1, p0}, Ll/ngt0;->c(Ll/mgt0;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/mgt0;->d:Ll/ugt0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/mgt0;->e:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Ll/mgt0;->f:[Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/ugt0;->v(Ljava/lang/String;[Ljava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/google/android/gms/ads/internal/util/b;->l:Ll/ukw0;

    .line 11
    .line 12
    new-instance v1, Ll/lgt0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/lgt0;-><init>(Ll/mgt0;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    sget-object v1, Lcom/google/android/gms/ads/internal/util/b;->l:Ll/ukw0;

    .line 23
    .line 24
    new-instance v2, Ll/lgt0;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Ll/lgt0;-><init>(Ll/mgt0;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    throw v0
.end method

.method public final b()Ll/hpr;
    .locals 2

    .line 1
    sget-object v0, Ll/sgs0;->W1:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/mgt0;->d:Ll/ugt0;

    .line 20
    .line 21
    instance-of v0, v0, Ll/nht0;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    sget-object v0, Ll/oct0;->e:Ll/xvw0;

    .line 26
    .line 27
    new-instance v1, Ll/kgt0;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/kgt0;-><init>(Ll/mgt0;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {v0, v1}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_0
    invoke-super {p0}, Ll/aas0;->b()Ll/hpr;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public final synthetic d()Ljava/lang/Boolean;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/mgt0;->d:Ll/ugt0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/mgt0;->e:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Ll/mgt0;->f:[Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2, p0}, Ll/ugt0;->w(Ljava/lang/String;[Ljava/lang/String;Ll/mgt0;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mgt0;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
