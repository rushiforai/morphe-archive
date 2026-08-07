.class Lcom/bumptech/glide/load/engine/t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/engine/e;
.implements Lcom/bumptech/glide/load/engine/e$a;


# instance fields
.field private final a:Lcom/bumptech/glide/load/engine/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/f<",
            "*>;"
        }
    .end annotation
.end field

.field private final b:Lcom/bumptech/glide/load/engine/e$a;

.field private volatile c:I

.field private volatile d:Lcom/bumptech/glide/load/engine/b;

.field private volatile e:Ljava/lang/Object;

.field private volatile f:Ll/re00$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/re00$a<",
            "*>;"
        }
    .end annotation
.end field

.field private volatile g:Lcom/bumptech/glide/load/engine/c;


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/engine/f;Lcom/bumptech/glide/load/engine/e$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/f<",
            "*>;",
            "Lcom/bumptech/glide/load/engine/e$a;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/t;->a:Lcom/bumptech/glide/load/engine/f;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/t;->b:Lcom/bumptech/glide/load/engine/e$a;

    .line 7
    .line 8
    return-void
.end method

.method private b(Ljava/lang/Object;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string v0, "SourceGenerator"

    .line 2
    .line 3
    invoke-static {}, Ll/izv;->b()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    const/4 v3, 0x0

    .line 8
    :try_start_0
    iget-object v4, p0, Lcom/bumptech/glide/load/engine/t;->a:Lcom/bumptech/glide/load/engine/f;

    .line 9
    .line 10
    invoke-virtual {v4, p1}, Lcom/bumptech/glide/load/engine/f;->o(Ljava/lang/Object;)Lcom/bumptech/glide/load/data/a;

    .line 11
    .line 12
    .line 13
    move-result-object v4

    .line 14
    invoke-interface {v4}, Lcom/bumptech/glide/load/data/a;->a()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    iget-object v6, p0, Lcom/bumptech/glide/load/engine/t;->a:Lcom/bumptech/glide/load/engine/f;

    .line 19
    .line 20
    invoke-virtual {v6, v5}, Lcom/bumptech/glide/load/engine/f;->q(Ljava/lang/Object;)Ll/v0f;

    .line 21
    .line 22
    .line 23
    move-result-object v6

    .line 24
    new-instance v7, Lcom/bumptech/glide/load/engine/d;

    .line 25
    .line 26
    iget-object v8, p0, Lcom/bumptech/glide/load/engine/t;->a:Lcom/bumptech/glide/load/engine/f;

    .line 27
    .line 28
    invoke-virtual {v8}, Lcom/bumptech/glide/load/engine/f;->k()Ll/u560;

    .line 29
    .line 30
    .line 31
    move-result-object v8

    .line 32
    invoke-direct {v7, v6, v5, v8}, Lcom/bumptech/glide/load/engine/d;-><init>(Ll/v0f;Ljava/lang/Object;Ll/u560;)V

    .line 33
    .line 34
    .line 35
    new-instance v5, Lcom/bumptech/glide/load/engine/c;

    .line 36
    .line 37
    iget-object v8, p0, Lcom/bumptech/glide/load/engine/t;->f:Ll/re00$a;

    .line 38
    .line 39
    iget-object v8, v8, Ll/re00$a;->a:Ll/kzq;

    .line 40
    .line 41
    iget-object v9, p0, Lcom/bumptech/glide/load/engine/t;->a:Lcom/bumptech/glide/load/engine/f;

    .line 42
    .line 43
    invoke-virtual {v9}, Lcom/bumptech/glide/load/engine/f;->p()Ll/kzq;

    .line 44
    .line 45
    .line 46
    move-result-object v9

    .line 47
    invoke-direct {v5, v8, v9}, Lcom/bumptech/glide/load/engine/c;-><init>(Ll/kzq;Ll/kzq;)V

    .line 48
    .line 49
    .line 50
    iget-object v8, p0, Lcom/bumptech/glide/load/engine/t;->a:Lcom/bumptech/glide/load/engine/f;

    .line 51
    .line 52
    invoke-virtual {v8}, Lcom/bumptech/glide/load/engine/f;->d()Ll/z3e;

    .line 53
    .line 54
    .line 55
    move-result-object v8

    .line 56
    invoke-interface {v8, v5, v7}, Ll/z3e;->b(Ll/kzq;Ll/z3e$b;)V

    .line 57
    .line 58
    .line 59
    const/4 v7, 0x2

    .line 60
    invoke-static {v0, v7}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 61
    .line 62
    .line 63
    move-result v7

    .line 64
    if-eqz v7, :cond_0

    .line 65
    .line 66
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    invoke-static {v6}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    invoke-static {v1, v2}, Ll/izv;->a(J)D

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :catchall_0
    move-exception v0

    .line 80
    move-object p1, v0

    .line 81
    goto :goto_1

    .line 82
    :cond_0
    :goto_0
    invoke-interface {v8, v5}, Ll/z3e;->a(Ll/kzq;)Ljava/io/File;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    const/4 v2, 0x1

    .line 87
    if-eqz v1, :cond_1

    .line 88
    .line 89
    iput-object v5, p0, Lcom/bumptech/glide/load/engine/t;->g:Lcom/bumptech/glide/load/engine/c;

    .line 90
    .line 91
    new-instance p1, Lcom/bumptech/glide/load/engine/b;

    .line 92
    .line 93
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->f:Ll/re00$a;

    .line 94
    .line 95
    iget-object v0, v0, Ll/re00$a;->a:Ll/kzq;

    .line 96
    .line 97
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/t;->a:Lcom/bumptech/glide/load/engine/f;

    .line 102
    .line 103
    invoke-direct {p1, v0, v1, p0}, Lcom/bumptech/glide/load/engine/b;-><init>(Ljava/util/List;Lcom/bumptech/glide/load/engine/f;Lcom/bumptech/glide/load/engine/e$a;)V

    .line 104
    .line 105
    .line 106
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/t;->d:Lcom/bumptech/glide/load/engine/b;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    .line 108
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/t;->f:Ll/re00$a;

    .line 109
    .line 110
    iget-object p0, p0, Ll/re00$a;->c:Ll/t5c;

    .line 111
    .line 112
    invoke-interface {p0}, Ll/t5c;->cleanup()V

    .line 113
    .line 114
    .line 115
    return v2

    .line 116
    :cond_1
    const/4 v1, 0x3

    .line 117
    :try_start_1
    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_2

    .line 122
    .line 123
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->g:Lcom/bumptech/glide/load/engine/c;

    .line 124
    .line 125
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 129
    .line 130
    .line 131
    :cond_2
    move-object p1, v4

    .line 132
    :try_start_2
    iget-object v4, p0, Lcom/bumptech/glide/load/engine/t;->b:Lcom/bumptech/glide/load/engine/e$a;

    .line 133
    .line 134
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->f:Ll/re00$a;

    .line 135
    .line 136
    iget-object v5, v0, Ll/re00$a;->a:Ll/kzq;

    .line 137
    .line 138
    invoke-interface {p1}, Lcom/bumptech/glide/load/data/a;->a()Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v6

    .line 142
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/t;->f:Ll/re00$a;

    .line 143
    .line 144
    iget-object v7, p1, Ll/re00$a;->c:Ll/t5c;

    .line 145
    .line 146
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/t;->f:Ll/re00$a;

    .line 147
    .line 148
    iget-object p1, p1, Ll/re00$a;->c:Ll/t5c;

    .line 149
    .line 150
    invoke-interface {p1}, Ll/t5c;->getDataSource()Lcom/bumptech/glide/load/DataSource;

    .line 151
    .line 152
    .line 153
    move-result-object v8

    .line 154
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/t;->f:Ll/re00$a;

    .line 155
    .line 156
    iget-object v9, p1, Ll/re00$a;->a:Ll/kzq;

    .line 157
    .line 158
    invoke-interface/range {v4 .. v9}, Lcom/bumptech/glide/load/engine/e$a;->h(Ll/kzq;Ljava/lang/Object;Ll/t5c;Lcom/bumptech/glide/load/DataSource;Ll/kzq;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 159
    .line 160
    .line 161
    return v3

    .line 162
    :catchall_1
    move-exception v0

    .line 163
    move-object p1, v0

    .line 164
    move v3, v2

    .line 165
    :goto_1
    if-nez v3, :cond_3

    .line 166
    .line 167
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/t;->f:Ll/re00$a;

    .line 168
    .line 169
    iget-object p0, p0, Ll/re00$a;->c:Ll/t5c;

    .line 170
    .line 171
    invoke-interface {p0}, Ll/t5c;->cleanup()V

    .line 172
    .line 173
    .line 174
    :cond_3
    throw p1
.end method

.method private c()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/bumptech/glide/load/engine/t;->c:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/t;->a:Lcom/bumptech/glide/load/engine/f;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/f;->g()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-ge v0, p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private j(Ll/re00$a;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/re00$a<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->f:Ll/re00$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/re00$a;->c:Ll/t5c;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/t;->a:Lcom/bumptech/glide/load/engine/f;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/f;->l()Lcom/bumptech/glide/Priority;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    new-instance v2, Lcom/bumptech/glide/load/engine/t$a;

    .line 12
    .line 13
    invoke-direct {v2, p0, p1}, Lcom/bumptech/glide/load/engine/t$a;-><init>(Lcom/bumptech/glide/load/engine/t;Ll/re00$a;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v1, v2}, Ll/t5c;->d(Lcom/bumptech/glide/Priority;Ll/t5c$a;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->e:Ljava/lang/Object;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->e:Ljava/lang/Object;

    .line 8
    .line 9
    iput-object v1, p0, Lcom/bumptech/glide/load/engine/t;->e:Ljava/lang/Object;

    .line 10
    .line 11
    :try_start_0
    invoke-direct {p0, v0}, Lcom/bumptech/glide/load/engine/t;->b(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    return v2

    .line 18
    :catch_0
    const-string v0, "SourceGenerator"

    .line 19
    .line 20
    const/4 v3, 0x3

    .line 21
    invoke-static {v0, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->d:Lcom/bumptech/glide/load/engine/b;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->d:Lcom/bumptech/glide/load/engine/b;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/b;->a()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    return v2

    .line 37
    :cond_1
    iput-object v1, p0, Lcom/bumptech/glide/load/engine/t;->d:Lcom/bumptech/glide/load/engine/b;

    .line 38
    .line 39
    iput-object v1, p0, Lcom/bumptech/glide/load/engine/t;->f:Ll/re00$a;

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    :cond_2
    :goto_0
    if-nez v0, :cond_4

    .line 43
    .line 44
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/t;->c()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_4

    .line 49
    .line 50
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/t;->a:Lcom/bumptech/glide/load/engine/f;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/f;->g()Ljava/util/List;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget v3, p0, Lcom/bumptech/glide/load/engine/t;->c:I

    .line 57
    .line 58
    add-int/lit8 v4, v3, 0x1

    .line 59
    .line 60
    iput v4, p0, Lcom/bumptech/glide/load/engine/t;->c:I

    .line 61
    .line 62
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Ll/re00$a;

    .line 67
    .line 68
    iput-object v1, p0, Lcom/bumptech/glide/load/engine/t;->f:Ll/re00$a;

    .line 69
    .line 70
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/t;->f:Ll/re00$a;

    .line 71
    .line 72
    if-eqz v1, :cond_2

    .line 73
    .line 74
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/t;->a:Lcom/bumptech/glide/load/engine/f;

    .line 75
    .line 76
    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/f;->e()Ll/d4e;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iget-object v3, p0, Lcom/bumptech/glide/load/engine/t;->f:Ll/re00$a;

    .line 81
    .line 82
    iget-object v3, v3, Ll/re00$a;->c:Ll/t5c;

    .line 83
    .line 84
    invoke-interface {v3}, Ll/t5c;->getDataSource()Lcom/bumptech/glide/load/DataSource;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-virtual {v1, v3}, Ll/d4e;->c(Lcom/bumptech/glide/load/DataSource;)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-nez v1, :cond_3

    .line 93
    .line 94
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/t;->a:Lcom/bumptech/glide/load/engine/f;

    .line 95
    .line 96
    iget-object v3, p0, Lcom/bumptech/glide/load/engine/t;->f:Ll/re00$a;

    .line 97
    .line 98
    iget-object v3, v3, Ll/re00$a;->c:Ll/t5c;

    .line 99
    .line 100
    invoke-interface {v3}, Ll/t5c;->a()Ljava/lang/Class;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-virtual {v1, v3}, Lcom/bumptech/glide/load/engine/f;->u(Ljava/lang/Class;)Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-eqz v1, :cond_2

    .line 109
    .line 110
    :cond_3
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->f:Ll/re00$a;

    .line 111
    .line 112
    invoke-direct {p0, v0}, Lcom/bumptech/glide/load/engine/t;->j(Ll/re00$a;)V

    .line 113
    .line 114
    .line 115
    move v0, v2

    .line 116
    goto :goto_0

    .line 117
    :cond_4
    return v0
.end method

.method public cancel()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/t;->f:Ll/re00$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/re00$a;->c:Ll/t5c;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/t5c;->cancel()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public d(Ll/re00$a;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/re00$a<",
            "*>;)Z"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/t;->f:Ll/re00$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    if-ne p0, p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public e(Ll/re00$a;Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/re00$a<",
            "*>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->a:Lcom/bumptech/glide/load/engine/f;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/f;->e()Ll/d4e;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object v1, p1, Ll/re00$a;->c:Ll/t5c;

    .line 10
    .line 11
    invoke-interface {v1}, Ll/t5c;->getDataSource()Lcom/bumptech/glide/load/DataSource;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/d4e;->c(Lcom/bumptech/glide/load/DataSource;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/t;->e:Ljava/lang/Object;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/t;->b:Lcom/bumptech/glide/load/engine/e$a;

    .line 24
    .line 25
    invoke-interface {p0}, Lcom/bumptech/glide/load/engine/e$a;->g()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->b:Lcom/bumptech/glide/load/engine/e$a;

    .line 30
    .line 31
    iget-object v1, p1, Ll/re00$a;->a:Ll/kzq;

    .line 32
    .line 33
    iget-object v3, p1, Ll/re00$a;->c:Ll/t5c;

    .line 34
    .line 35
    invoke-interface {v3}, Ll/t5c;->getDataSource()Lcom/bumptech/glide/load/DataSource;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    iget-object v5, p0, Lcom/bumptech/glide/load/engine/t;->g:Lcom/bumptech/glide/load/engine/c;

    .line 40
    .line 41
    move-object v2, p2

    .line 42
    invoke-interface/range {v0 .. v5}, Lcom/bumptech/glide/load/engine/e$a;->h(Ll/kzq;Ljava/lang/Object;Ll/t5c;Lcom/bumptech/glide/load/DataSource;Ll/kzq;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public f(Ll/kzq;Ljava/lang/Exception;Ll/t5c;Lcom/bumptech/glide/load/DataSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/kzq;",
            "Ljava/lang/Exception;",
            "Ll/t5c<",
            "*>;",
            "Lcom/bumptech/glide/load/DataSource;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p4, p0, Lcom/bumptech/glide/load/engine/t;->b:Lcom/bumptech/glide/load/engine/e$a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/t;->f:Ll/re00$a;

    .line 4
    .line 5
    iget-object p0, p0, Ll/re00$a;->c:Ll/t5c;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/t5c;->getDataSource()Lcom/bumptech/glide/load/DataSource;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p4, p1, p2, p3, p0}, Lcom/bumptech/glide/load/engine/e$a;->f(Ll/kzq;Ljava/lang/Exception;Ll/t5c;Lcom/bumptech/glide/load/DataSource;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public g()V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method

.method public h(Ll/kzq;Ljava/lang/Object;Ll/t5c;Lcom/bumptech/glide/load/DataSource;Ll/kzq;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/kzq;",
            "Ljava/lang/Object;",
            "Ll/t5c<",
            "*>;",
            "Lcom/bumptech/glide/load/DataSource;",
            "Ll/kzq;",
            ")V"
        }
    .end annotation

    .line 1
    move-object p4, p0

    .line 2
    iget-object p0, p4, Lcom/bumptech/glide/load/engine/t;->b:Lcom/bumptech/glide/load/engine/e$a;

    .line 3
    .line 4
    iget-object p4, p4, Lcom/bumptech/glide/load/engine/t;->f:Ll/re00$a;

    .line 5
    .line 6
    iget-object p4, p4, Ll/re00$a;->c:Ll/t5c;

    .line 7
    .line 8
    invoke-interface {p4}, Ll/t5c;->getDataSource()Lcom/bumptech/glide/load/DataSource;

    .line 9
    .line 10
    .line 11
    move-result-object p4

    .line 12
    move-object p5, p1

    .line 13
    invoke-interface/range {p0 .. p5}, Lcom/bumptech/glide/load/engine/e$a;->h(Ll/kzq;Ljava/lang/Object;Ll/t5c;Lcom/bumptech/glide/load/DataSource;Ll/kzq;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public i(Ll/re00$a;Ljava/lang/Exception;)V
    .locals 2
    .param p2    # Ljava/lang/Exception;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/re00$a<",
            "*>;",
            "Ljava/lang/Exception;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->b:Lcom/bumptech/glide/load/engine/e$a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/t;->g:Lcom/bumptech/glide/load/engine/c;

    .line 4
    .line 5
    iget-object p1, p1, Ll/re00$a;->c:Ll/t5c;

    .line 6
    .line 7
    invoke-interface {p1}, Ll/t5c;->getDataSource()Lcom/bumptech/glide/load/DataSource;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v0, p0, p2, p1, v1}, Lcom/bumptech/glide/load/engine/e$a;->f(Ll/kzq;Ljava/lang/Exception;Ll/t5c;Lcom/bumptech/glide/load/DataSource;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
