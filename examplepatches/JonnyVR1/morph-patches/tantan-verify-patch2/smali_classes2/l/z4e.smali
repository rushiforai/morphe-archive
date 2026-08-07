.class public Ll/z4e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z3e;


# instance fields
.field private final a:Ll/mwd0;

.field private final b:Ljava/io/File;

.field private final c:J

.field private final d:Ll/e4e;

.field private e:Ll/w4e;


# direct methods
.method public constructor <init>(Ljava/io/File;J)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/e4e;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/e4e;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/z4e;->d:Ll/e4e;

    .line 10
    .line 11
    iput-object p1, p0, Ll/z4e;->b:Ljava/io/File;

    .line 12
    .line 13
    iput-wide p2, p0, Ll/z4e;->c:J

    .line 14
    .line 15
    new-instance p1, Ll/mwd0;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/mwd0;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/z4e;->a:Ll/mwd0;

    .line 21
    .line 22
    return-void
.end method

.method public static c(Ljava/io/File;J)Ll/z3e;
    .locals 1

    .line 1
    new-instance v0, Ll/z4e;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/z4e;-><init>(Ljava/io/File;J)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private declared-synchronized d()Ll/w4e;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/z4e;->e:Ll/w4e;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ll/z4e;->b:Ljava/io/File;

    .line 7
    .line 8
    iget-wide v1, p0, Ll/z4e;->c:J

    .line 9
    .line 10
    const/4 v3, 0x1

    .line 11
    invoke-static {v0, v3, v3, v1, v2}, Ll/w4e;->J(Ljava/io/File;IIJ)Ll/w4e;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/z4e;->e:Ll/w4e;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/z4e;->e:Ll/w4e;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    monitor-exit p0

    .line 23
    return-object v0

    .line 24
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw v0
.end method


# virtual methods
.method public a(Ll/kzq;)Ljava/io/File;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/z4e;->a:Ll/mwd0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/mwd0;->b(Ll/kzq;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x2

    .line 8
    const-string v2, "DiskLruCacheWrapper"

    .line 9
    .line 10
    invoke-static {v2, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    :cond_0
    const/4 p1, 0x0

    .line 20
    :try_start_0
    invoke-direct {p0}, Ll/z4e;->d()Ll/w4e;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0, v0}, Ll/w4e;->H(Ljava/lang/String;)Ll/w4e$e;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-virtual {p0, v0}, Ll/w4e$e;->a(I)Ljava/io/File;

    .line 32
    .line 33
    .line 34
    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    return-object p0

    .line 36
    :cond_1
    return-object p1

    .line 37
    :catch_0
    const/4 p0, 0x5

    .line 38
    invoke-static {v2, p0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 39
    .line 40
    .line 41
    return-object p1
.end method

.method public b(Ll/kzq;Ll/z3e$b;)V
    .locals 4

    .line 1
    const-string v0, "DiskLruCacheWrapper"

    .line 2
    .line 3
    const-string v1, "Had two simultaneous puts for: "

    .line 4
    .line 5
    iget-object v2, p0, Ll/z4e;->a:Ll/mwd0;

    .line 6
    .line 7
    invoke-virtual {v2, p1}, Ll/mwd0;->b(Ll/kzq;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iget-object v3, p0, Ll/z4e;->d:Ll/e4e;

    .line 12
    .line 13
    invoke-virtual {v3, v2}, Ll/e4e;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 v3, 0x2

    .line 17
    :try_start_0
    invoke-static {v0, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_4

    .line 29
    :cond_0
    :goto_0
    :try_start_1
    invoke-direct {p0}, Ll/z4e;->d()Ll/w4e;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1, v2}, Ll/w4e;->H(Ljava/lang/String;)Ll/w4e$e;

    .line 34
    .line 35
    .line 36
    move-result-object v3
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    if-eqz v3, :cond_1

    .line 38
    .line 39
    :goto_1
    iget-object p0, p0, Ll/z4e;->d:Ll/e4e;

    .line 40
    .line 41
    invoke-virtual {p0, v2}, Ll/e4e;->b(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    :try_start_2
    invoke-virtual {p1, v2}, Ll/w4e;->v(Ljava/lang/String;)Ll/w4e$c;

    .line 46
    .line 47
    .line 48
    move-result-object p1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    :try_start_3
    invoke-virtual {p1, v1}, Ll/w4e$c;->f(I)Ljava/io/File;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-interface {p2, v1}, Ll/z3e$b;->write(Ljava/io/File;)Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-eqz p2, :cond_2

    .line 61
    .line 62
    invoke-virtual {p1}, Ll/w4e$c;->e()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 63
    .line 64
    .line 65
    goto :goto_2

    .line 66
    :catchall_1
    move-exception p2

    .line 67
    goto :goto_3

    .line 68
    :cond_2
    :goto_2
    :try_start_4
    invoke-virtual {p1}, Ll/w4e$c;->b()V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :goto_3
    invoke-virtual {p1}, Ll/w4e$c;->b()V

    .line 73
    .line 74
    .line 75
    throw p2

    .line 76
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 77
    .line 78
    new-instance p2, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    throw p1
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 94
    :catch_0
    const/4 p1, 0x5

    .line 95
    :try_start_5
    invoke-static {v0, p1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :goto_4
    iget-object p0, p0, Ll/z4e;->d:Ll/e4e;

    .line 100
    .line 101
    invoke-virtual {p0, v2}, Ll/e4e;->b(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    throw p1
.end method
