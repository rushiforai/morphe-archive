.class public final Ll/iwg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wng0;
.implements Ll/ztg0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ll/jgg0;)J
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p1}, Ll/jgg0;->b()J

    .line 2
    .line 3
    .line 4
    move-result-wide p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-wide p0

    .line 6
    :catch_0
    move-exception p0

    .line 7
    iget-object p1, p1, Ll/jgg0;->d:Ll/ixg0;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ll/ixg0;->b(Ljava/lang/Exception;)V

    .line 10
    .line 11
    .line 12
    throw p0
.end method

.method public final b(Ll/jgg0;)Ll/vkg0;
    .locals 3

    .line 1
    iget-object p0, p1, Ll/jgg0;->d:Ll/ixg0;

    .line 2
    .line 3
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Ll/ixg0;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/jgg0;->c()Ll/vkg0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :catch_0
    move-exception v0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    sget-object v0, LSudchar/Sudfor;->Suddo:LSudchar/Sudfor;

    .line 17
    .line 18
    throw v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    :goto_1
    instance-of v1, v0, LSudchar/Sudtry;

    .line 20
    .line 21
    if-eqz v1, :cond_3

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput v0, p1, Ll/jgg0;->g:I

    .line 25
    .line 26
    monitor-enter p1

    .line 27
    :try_start_1
    iget-object v0, p1, Ll/jgg0;->j:Ll/rug0;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p1, Ll/jgg0;->j:Ll/rug0;

    .line 33
    .line 34
    iput-object v1, v0, Ll/rug0;->c:Ll/x1d0;

    .line 35
    .line 36
    iget-object v2, v0, Ll/rug0;->d:Ll/i5d0;

    .line 37
    .line 38
    if-eqz v2, :cond_1

    .line 39
    .line 40
    invoke-virtual {v2}, Ll/i5d0;->close()V

    .line 41
    .line 42
    .line 43
    goto :goto_2

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_3

    .line 46
    :cond_1
    :goto_2
    iput-object v1, v0, Ll/rug0;->d:Ll/i5d0;

    .line 47
    .line 48
    iget-object v0, p1, Ll/jgg0;->j:Ll/rug0;

    .line 49
    .line 50
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    iget-object v0, p1, Ll/jgg0;->b:Ll/aug0;

    .line 54
    .line 55
    iget v0, v0, Ll/aug0;->b:I

    .line 56
    .line 57
    :cond_2
    iput-object v1, p1, Ll/jgg0;->j:Ll/rug0;

    .line 58
    .line 59
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    goto :goto_0

    .line 61
    :goto_3
    monitor-exit p1

    .line 62
    throw p0

    .line 63
    :cond_3
    iget-object p0, p1, Ll/jgg0;->d:Ll/ixg0;

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Ll/ixg0;->b(Ljava/lang/Exception;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p1, Ll/jgg0;->d:Ll/ixg0;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/ixg0;->a()Ll/vfg0;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    iget p1, p1, Ll/jgg0;->a:I

    .line 75
    .line 76
    iget-object p0, p0, Ll/vfg0;->t:Ljava/util/ArrayList;

    .line 77
    .line 78
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    throw v0
.end method
