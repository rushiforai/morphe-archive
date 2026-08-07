.class Lcom/tencent/open/a/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/open/a/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/open/a/e$a;
    }
.end annotation


# instance fields
.field private a:Ll/rg50;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoClassDefFoundError;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/tencent/open/a/e;->a(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private a(Ljava/lang/String;)V
    .locals 4

    .line 190
    invoke-static {}, Ll/q9l0;->a()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 191
    const-string v1, "okhttp/3"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 192
    new-instance v0, Lcom/tencent/open/a/e$a;

    invoke-direct {v0, p1}, Lcom/tencent/open/a/e$a;-><init>(Ljava/lang/String;)V

    .line 193
    new-instance p1, Ll/rg50$b;

    invoke-direct {p1}, Ll/rg50$b;-><init>()V

    sget-object v1, Lokhttp3/a;->h:Lokhttp3/a;

    sget-object v2, Lokhttp3/a;->i:Lokhttp3/a;

    filled-new-array {v1, v2}, [Lokhttp3/a;

    move-result-object v1

    .line 194
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1, v1}, Ll/rg50$b;->h(Ljava/util/List;)Ll/rg50$b;

    move-result-object p1

    const-wide/16 v1, 0x3a98

    .line 195
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v1, v2, v3}, Ll/rg50$b;->f(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    move-result-object p1

    const-wide/16 v1, 0x7530

    .line 196
    invoke-virtual {p1, v1, v2, v3}, Ll/rg50$b;->u(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    move-result-object p1

    .line 197
    invoke-virtual {p1, v1, v2, v3}, Ll/rg50$b;->y(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    move-result-object p1

    const/4 v1, 0x0

    .line 198
    invoke-virtual {p1, v1}, Ll/rg50$b;->d(Ll/tx3;)Ll/rg50$b;

    move-result-object p1

    .line 199
    invoke-virtual {p1, v0}, Ll/rg50$b;->a(Ll/azm;)Ll/rg50$b;

    move-result-object p1

    .line 200
    invoke-direct {p0, p1}, Lcom/tencent/open/a/e;->a(Ll/rg50$b;)V

    .line 201
    invoke-virtual {p1}, Ll/rg50$b;->c()Ll/rg50;

    move-result-object p1

    iput-object p1, p0, Lcom/tencent/open/a/e;->a:Ll/rg50;

    return-void

    .line 202
    :cond_0
    new-instance p0, Ljava/lang/NoClassDefFoundError;

    invoke-direct {p0}, Ljava/lang/NoClassDefFoundError;-><init>()V

    throw p0
.end method

.method private a(Ll/rg50$b;)V
    .locals 0

    .line 203
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/open/a/g;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 167
    const-string v0, "OkHttpServiceImpl"

    const-string v1, "get."

    invoke-static {v0, v1}, Lcom/tencent/open/log/SLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 169
    const-string v0, "?"

    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 170
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 171
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-eq v1, v0, :cond_1

    .line 172
    const-string v0, "&"

    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 173
    :cond_1
    :goto_0
    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 174
    :cond_2
    new-instance v0, Ll/x1d0$a;

    invoke-direct {v0}, Ll/x1d0$a;-><init>()V

    invoke-virtual {v0, p1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    move-result-object p1

    invoke-virtual {p1}, Ll/x1d0$a;->f()Ll/x1d0$a;

    move-result-object p1

    invoke-virtual {p1}, Ll/x1d0$a;->b()Ll/x1d0;

    move-result-object p1

    .line 175
    iget-object p0, p0, Lcom/tencent/open/a/e;->a:Ll/rg50;

    invoke-virtual {p0, p1}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    move-result-object p0

    invoke-interface {p0}, Ll/ry3;->execute()Ll/i5d0;

    move-result-object p0

    .line 176
    new-instance p1, Lcom/tencent/open/a/d;

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    invoke-direct {p1, p0, p2}, Lcom/tencent/open/a/d;-><init>(Ll/i5d0;I)V

    return-object p1
.end method

.method public a(Ljava/lang/String;Ljava/util/Map;)Lcom/tencent/open/a/g;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/tencent/open/a/g;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 177
    const-string v0, "OkHttpServiceImpl"

    const-string v1, "post data"

    invoke-static {v0, v1}, Lcom/tencent/open/log/SLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    new-instance v0, Ll/l1j$a;

    invoke-direct {v0}, Ll/l1j$a;-><init>()V

    if-eqz p2, :cond_1

    .line 179
    invoke-interface {p2}, Ljava/util/Map;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 180
    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 181
    invoke-interface {p2, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 182
    invoke-virtual {v0, v2, v3}, Ll/l1j$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/l1j$a;

    goto :goto_0

    .line 183
    :cond_1
    invoke-virtual {v0}, Ll/l1j$a;->b()Ll/l1j;

    move-result-object p2

    .line 184
    new-instance v0, Ll/x1d0$a;

    invoke-direct {v0}, Ll/x1d0$a;-><init>()V

    .line 185
    invoke-virtual {v0, p1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    move-result-object p1

    .line 186
    invoke-virtual {p1, p2}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    move-result-object p1

    .line 187
    invoke-virtual {p1}, Ll/x1d0$a;->b()Ll/x1d0;

    move-result-object p1

    .line 188
    iget-object p0, p0, Lcom/tencent/open/a/e;->a:Ll/rg50;

    invoke-virtual {p0, p1}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    move-result-object p0

    invoke-interface {p0}, Ll/ry3;->execute()Ll/i5d0;

    move-result-object p0

    .line 189
    new-instance p1, Lcom/tencent/open/a/d;

    invoke-virtual {p2}, Ll/l1j;->contentLength()J

    move-result-wide v0

    long-to-int p2, v0

    invoke-direct {p1, p0, p2}, Lcom/tencent/open/a/d;-><init>(Ll/i5d0;I)V

    return-object p1
.end method

.method public a(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)Lcom/tencent/open/a/g;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[B>;)",
            "Lcom/tencent/open/a/g;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    if-eqz p3, :cond_5

    .line 2
    .line 3
    invoke-interface {p3}, Ljava/util/Map;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_2

    .line 10
    .line 11
    :cond_0
    const-string v0, "post data, has byte data"

    .line 12
    .line 13
    const-string v1, "OkHttpServiceImpl"

    .line 14
    .line 15
    invoke-static {v1, v0}, Lcom/tencent/open/log/SLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/ku10$a;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/ku10$a;-><init>()V

    .line 21
    .line 22
    .line 23
    if-eqz p2, :cond_2

    .line 24
    .line 25
    invoke-interface {p2}, Ljava/util/Map;->size()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-lez v2, :cond_2

    .line 30
    .line 31
    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_2

    .line 44
    .line 45
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, Ljava/lang/String;

    .line 50
    .line 51
    invoke-interface {p2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    check-cast v4, Ljava/lang/String;

    .line 56
    .line 57
    if-eqz v4, :cond_1

    .line 58
    .line 59
    invoke-virtual {v0, v3, v4}, Ll/ku10$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ku10$a;

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    invoke-interface {p3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    :cond_3
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-eqz v2, :cond_4

    .line 76
    .line 77
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    check-cast v2, Ljava/lang/String;

    .line 82
    .line 83
    invoke-interface {p3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    check-cast v3, [B

    .line 88
    .line 89
    if-eqz v3, :cond_3

    .line 90
    .line 91
    array-length v4, v3

    .line 92
    if-lez v4, :cond_3

    .line 93
    .line 94
    const-string v4, "content/unknown"

    .line 95
    .line 96
    invoke-static {v4}, Ll/e7y;->c(Ljava/lang/String;)Ll/e7y;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    invoke-static {v4, v3}, Ll/z1d0;->create(Ll/e7y;[B)Ll/z1d0;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-virtual {v0, v2, v2, v3}, Ll/ku10$a;->b(Ljava/lang/String;Ljava/lang/String;Ll/z1d0;)Ll/ku10$a;

    .line 105
    .line 106
    .line 107
    const-string v2, "post byte data."

    .line 108
    .line 109
    invoke-static {v1, v2}, Lcom/tencent/open/log/SLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_4
    invoke-virtual {v0}, Ll/ku10$a;->e()Ll/ku10;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    new-instance p3, Ll/x1d0$a;

    .line 118
    .line 119
    invoke-direct {p3}, Ll/x1d0$a;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p3, p1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p1, p2}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {p1}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    iget-object p0, p0, Lcom/tencent/open/a/e;->a:Ll/rg50;

    .line 135
    .line 136
    invoke-virtual {p0, p1}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-interface {p0}, Ll/ry3;->execute()Ll/i5d0;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    new-instance p1, Lcom/tencent/open/a/d;

    .line 145
    .line 146
    invoke-virtual {p2}, Ll/ku10;->contentLength()J

    .line 147
    .line 148
    .line 149
    move-result-wide p2

    .line 150
    long-to-int p2, p2

    .line 151
    invoke-direct {p1, p0, p2}, Lcom/tencent/open/a/d;-><init>(Ll/i5d0;I)V

    .line 152
    .line 153
    .line 154
    return-object p1

    .line 155
    :cond_5
    :goto_2
    invoke-virtual {p0, p1, p2}, Lcom/tencent/open/a/e;->a(Ljava/lang/String;Ljava/util/Map;)Lcom/tencent/open/a/g;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    return-object p0
.end method

.method public a(JJ)V
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_2

    cmp-long v0, p3, v0

    if-gtz v0, :cond_0

    goto :goto_0

    .line 160
    :cond_0
    iget-object v0, p0, Lcom/tencent/open/a/e;->a:Ll/rg50;

    invoke-virtual {v0}, Ll/rg50;->f()I

    move-result v0

    int-to-long v0, v0

    cmp-long v0, v0, p1

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/tencent/open/a/e;->a:Ll/rg50;

    invoke-virtual {v0}, Ll/rg50;->D()I

    move-result v0

    int-to-long v0, v0

    cmp-long v0, v0, p3

    if-eqz v0, :cond_2

    .line 161
    :cond_1
    const-string v0, "OkHttpServiceImpl"

    const-string v1, "setTimeout changed."

    invoke-static {v0, v1}, Lcom/tencent/open/log/SLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    iget-object v0, p0, Lcom/tencent/open/a/e;->a:Ll/rg50;

    invoke-virtual {v0}, Ll/rg50;->v()Ll/rg50$b;

    move-result-object v0

    .line 163
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p1, p2, v1}, Ll/rg50$b;->f(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    move-result-object p1

    .line 164
    invoke-virtual {p1, p3, p4, v1}, Ll/rg50$b;->u(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    move-result-object p1

    .line 165
    invoke-virtual {p1, p3, p4, v1}, Ll/rg50$b;->y(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    move-result-object p1

    .line 166
    invoke-virtual {p1}, Ll/rg50$b;->c()Ll/rg50;

    move-result-object p1

    iput-object p1, p0, Lcom/tencent/open/a/e;->a:Ll/rg50;

    :cond_2
    :goto_0
    return-void
.end method
