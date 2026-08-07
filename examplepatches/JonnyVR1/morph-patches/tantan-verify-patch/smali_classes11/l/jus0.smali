.class public final Ll/jus0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vct0;


# instance fields
.field public final synthetic a:Ll/avs0;

.field public final synthetic b:Ll/rdw0;

.field public final synthetic c:Ll/bvs0;


# direct methods
.method public constructor <init>(Ll/bvs0;Ll/avs0;Ll/rdw0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/jus0;->a:Ll/avs0;

    .line 2
    .line 3
    iput-object p3, p0, Ll/jus0;->b:Ll/rdw0;

    .line 4
    .line 5
    iput-object p1, p0, Ll/jus0;->c:Ll/bvs0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final zza()V
    .locals 3

    .line 1
    const-string v0, "loadNewJavascriptEngine (failure): Trying to acquire lock"

    .line 2
    .line 3
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/jus0;->c:Ll/bvs0;

    .line 7
    .line 8
    invoke-static {v0}, Ll/bvs0;->f(Ll/bvs0;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    monitor-enter v0

    .line 13
    :try_start_0
    const-string v1, "loadNewJavascriptEngine (failure): Lock acquired"

    .line 14
    .line 15
    invoke-static {v1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/jus0;->c:Ll/bvs0;

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-static {v1, v2}, Ll/bvs0;->h(Ll/bvs0;I)V

    .line 22
    .line 23
    .line 24
    const-string v1, "Failed loading new engine. Marking new engine destroyable."

    .line 25
    .line 26
    invoke-static {v1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/jus0;->a:Ll/avs0;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/avs0;->g()V

    .line 32
    .line 33
    .line 34
    sget-object v1, Ll/ris0;->d:Ll/kis0;

    .line 35
    .line 36
    invoke-virtual {v1}, Ll/kis0;->e()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Ljava/lang/Boolean;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    iget-object v1, p0, Ll/jus0;->c:Ll/bvs0;

    .line 49
    .line 50
    invoke-static {v1}, Ll/bvs0;->e(Ll/bvs0;)Ll/hew0;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    if-eqz v2, :cond_0

    .line 55
    .line 56
    invoke-static {v1}, Ll/bvs0;->e(Ll/bvs0;)Ll/hew0;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget-object p0, p0, Ll/jus0;->b:Ll/rdw0;

    .line 61
    .line 62
    const-string v2, "Failed loading new engine"

    .line 63
    .line 64
    invoke-interface {p0, v2}, Ll/rdw0;->zzc(Ljava/lang/String;)Ll/rdw0;

    .line 65
    .line 66
    .line 67
    const/4 v2, 0x0

    .line 68
    invoke-interface {p0, v2}, Ll/rdw0;->S(Z)Ll/rdw0;

    .line 69
    .line 70
    .line 71
    invoke-interface {p0}, Ll/rdw0;->zzl()Ll/vdw0;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {v1, p0}, Ll/hew0;->b(Ll/vdw0;)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :catchall_0
    move-exception p0

    .line 80
    goto :goto_1

    .line 81
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    const-string p0, "loadNewJavascriptEngine (failure): Lock released"

    .line 83
    .line 84
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 89
    throw p0
.end method
