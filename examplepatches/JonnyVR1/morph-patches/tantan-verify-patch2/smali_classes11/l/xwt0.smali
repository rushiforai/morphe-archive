.class public final Ll/xwt0;
.super Ll/uwt0;
.source "SourceFile"


# instance fields
.field public final j:Landroid/content/Context;

.field public final k:Landroid/view/View;

.field public final l:Ll/wit0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final m:Ll/r6w0;

.field public final n:Ll/izt0;

.field public final o:Ll/fmu0;

.field public final p:Ll/igu0;

.field public final q:Ll/kpx0;

.field public final r:Ljava/util/concurrent/Executor;

.field public s:Lcom/google/android/gms/ads/internal/client/zzq;


# direct methods
.method public constructor <init>(Ll/jzt0;Landroid/content/Context;Ll/r6w0;Landroid/view/View;Ll/wit0;Ll/izt0;Ll/fmu0;Ll/igu0;Ll/kpx0;Ljava/util/concurrent/Executor;)V
    .locals 0
    .param p5    # Ll/wit0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/uwt0;-><init>(Ll/jzt0;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/xwt0;->j:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p4, p0, Ll/xwt0;->k:Landroid/view/View;

    .line 7
    .line 8
    iput-object p5, p0, Ll/xwt0;->l:Ll/wit0;

    .line 9
    .line 10
    iput-object p3, p0, Ll/xwt0;->m:Ll/r6w0;

    .line 11
    .line 12
    iput-object p6, p0, Ll/xwt0;->n:Ll/izt0;

    .line 13
    .line 14
    iput-object p7, p0, Ll/xwt0;->o:Ll/fmu0;

    .line 15
    .line 16
    iput-object p8, p0, Ll/xwt0;->p:Ll/igu0;

    .line 17
    .line 18
    iput-object p9, p0, Ll/xwt0;->q:Ll/kpx0;

    .line 19
    .line 20
    iput-object p10, p0, Ll/xwt0;->r:Ljava/util/concurrent/Executor;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic p(Ll/xwt0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xwt0;->o:Ll/fmu0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fmu0;->e()Ll/sms0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Ll/fmu0;->e()Ll/sms0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/xwt0;->q:Ll/kpx0;

    .line 15
    .line 16
    invoke-interface {v1}, Ll/kpx0;->zzb()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ll/oys0;

    .line 21
    .line 22
    iget-object p0, p0, Ll/xwt0;->j:Landroid/content/Context;

    .line 23
    .line 24
    invoke-static {p0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {v0, v1, p0}, Ll/sms0;->F4(Ll/oys0;Ll/p1m;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :catch_0
    move-exception p0

    .line 33
    const-string v0, "RemoteException when notifyAdLoad is called"

    .line 34
    .line 35
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public final c()V
    .locals 2

    .line 1
    new-instance v0, Ll/wwt0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/wwt0;-><init>(Ll/xwt0;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/xwt0;->r:Ljava/util/concurrent/Executor;

    .line 7
    .line 8
    invoke-interface {v1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    invoke-super {p0}, Ll/kzt0;->c()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final i()I
    .locals 2

    .line 1
    sget-object v0, Ll/sgs0;->I7:Ll/dgs0;

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
    iget-object v0, p0, Ll/kzt0;->b:Ll/q6w0;

    .line 20
    .line 21
    iget-boolean v0, v0, Ll/q6w0;->h0:Z

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    sget-object v0, Ll/sgs0;->J7:Ll/dgs0;

    .line 26
    .line 27
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_0

    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    return p0

    .line 45
    :cond_0
    iget-object p0, p0, Ll/kzt0;->a:Ll/b7w0;

    .line 46
    .line 47
    iget-object p0, p0, Ll/b7w0;->b:Ll/a7w0;

    .line 48
    .line 49
    iget-object p0, p0, Ll/a7w0;->b:Ll/t6w0;

    .line 50
    .line 51
    iget p0, p0, Ll/t6w0;->c:I

    .line 52
    .line 53
    return p0
.end method

.method public final j()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xwt0;->k:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public final k()Ll/lpu0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/xwt0;->n:Ll/izt0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/izt0;->zza()Ll/lpu0;

    .line 4
    .line 5
    .line 6
    move-result-object p0
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzfho; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return-object p0

    .line 8
    :catch_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public final l()Ll/r6w0;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xwt0;->s:Lcom/google/android/gms/ads/internal/client/zzq;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Ll/u7w0;->b(Lcom/google/android/gms/ads/internal/client/zzq;)Ll/r6w0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/kzt0;->b:Ll/q6w0;

    .line 11
    .line 12
    iget-boolean v1, v0, Ll/q6w0;->d0:Z

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v1, :cond_3

    .line 16
    .line 17
    iget-object v0, v0, Ll/q6w0;->a:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Ljava/lang/String;

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    const-string v3, "FirstParty"

    .line 38
    .line 39
    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    iget-object p0, p0, Ll/xwt0;->k:Landroid/view/View;

    .line 47
    .line 48
    new-instance v0, Ll/r6w0;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    invoke-direct {v0, v1, p0, v2}, Ll/r6w0;-><init>(IIZ)V

    .line 59
    .line 60
    .line 61
    return-object v0

    .line 62
    :cond_3
    :goto_0
    iget-object p0, p0, Ll/kzt0;->b:Ll/q6w0;

    .line 63
    .line 64
    iget-object p0, p0, Ll/q6w0;->s:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    check-cast p0, Ll/r6w0;

    .line 71
    .line 72
    return-object p0
.end method

.method public final m()Ll/r6w0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xwt0;->m:Ll/r6w0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final n()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xwt0;->p:Ll/igu0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/igu0;->zza()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final o(Landroid/view/ViewGroup;Lcom/google/android/gms/ads/internal/client/zzq;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/xwt0;->l:Ll/wit0;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Ll/xkt0;->c(Lcom/google/android/gms/ads/internal/client/zzq;)Ll/xkt0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v0, v1}, Ll/wit0;->G(Ll/xkt0;)V

    .line 12
    .line 13
    .line 14
    iget v0, p2, Lcom/google/android/gms/ads/internal/client/zzq;->zzc:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setMinimumHeight(I)V

    .line 17
    .line 18
    .line 19
    iget v0, p2, Lcom/google/android/gms/ads/internal/client/zzq;->zzf:I

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/view/View;->setMinimumWidth(I)V

    .line 22
    .line 23
    .line 24
    iput-object p2, p0, Ll/xwt0;->s:Lcom/google/android/gms/ads/internal/client/zzq;

    .line 25
    .line 26
    :cond_0
    return-void
.end method
