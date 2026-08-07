.class public final Ll/l9u0;
.super Ll/kdu0;
.source "SourceFile"

# interfaces
.implements Ll/j7u0;
.implements Ll/v8u0;


# instance fields
.field public final b:Ll/q6w0;

.field public final c:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>(Ljava/util/Set;Ll/q6w0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kdu0;-><init>(Ljava/util/Set;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/l9u0;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 10
    .line 11
    iput-object p2, p0, Ll/l9u0;->b:Ll/q6w0;

    .line 12
    .line 13
    return-void
.end method

.method private final zzb()V
    .locals 3

    .line 1
    sget-object v0, Ll/sgs0;->H7:Ll/dgs0;

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
    iget-object v0, p0, Ll/l9u0;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Ll/l9u0;->b:Ll/q6w0;

    .line 30
    .line 31
    iget-object v0, v0, Ll/q6w0;->f0:Lcom/google/android/gms/ads/internal/client/zzs;

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget v0, v0, Lcom/google/android/gms/ads/internal/client/zzs;->zza:I

    .line 36
    .line 37
    const/4 v1, 0x3

    .line 38
    if-ne v0, v1, :cond_0

    .line 39
    .line 40
    new-instance v0, Ll/k9u0;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ll/k9u0;-><init>(Ll/l9u0;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ll/kdu0;->v0(Ll/jdu0;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l9u0;->b:Ll/q6w0;

    .line 2
    .line 3
    iget v0, v0, Ll/q6w0;->b:I

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    if-eq v0, v1, :cond_1

    .line 7
    .line 8
    const/4 v1, 0x5

    .line 9
    if-eq v0, v1, :cond_1

    .line 10
    .line 11
    const/4 v1, 0x4

    .line 12
    if-eq v0, v1, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x6

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x7

    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-void

    .line 22
    :cond_1
    :goto_0
    invoke-direct {p0}, Ll/l9u0;->zzb()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic w0(Ll/n9u0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/l9u0;->b:Ll/q6w0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q6w0;->f0:Lcom/google/android/gms/ads/internal/client/zzs;

    .line 4
    .line 5
    invoke-interface {p1, p0}, Ll/n9u0;->b(Lcom/google/android/gms/ads/internal/client/zzs;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final zzg()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l9u0;->b:Ll/q6w0;

    .line 2
    .line 3
    iget v0, v0, Ll/q6w0;->b:I

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-direct {p0}, Ll/l9u0;->zzb()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
