.class public final Ll/abt0;
.super Ll/aas0;
.source "SourceFile"


# instance fields
.field public final synthetic c:Ll/ebt0;


# direct methods
.method public constructor <init>(Ll/ebt0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/abt0;->c:Ll/ebt0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/aas0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3

    .line 1
    new-instance v0, Ll/ygs0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/abt0;->c:Ll/ebt0;

    .line 4
    .line 5
    invoke-static {v1}, Ll/ebt0;->c(Ll/ebt0;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-static {v1}, Ll/ebt0;->j(Ll/ebt0;)Lcom/google/android/gms/internal/ads/zzcei;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v1, v1, Lcom/google/android/gms/internal/ads/zzcei;->zza:Ljava/lang/String;

    .line 14
    .line 15
    invoke-direct {v0, v2, v1}, Ll/ygs0;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/abt0;->c:Ll/ebt0;

    .line 19
    .line 20
    invoke-static {v1}, Ll/ebt0;->m(Ll/ebt0;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    monitor-enter v1

    .line 25
    :try_start_0
    invoke-static {}, Ll/bxy0;->g()Ll/bhs0;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/abt0;->c:Ll/ebt0;

    .line 29
    .line 30
    invoke-static {p0}, Ll/ebt0;->f(Ll/ebt0;)Ll/ahs0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0, v0}, Ll/bhs0;->a(Ll/ahs0;Ll/ygs0;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    goto :goto_1

    .line 40
    :catch_0
    move-exception p0

    .line 41
    :try_start_1
    const-string v0, "Cannot config CSI reporter."

    .line 42
    .line 43
    invoke-static {v0, p0}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    :goto_0
    monitor-exit v1

    .line 47
    return-void

    .line 48
    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    throw p0
.end method
