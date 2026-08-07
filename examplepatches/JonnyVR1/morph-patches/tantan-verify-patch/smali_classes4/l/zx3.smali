.class public Ll/zx3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ll/c610;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/yni0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/du2;->p()Ll/cjk0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/cjk0;->i()Ljava/util/HashSet;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/zx3;->a:Ljava/util/HashSet;

    .line 13
    .line 14
    invoke-static {}, Ll/xni0;->d()Ll/yni0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/zx3;->b:Ll/yni0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/zx3;->c()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic a(Ll/zx3;Ll/c610;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zx3;->d(Ll/c610;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/zx3;Ll/c610;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zx3;->e(Ll/c610;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zx3;->b:Ll/yni0;

    .line 2
    .line 3
    new-instance v1, Ll/zx3$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/zx3$a;-><init>(Ll/zx3;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/yni0;->a(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final d(Ll/c610;)V
    .locals 0

    .line 1
    new-instance p0, Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/c610;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Ll/xx3$b;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/xx3$b;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Ll/xx3$b;->b(Ljava/lang/String;)Ll/xx3$b;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/xx3$b;->a()Ll/xx3;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Ll/d7r;->a(Ll/xx3;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final e(Ll/c610;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Ll/c610;->b()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/c610;->c()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Ll/nki;->k(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_3

    .line 13
    .line 14
    new-instance v1, Ljava/io/File;

    .line 15
    .line 16
    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto/16 :goto_4

    .line 26
    .line 27
    :cond_0
    array-length v1, v0

    .line 28
    const/4 v2, 0x0

    .line 29
    :goto_0
    if-ge v2, v1, :cond_3

    .line 30
    .line 31
    aget-object v3, v0, v2

    .line 32
    .line 33
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-eqz v4, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0, v3}, Ll/zx3;->f(Ljava/io/File;)Ljava/io/File;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    const-string v5, "[beatles]"

    .line 44
    .line 45
    if-eqz v4, :cond_1

    .line 46
    .line 47
    new-instance v6, Lcom/google/gson/Gson;

    .line 48
    .line 49
    invoke-direct {v6}, Lcom/google/gson/Gson;-><init>()V

    .line 50
    .line 51
    .line 52
    const/4 v7, 0x0

    .line 53
    :try_start_0
    new-instance v8, Ljava/io/FileReader;

    .line 54
    .line 55
    invoke-direct {v8, v4}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 56
    .line 57
    .line 58
    :try_start_1
    const-class v4, Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 59
    .line 60
    invoke-virtual {v6, v8, v4}, Lcom/google/gson/Gson;->fromJson(Ljava/io/Reader;Ljava/lang/Class;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    check-cast v4, Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 65
    .line 66
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-virtual {v4, v3}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setCacheDir(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    const/4 v3, 0x1

    .line 74
    invoke-virtual {v4, v3}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setCache(Z)V

    .line 75
    .line 76
    .line 77
    invoke-static {}, Ll/a5f;->m()Ll/a5f;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v3, v4}, Ll/a5f;->q(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 82
    .line 83
    .line 84
    invoke-static {v8}, Ll/m1m;->a(Ljava/io/Closeable;)V

    .line 85
    .line 86
    .line 87
    goto :goto_3

    .line 88
    :catchall_0
    move-exception p0

    .line 89
    move-object v7, v8

    .line 90
    goto :goto_2

    .line 91
    :catch_0
    move-exception v3

    .line 92
    move-object v7, v8

    .line 93
    goto :goto_1

    .line 94
    :catchall_1
    move-exception p0

    .line 95
    goto :goto_2

    .line 96
    :catch_1
    move-exception v3

    .line 97
    :goto_1
    :try_start_2
    new-instance v4, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .line 101
    .line 102
    const-string v6, "[check] checkV2CacheEvent exception:"

    .line 103
    .line 104
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    invoke-static {v5, v3}, Ll/du2;->v(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 119
    .line 120
    .line 121
    invoke-static {v7}, Ll/m1m;->a(Ljava/io/Closeable;)V

    .line 122
    .line 123
    .line 124
    goto :goto_3

    .line 125
    :goto_2
    invoke-static {v7}, Ll/m1m;->a(Ljava/io/Closeable;)V

    .line 126
    .line 127
    .line 128
    throw p0

    .line 129
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    const-string v4, "[check] checkV2CacheEvent jsonFile is null!"

    .line 132
    .line 133
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    invoke-interface {p1}, Ll/f0m;->a()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    invoke-static {v5, v3}, Ll/du2;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    :cond_2
    :goto_3
    add-int/lit8 v2, v2, 0x1

    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_3
    :goto_4
    return-void
.end method

.method public final f(Ljava/io/File;)Ljava/io/File;
    .locals 1
    .param p1    # Ljava/io/File;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    new-instance v0, Ll/zx3$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zx3$c;-><init>(Ll/zx3;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/nki;->h(Ljava/io/File;Ljava/io/FilenameFilter;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-lez p1, :cond_0

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/io/File;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public g()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zx3;->b:Ll/yni0;

    .line 2
    .line 3
    new-instance v1, Ll/zx3$b;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/zx3$b;-><init>(Ll/zx3;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/yni0;->a(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
