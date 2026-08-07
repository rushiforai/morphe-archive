.class public Ll/gqw;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile a:Z

.field private static b:Landroid/content/Context;

.field private static c:Z

.field static d:Ljava/lang/String;

.field static e:Ljava/lang/String;

.field private static f:Ll/yxl;

.field private static g:Ll/tof0;

.field private static h:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/ywl;",
            ">;"
        }
    .end annotation
.end field

.field private static i:Ll/fqw$e;

.field private static j:Ll/fqw$d;

.field private static k:Ll/xxl;

.field private static l:Lcom/google/gson/Gson;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/gqw;->h:Ljava/util/Map;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Z
    .locals 1

    .line 1
    sget-object v0, Ll/gqw;->i:Ll/fqw$e;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/fqw$e;->d()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static b()Landroid/content/Context;
    .locals 1

    .line 1
    sget-object v0, Ll/gqw;->b:Landroid/content/Context;

    .line 2
    .line 3
    return-object v0
.end method

.method public static c()Ljava/util/Map;
    .locals 1

    .line 1
    sget-object v0, Ll/gqw;->h:Ljava/util/Map;

    .line 2
    .line 3
    return-object v0
.end method

.method public static d()Ll/tof0;
    .locals 1

    .line 1
    sget-object v0, Ll/gqw;->g:Ll/tof0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static e()I
    .locals 1

    .line 1
    sget-object v0, Ll/gqw;->j:Ll/fqw$d;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/fqw$c;->b()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static f()I
    .locals 1

    .line 1
    sget-object v0, Ll/gqw;->i:Ll/fqw$e;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/fqw$e;->a()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static g()I
    .locals 1

    .line 1
    sget-object v0, Ll/gqw;->i:Ll/fqw$e;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/fqw$e;->c()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static h()I
    .locals 1

    .line 1
    sget-object v0, Ll/gqw;->i:Ll/fqw$e;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/fqw$c;->b()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static i()[Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Ll/gqw;->h:Ljava/util/Map;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    new-array v1, v1, [Ljava/lang/String;

    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, [Ljava/lang/String;

    .line 17
    .line 18
    return-object v0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    return-object v0
.end method

.method public static j()Ll/xxl;
    .locals 1

    .line 1
    sget-object v0, Ll/gqw;->k:Ll/xxl;

    .line 2
    .line 3
    return-object v0
.end method

.method public static k()Ll/yxl;
    .locals 1

    .line 1
    sget-object v0, Ll/gqw;->f:Ll/yxl;

    .line 2
    .line 3
    return-object v0
.end method

.method public static l()Lcom/google/gson/Gson;
    .locals 1

    .line 1
    sget-object v0, Ll/gqw;->l:Lcom/google/gson/Gson;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/google/gson/Gson;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/gqw;->l:Lcom/google/gson/Gson;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/gqw;->l:Lcom/google/gson/Gson;

    .line 13
    .line 14
    return-object v0
.end method

.method public static declared-synchronized m()Z
    .locals 2

    .line 1
    const-class v0, Ll/gqw;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Ll/gqw;->a:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return v1

    .line 8
    :catchall_0
    move-exception v1

    .line 9
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    throw v1
.end method

.method public static n(Landroid/content/Context;Ll/fqw;)V
    .locals 2

    .line 1
    sget-boolean v0, Ll/gqw;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sput-object p0, Ll/gqw;->b:Landroid/content/Context;

    .line 10
    .line 11
    iget-boolean p0, p1, Ll/fqw;->a:Z

    .line 12
    .line 13
    sput-boolean p0, Ll/gqw;->c:Z

    .line 14
    .line 15
    iget-object p0, p1, Ll/fqw;->b:Ljava/lang/String;

    .line 16
    .line 17
    sput-object p0, Ll/gqw;->d:Ljava/lang/String;

    .line 18
    .line 19
    iget-object p0, p1, Ll/fqw;->c:Ljava/lang/String;

    .line 20
    .line 21
    sput-object p0, Ll/gqw;->e:Ljava/lang/String;

    .line 22
    .line 23
    iget-object p0, p1, Ll/fqw;->g:Ll/tof0;

    .line 24
    .line 25
    sput-object p0, Ll/gqw;->g:Ll/tof0;

    .line 26
    .line 27
    iget-object p0, p1, Ll/fqw;->e:Ll/fqw$e;

    .line 28
    .line 29
    sput-object p0, Ll/gqw;->i:Ll/fqw$e;

    .line 30
    .line 31
    iget-object p0, p1, Ll/fqw;->f:Ll/fqw$d;

    .line 32
    .line 33
    sput-object p0, Ll/gqw;->j:Ll/fqw$d;

    .line 34
    .line 35
    iget-object p0, p1, Ll/fqw;->d:Ll/xxl;

    .line 36
    .line 37
    sput-object p0, Ll/gqw;->k:Ll/xxl;

    .line 38
    .line 39
    new-instance p0, Ll/tum;

    .line 40
    .line 41
    invoke-direct {p0}, Ll/tum;-><init>()V

    .line 42
    .line 43
    .line 44
    sput-object p0, Ll/gqw;->f:Ll/yxl;

    .line 45
    .line 46
    iget-object p0, p1, Ll/fqw;->h:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    check-cast p1, Ll/ywl;

    .line 63
    .line 64
    if-eqz p1, :cond_0

    .line 65
    .line 66
    sget-object v0, Ll/gqw;->h:Ljava/util/Map;

    .line 67
    .line 68
    invoke-interface {p1}, Ll/ywl;->b()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-interface {p1}, Ll/ywl;->b()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v1, " registered realtimeEnable = "

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-interface {p1}, Ll/ywl;->a()Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-static {p1}, Ll/gqw;->s(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_1
    const/4 p0, 0x1

    .line 108
    sput-boolean p0, Ll/gqw;->a:Z

    .line 109
    .line 110
    return-void

    .line 111
    :cond_2
    new-instance p0, Lcom/immomo/momo/mulog/exception/MULogIllegalStateException;

    .line 112
    .line 113
    const-string p1, "method init couldn\'t be called twice"

    .line 114
    .line 115
    invoke-direct {p0, p1}, Lcom/immomo/momo/mulog/exception/MULogIllegalStateException;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    throw p0
.end method

.method public static o()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/gqw;->c:Z

    .line 2
    .line 3
    return v0
.end method

.method public static p()Z
    .locals 1

    .line 1
    sget-object v0, Ll/gqw;->j:Ll/fqw$d;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/fqw$c;->e()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static q()Z
    .locals 1

    .line 1
    sget-object v0, Ll/gqw;->i:Ll/fqw$e;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/fqw$c;->e()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    return v0
.end method

.method public static r()Z
    .locals 1

    .line 1
    sget-object v0, Ll/gqw;->j:Ll/fqw$d;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/fqw$d;->a:Z

    .line 4
    .line 5
    return v0
.end method

.method public static s(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-boolean v0, Ll/gqw;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "MULog"

    .line 6
    .line 7
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static t(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-boolean v0, Ll/gqw;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "MULog"

    .line 6
    .line 7
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static u(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-boolean v0, Ll/gqw;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "MULog"

    .line 6
    .line 7
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static v(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-boolean v0, Ll/gqw;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "MUBusinessLog"

    .line 6
    .line 7
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static w(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-boolean v0, Ll/gqw;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "MULog"

    .line 6
    .line 7
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
