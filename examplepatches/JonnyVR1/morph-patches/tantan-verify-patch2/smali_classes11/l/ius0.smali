.class public final Ll/ius0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xct0;


# instance fields
.field public final synthetic a:Ll/avs0;

.field public final synthetic b:Ll/rdw0;

.field public final synthetic c:Ll/bvs0;


# direct methods
.method public constructor <init>(Ll/bvs0;Ll/avs0;Ll/rdw0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/ius0;->a:Ll/avs0;

    .line 2
    .line 3
    iput-object p3, p0, Ll/ius0;->b:Ll/rdw0;

    .line 4
    .line 5
    iput-object p1, p0, Ll/ius0;->c:Ll/bvs0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final bridge synthetic zza(Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p1, Ll/ots0;

    .line 2
    .line 3
    const-string p1, "loadNewJavascriptEngine (success): Trying to acquire lock"

    .line 4
    .line 5
    invoke-static {p1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/ius0;->c:Ll/bvs0;

    .line 9
    .line 10
    invoke-static {p1}, Ll/bvs0;->f(Ll/bvs0;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    monitor-enter p1

    .line 15
    :try_start_0
    const-string v0, "loadNewJavascriptEngine (success): Lock acquired"

    .line 16
    .line 17
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/ius0;->c:Ll/bvs0;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-static {v0, v1}, Ll/bvs0;->h(Ll/bvs0;I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/ius0;->c:Ll/bvs0;

    .line 27
    .line 28
    invoke-static {v0}, Ll/bvs0;->c(Ll/bvs0;)Ll/avs0;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    iget-object v1, p0, Ll/ius0;->a:Ll/avs0;

    .line 35
    .line 36
    invoke-static {v0}, Ll/bvs0;->c(Ll/bvs0;)Ll/avs0;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    if-eq v1, v0, :cond_0

    .line 41
    .line 42
    const-string v0, "New JS engine is loaded, marking previous one as destroyable."

    .line 43
    .line 44
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/ius0;->c:Ll/bvs0;

    .line 48
    .line 49
    invoke-static {v0}, Ll/bvs0;->c(Ll/bvs0;)Ll/avs0;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/avs0;->g()V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :catchall_0
    move-exception p0

    .line 58
    goto :goto_1

    .line 59
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/ius0;->c:Ll/bvs0;

    .line 60
    .line 61
    iget-object v1, p0, Ll/ius0;->a:Ll/avs0;

    .line 62
    .line 63
    invoke-static {v0, v1}, Ll/bvs0;->g(Ll/bvs0;Ll/avs0;)V

    .line 64
    .line 65
    .line 66
    sget-object v0, Ll/ris0;->d:Ll/kis0;

    .line 67
    .line 68
    invoke-virtual {v0}, Ll/kis0;->e()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Ljava/lang/Boolean;

    .line 73
    .line 74
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_1

    .line 79
    .line 80
    iget-object v0, p0, Ll/ius0;->c:Ll/bvs0;

    .line 81
    .line 82
    invoke-static {v0}, Ll/bvs0;->e(Ll/bvs0;)Ll/hew0;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    if-eqz v1, :cond_1

    .line 87
    .line 88
    invoke-static {v0}, Ll/bvs0;->e(Ll/bvs0;)Ll/hew0;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget-object p0, p0, Ll/ius0;->b:Ll/rdw0;

    .line 93
    .line 94
    const/4 v1, 0x1

    .line 95
    invoke-interface {p0, v1}, Ll/rdw0;->S(Z)Ll/rdw0;

    .line 96
    .line 97
    .line 98
    invoke-interface {p0}, Ll/rdw0;->zzl()Ll/vdw0;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {v0, p0}, Ll/hew0;->b(Ll/vdw0;)V

    .line 103
    .line 104
    .line 105
    :cond_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    const-string p0, "loadNewJavascriptEngine (success): Lock released"

    .line 107
    .line 108
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :goto_1
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 113
    throw p0
.end method
