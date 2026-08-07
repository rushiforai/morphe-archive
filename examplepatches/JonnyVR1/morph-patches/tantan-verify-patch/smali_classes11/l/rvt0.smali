.class public final Ll/rvt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y6s0;


# instance fields
.field public a:Ll/wit0;

.field public final b:Ljava/util/concurrent/Executor;

.field public final c:Ll/wut0;

.field public final d:Lcom/google/android/gms/common/util/Clock;

.field public e:Z

.field public f:Z

.field public final g:Ll/gvt0;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Ll/wut0;Lcom/google/android/gms/common/util/Clock;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/rvt0;->e:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/rvt0;->f:Z

    .line 8
    .line 9
    new-instance v0, Ll/gvt0;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/gvt0;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/rvt0;->g:Ll/gvt0;

    .line 15
    .line 16
    iput-object p1, p0, Ll/rvt0;->b:Ljava/util/concurrent/Executor;

    .line 17
    .line 18
    iput-object p2, p0, Ll/rvt0;->c:Ll/wut0;

    .line 19
    .line 20
    iput-object p3, p0, Ll/rvt0;->d:Lcom/google/android/gms/common/util/Clock;

    .line 21
    .line 22
    return-void
.end method

.method private final x()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/rvt0;->c:Ll/wut0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/rvt0;->g:Ll/gvt0;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/wut0;->a(Ll/gvt0;)Lorg/json/JSONObject;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/rvt0;->a:Ll/wit0;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Ll/rvt0;->b:Ljava/util/concurrent/Executor;

    .line 14
    .line 15
    new-instance v2, Ll/qvt0;

    .line 16
    .line 17
    invoke-direct {v2, p0, v0}, Ll/qvt0;-><init>(Ll/rvt0;Lorg/json/JSONObject;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void

    .line 24
    :catch_0
    move-exception p0

    .line 25
    const-string v0, "Failed to call video active view js"

    .line 26
    .line 27
    invoke-static {v0, p0}, Ll/d2v0;->l(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public final U(Ll/x6s0;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/rvt0;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iget-boolean v0, p1, Ll/x6s0;->j:Z

    .line 8
    .line 9
    :goto_0
    iget-object v1, p0, Ll/rvt0;->g:Ll/gvt0;

    .line 10
    .line 11
    iput-boolean v0, v1, Ll/gvt0;->a:Z

    .line 12
    .line 13
    iget-object v0, p0, Ll/rvt0;->d:Lcom/google/android/gms/common/util/Clock;

    .line 14
    .line 15
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    iput-wide v2, v1, Ll/gvt0;->d:J

    .line 20
    .line 21
    iget-object v0, p0, Ll/rvt0;->g:Ll/gvt0;

    .line 22
    .line 23
    iput-object p1, v0, Ll/gvt0;->f:Ll/x6s0;

    .line 24
    .line 25
    iget-boolean p1, p0, Ll/rvt0;->e:Z

    .line 26
    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    invoke-direct {p0}, Ll/rvt0;->x()V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public final b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/rvt0;->e:Z

    .line 3
    .line 4
    return-void
.end method

.method public final i()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/rvt0;->e:Z

    .line 3
    .line 4
    invoke-direct {p0}, Ll/rvt0;->x()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic k(Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/rvt0;->a:Ll/wit0;

    .line 2
    .line 3
    const-string v0, "AFMA_updateActiveView"

    .line 4
    .line 5
    invoke-interface {p0, v0, p1}, Ll/xts0;->z0(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final q(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/rvt0;->f:Z

    .line 2
    .line 3
    return-void
.end method

.method public final u(Ll/wit0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rvt0;->a:Ll/wit0;

    .line 2
    .line 3
    return-void
.end method
