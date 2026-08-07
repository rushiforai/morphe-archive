.class public final Ll/fus0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqs0;


# instance fields
.field public final synthetic a:Ll/ots0;

.field public final synthetic b:Ll/e9t0;

.field public final synthetic c:Ll/bvs0;


# direct methods
.method public constructor <init>(Ll/bvs0;Ll/v2s0;Ll/ots0;Ll/e9t0;)V
    .locals 0

    .line 1
    iput-object p3, p0, Ll/fus0;->a:Ll/ots0;

    .line 2
    .line 3
    iput-object p4, p0, Ll/fus0;->b:Ll/e9t0;

    .line 4
    .line 5
    iput-object p1, p0, Ll/fus0;->c:Ll/bvs0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Ljava/lang/Object;Ljava/util/Map;)V
    .locals 1

    .line 1
    check-cast p1, Ll/cvs0;

    .line 2
    .line 3
    const-string p1, "loadJavascriptEngine > /requestReload handler: Trying to acquire lock"

    .line 4
    .line 5
    invoke-static {p1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/fus0;->c:Ll/bvs0;

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
    const-string p2, "loadJavascriptEngine > /requestReload handler: Lock acquired"

    .line 16
    .line 17
    invoke-static {p2}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const-string p2, "JS Engine is requesting an update"

    .line 21
    .line 22
    invoke-static {p2}, Ll/dct0;->f(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p2, p0, Ll/fus0;->c:Ll/bvs0;

    .line 26
    .line 27
    invoke-static {p2}, Ll/bvs0;->a(Ll/bvs0;)I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-nez p2, :cond_0

    .line 32
    .line 33
    const-string p2, "Starting reload."

    .line 34
    .line 35
    invoke-static {p2}, Ll/dct0;->f(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p2, p0, Ll/fus0;->c:Ll/bvs0;

    .line 39
    .line 40
    const/4 v0, 0x2

    .line 41
    invoke-static {p2, v0}, Ll/bvs0;->h(Ll/bvs0;I)V

    .line 42
    .line 43
    .line 44
    iget-object p2, p0, Ll/fus0;->c:Ll/bvs0;

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-virtual {p2, v0}, Ll/bvs0;->d(Ll/v2s0;)Ll/avs0;

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    goto :goto_1

    .line 53
    :cond_0
    :goto_0
    iget-object p2, p0, Ll/fus0;->a:Ll/ots0;

    .line 54
    .line 55
    const-string v0, "/requestReload"

    .line 56
    .line 57
    iget-object p0, p0, Ll/fus0;->b:Ll/e9t0;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/e9t0;->a()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-interface {p2, v0, p0}, Ll/cvs0;->k0(Ljava/lang/String;Ll/bqs0;)V

    .line 64
    .line 65
    .line 66
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    const-string p0, "loadJavascriptEngine > /requestReload handler: Lock released"

    .line 68
    .line 69
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :goto_1
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 74
    throw p0
.end method
