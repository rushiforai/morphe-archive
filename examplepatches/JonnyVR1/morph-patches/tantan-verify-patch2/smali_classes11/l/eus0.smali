.class public final Ll/eus0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqs0;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ll/avs0;

.field public final synthetic c:Ll/ots0;

.field public final synthetic d:Ll/bvs0;


# direct methods
.method public constructor <init>(Ll/bvs0;JLl/avs0;Ll/ots0;)V
    .locals 0

    .line 1
    iput-wide p2, p0, Ll/eus0;->a:J

    .line 2
    .line 3
    iput-object p4, p0, Ll/eus0;->b:Ll/avs0;

    .line 4
    .line 5
    iput-object p5, p0, Ll/eus0;->c:Ll/ots0;

    .line 6
    .line 7
    iput-object p1, p0, Ll/eus0;->d:Ll/bvs0;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Ljava/lang/Object;Ljava/util/Map;)V
    .locals 2

    .line 1
    check-cast p1, Ll/cvs0;

    .line 2
    .line 3
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide p1

    .line 11
    iget-wide v0, p0, Ll/eus0;->a:J

    .line 12
    .line 13
    sub-long/2addr p1, v0

    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v1, "onGmsg /jsLoaded. JsLoaded latency is "

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p1, " ms."

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const-string p1, "loadJavascriptEngine > /jsLoaded handler: Trying to acquire lock"

    .line 37
    .line 38
    invoke-static {p1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/eus0;->d:Ll/bvs0;

    .line 42
    .line 43
    invoke-static {p1}, Ll/bvs0;->f(Ll/bvs0;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    monitor-enter p1

    .line 48
    :try_start_0
    const-string p2, "loadJavascriptEngine > /jsLoaded handler: Lock acquired"

    .line 49
    .line 50
    invoke-static {p2}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object p2, p0, Ll/eus0;->b:Ll/avs0;

    .line 54
    .line 55
    invoke-virtual {p2}, Ll/kdt0;->a()I

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    const/4 v0, -0x1

    .line 60
    if-eq p2, v0, :cond_1

    .line 61
    .line 62
    iget-object p2, p0, Ll/eus0;->b:Ll/avs0;

    .line 63
    .line 64
    invoke-virtual {p2}, Ll/kdt0;->a()I

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    const/4 v0, 0x1

    .line 69
    if-ne p2, v0, :cond_0

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    iget-object p2, p0, Ll/eus0;->d:Ll/bvs0;

    .line 73
    .line 74
    const/4 v0, 0x0

    .line 75
    invoke-static {p2, v0}, Ll/bvs0;->h(Ll/bvs0;I)V

    .line 76
    .line 77
    .line 78
    iget-object p2, p0, Ll/eus0;->c:Ll/ots0;

    .line 79
    .line 80
    const-string v0, "/log"

    .line 81
    .line 82
    sget-object v1, Ll/aqs0;->g:Ll/bqs0;

    .line 83
    .line 84
    invoke-interface {p2, v0, v1}, Ll/cvs0;->q0(Ljava/lang/String;Ll/bqs0;)V

    .line 85
    .line 86
    .line 87
    const-string v0, "/result"

    .line 88
    .line 89
    sget-object v1, Ll/aqs0;->o:Ll/qqs0;

    .line 90
    .line 91
    invoke-interface {p2, v0, v1}, Ll/cvs0;->q0(Ljava/lang/String;Ll/bqs0;)V

    .line 92
    .line 93
    .line 94
    iget-object p2, p0, Ll/eus0;->b:Ll/avs0;

    .line 95
    .line 96
    iget-object v0, p0, Ll/eus0;->c:Ll/ots0;

    .line 97
    .line 98
    invoke-virtual {p2, v0}, Ll/kdt0;->d(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    iget-object p2, p0, Ll/eus0;->d:Ll/bvs0;

    .line 102
    .line 103
    iget-object p0, p0, Ll/eus0;->b:Ll/avs0;

    .line 104
    .line 105
    invoke-static {p2, p0}, Ll/bvs0;->g(Ll/bvs0;Ll/avs0;)V

    .line 106
    .line 107
    .line 108
    const-string p0, "Successfully loaded JS Engine."

    .line 109
    .line 110
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 114
    const-string p0, "loadJavascriptEngine > /jsLoaded handler: Lock released"

    .line 115
    .line 116
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :catchall_0
    move-exception p0

    .line 121
    goto :goto_1

    .line 122
    :cond_1
    :goto_0
    :try_start_1
    const-string p0, "loadJavascriptEngine > /jsLoaded handler: Lock released, the promise is already settled"

    .line 123
    .line 124
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    monitor-exit p1

    .line 128
    return-void

    .line 129
    :goto_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 130
    throw p0
.end method
