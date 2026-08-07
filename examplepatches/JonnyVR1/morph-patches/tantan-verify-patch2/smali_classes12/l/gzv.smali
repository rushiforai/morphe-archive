.class public Ll/gzv;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static c:Ll/gzv;


# instance fields
.field private a:Ll/zxl;

.field private b:Ll/zxl;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private b()V
    .locals 1

    .line 1
    invoke-static {}, Ll/gqw;->m()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p0, Lcom/immomo/momo/mulog/exception/MULogIllegalStateException;

    .line 9
    .line 10
    const-string v0, "mulog has not been init yet"

    .line 11
    .line 12
    invoke-direct {p0, v0}, Lcom/immomo/momo/mulog/exception/MULogIllegalStateException;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    throw p0
.end method

.method private static c(Ll/fzv;)Z
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/fzv;->a:Ll/nqw;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/nqw;->c()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static e()Ll/gzv;
    .locals 2

    .line 1
    sget-object v0, Ll/gzv;->c:Ll/gzv;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/gzv;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/gzv;->c:Ll/gzv;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/gzv;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/gzv;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/gzv;->c:Ll/gzv;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/gzv;->c:Ll/gzv;

    .line 27
    .line 28
    return-object v0
.end method

.method private f()Ll/zxl;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gzv;->a:Ll/zxl;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/lqw;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/lqw;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/gzv;->a:Ll/zxl;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/gzv;->a:Ll/zxl;

    .line 13
    .line 14
    return-object p0
.end method

.method private g()Ll/zxl;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gzv;->b:Ll/zxl;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/qqw;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/qqw;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/gzv;->b:Ll/zxl;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/gzv;->b:Ll/zxl;

    .line 13
    .line 14
    return-object p0
.end method


# virtual methods
.method public a(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/gzv;->b()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/gqw;->c()Ljava/util/Map;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public d(Ll/fzv;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/gzv;->c(Ll/fzv;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-direct {p0}, Ll/gzv;->b()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/gqw;->c()Ljava/util/Map;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p1, Ll/fzv;->business:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/ywl;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    iget-boolean v1, p1, Ll/fzv;->needRealtime:Z

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    invoke-interface {v0}, Ll/ywl;->a()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-static {}, Ll/ui20;->a()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    const/4 v1, -0x1

    .line 39
    if-eq v0, v1, :cond_0

    .line 40
    .line 41
    invoke-direct {p0}, Ll/gzv;->g()Ll/zxl;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-interface {p0, p1}, Ll/zxl;->b(Ll/fzv;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    iget-object p1, p1, Ll/fzv;->business:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string p1, " --> log failed cause enableRealtime = false"

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p0}, Ll/gqw;->s(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_1
    invoke-direct {p0}, Ll/gzv;->f()Ll/zxl;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-interface {p0, p1}, Ll/zxl;->b(Ll/fzv;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 83
    .line 84
    .line 85
    iget-object p1, p1, Ll/fzv;->business:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string p1, " not register"

    .line 91
    .line 92
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-static {p0}, Ll/gqw;->s(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    const-string v0, "invalid log request: "

    .line 106
    .line 107
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-static {p0}, Ll/gqw;->w(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    invoke-static {}, Ll/gqw;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Ll/gzv;->g()Ll/zxl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ll/bpl;->c()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {}, Ll/gqw;->p()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-direct {p0}, Ll/gzv;->f()Ll/zxl;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p0}, Ll/bpl;->c()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    invoke-static {}, Ll/gqw;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Ll/gzv;->g()Ll/zxl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ll/bpl;->a()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {}, Ll/gqw;->p()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-direct {p0}, Ll/gzv;->f()Ll/zxl;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p0}, Ll/bpl;->a()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method
