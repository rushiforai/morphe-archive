.class public Ll/i650;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fvl;


# instance fields
.field private a:Ll/ry3;

.field private b:Ljava/lang/String;

.field private c:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private e:[Ll/n1j;

.field private f:I

.field private g:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;[Ll/n1j;Ll/rt0;)V
    .locals 1
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
            "Ljava/lang/String;",
            ">;[",
            "Ll/n1j;",
            "Ll/rt0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/i650;->c:Ljava/util/Map;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/i650;->d:Ljava/util/Map;

    .line 17
    .line 18
    iput-object p1, p0, Ll/i650;->b:Ljava/lang/String;

    .line 19
    .line 20
    iget-object p1, p0, Ll/i650;->c:Ljava/util/Map;

    .line 21
    .line 22
    invoke-interface {p1, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/i650;->d:Ljava/util/Map;

    .line 26
    .line 27
    invoke-interface {p1, p3}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 28
    .line 29
    .line 30
    iput-object p4, p0, Ll/i650;->e:[Ll/n1j;

    .line 31
    .line 32
    invoke-direct {p0, p5}, Ll/i650;->e(Ll/rt0;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private c()Ll/x1d0;
    .locals 2

    .line 1
    new-instance v0, Ll/omj;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/omj;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/i650;->c:Ljava/util/Map;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/omj;->b(Ljava/util/Map;)Ll/omj;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Ll/i650;->d:Ljava/util/Map;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/omj;->c(Ljava/util/Map;)Ll/omj;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object p0, p0, Ll/i650;->b:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ll/omj;->d(Ljava/lang/String;)Ll/omj;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/omj;->a()Ll/x1d0;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method private d()Ll/x1d0;
    .locals 2

    .line 1
    new-instance v0, Ll/ul80;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ul80;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/i650;->b:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/ul80;->e(Ljava/lang/String;)Ll/ul80;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Ll/i650;->c:Ljava/util/Map;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/ul80;->c(Ljava/util/Map;)Ll/ul80;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Ll/i650;->d:Ljava/util/Map;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/ul80;->d(Ljava/util/Map;)Ll/ul80;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object p0, p0, Ll/i650;->e:[Ll/n1j;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ll/ul80;->b([Ll/n1j;)Ll/ul80;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ll/ul80;->a()Ll/x1d0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method private e(Ll/rt0;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Ll/yld;

    .line 4
    .line 5
    invoke-direct {p1}, Ll/yld;-><init>()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-interface {p1}, Ll/rt0;->d()Ljava/util/Map;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ll/i650;->c:Ljava/util/Map;

    .line 15
    .line 16
    invoke-interface {p1}, Ll/rt0;->d()Ljava/util/Map;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    invoke-interface {p1}, Ll/rt0;->c()Ljava/util/Map;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    iget-object v0, p0, Ll/i650;->d:Ljava/util/Map;

    .line 30
    .line 31
    invoke-interface {p1}, Ll/rt0;->c()Ljava/util/Map;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 36
    .line 37
    .line 38
    :cond_2
    invoke-interface {p1}, Ll/rt0;->e()Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    invoke-interface {p1}, Ll/rt0;->e()Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_3

    .line 57
    .line 58
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    check-cast v1, Ljava/lang/String;

    .line 63
    .line 64
    iget-object v2, p0, Ll/i650;->d:Ljava/util/Map;

    .line 65
    .line 66
    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    invoke-interface {p1}, Ll/rt0;->b()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iput v0, p0, Ll/i650;->f:I

    .line 75
    .line 76
    invoke-interface {p1}, Ll/rt0;->a()I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    iput p1, p0, Ll/i650;->g:I

    .line 81
    .line 82
    return-void
.end method

.method private f(Z)Ll/fvl$a;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Ll/i650;->d()Ll/x1d0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-direct {p0}, Ll/i650;->c()Ll/x1d0;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    :goto_0
    invoke-static {}, Lcom/immomo/medialog/util/utilcode/util/NetworkUtils;->b()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const-string v3, "\u9519\u8bef\u7801\uff1a%s,\u5f53\u524d\u7f51\u7edc\u4e0d\u53ef\u7528\uff0c\u8bf7\u68c0\u67e5"

    .line 21
    .line 22
    const/16 v4, -0x3ea

    .line 23
    .line 24
    const/4 v5, 0x0

    .line 25
    if-eqz v2, :cond_7

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    move v6, v2

    .line 29
    :goto_1
    add-int/lit8 v7, v6, 0x1

    .line 30
    .line 31
    iget v8, p0, Ll/i650;->f:I

    .line 32
    .line 33
    const-string v9, "\u9519\u8bef\u7801\uff1a%s,\u7f51\u7edc\u8bf7\u6c42\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    .line 34
    .line 35
    if-gt v6, v8, :cond_6

    .line 36
    .line 37
    new-instance v6, Ll/h2d0;

    .line 38
    .line 39
    invoke-direct {v6}, Ll/h2d0;-><init>()V

    .line 40
    .line 41
    .line 42
    :try_start_0
    invoke-static {}, Ll/vg50;->g()Ll/vg50;

    .line 43
    .line 44
    .line 45
    move-result-object v8

    .line 46
    const-string v10, "REQUEST_INSTANCE"

    .line 47
    .line 48
    invoke-virtual {v8, v10, v6, p1}, Ll/vg50;->a(Ljava/lang/String;Ll/h2d0;Ll/x1d0;)Ll/ry3;

    .line 49
    .line 50
    .line 51
    move-result-object v8

    .line 52
    iput-object v8, p0, Ll/i650;->a:Ll/ry3;

    .line 53
    .line 54
    invoke-interface {v8}, Ll/ry3;->execute()Ll/i5d0;

    .line 55
    .line 56
    .line 57
    move-result-object v8

    .line 58
    invoke-virtual {v8}, Ll/i5d0;->I()Z

    .line 59
    .line 60
    .line 61
    move-result v10

    .line 62
    if-eqz v10, :cond_2

    .line 63
    .line 64
    invoke-virtual {v6}, Ll/h2d0;->a()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v10

    .line 68
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v10

    .line 72
    if-nez v10, :cond_1

    .line 73
    .line 74
    invoke-static {}, Ll/vg50;->g()Ll/vg50;

    .line 75
    .line 76
    .line 77
    move-result-object v10

    .line 78
    invoke-virtual {v6}, Ll/h2d0;->b()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v11

    .line 82
    invoke-virtual {v6}, Ll/h2d0;->a()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v12

    .line 86
    invoke-virtual {v10, v11, v12, v2}, Ll/vg50;->f(Ljava/lang/String;Ljava/lang/String;I)V

    .line 87
    .line 88
    .line 89
    goto :goto_2

    .line 90
    :catch_0
    move-exception v8

    .line 91
    goto :goto_3

    .line 92
    :cond_1
    :goto_2
    new-instance v10, Ll/fvl$a;

    .line 93
    .line 94
    invoke-virtual {v8}, Ll/i5d0;->q()I

    .line 95
    .line 96
    .line 97
    move-result v11

    .line 98
    invoke-virtual {v8}, Ll/i5d0;->J()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v12

    .line 102
    invoke-virtual {v8}, Ll/i5d0;->k()Ll/k5d0;

    .line 103
    .line 104
    .line 105
    move-result-object v8

    .line 106
    invoke-virtual {v8}, Ll/k5d0;->string()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v8

    .line 110
    invoke-direct {v10, v11, v12, v8}, Ll/fvl$a;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    return-object v10

    .line 114
    :cond_2
    new-instance v8, Lcom/immomo/medialog/api/http/LiveXRequestException;

    .line 115
    .line 116
    const/16 v10, -0x3e9

    .line 117
    .line 118
    invoke-direct {v8, v10, v5, v9}, Lcom/immomo/medialog/api/http/LiveXRequestException;-><init>(ILjava/lang/Throwable;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    throw v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    :goto_3
    invoke-virtual {v6}, Ll/h2d0;->a()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v10

    .line 126
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 127
    .line 128
    .line 129
    move-result v10

    .line 130
    if-nez v10, :cond_3

    .line 131
    .line 132
    invoke-static {}, Ll/vg50;->g()Ll/vg50;

    .line 133
    .line 134
    .line 135
    move-result-object v10

    .line 136
    invoke-virtual {v6}, Ll/h2d0;->b()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v11

    .line 140
    invoke-virtual {v6}, Ll/h2d0;->a()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v6

    .line 144
    const/4 v12, 0x1

    .line 145
    invoke-virtual {v10, v11, v6, v12}, Ll/vg50;->f(Ljava/lang/String;Ljava/lang/String;I)V

    .line 146
    .line 147
    .line 148
    :cond_3
    iget v6, p0, Ll/i650;->f:I

    .line 149
    .line 150
    if-gt v7, v6, :cond_5

    .line 151
    .line 152
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 153
    .line 154
    .line 155
    move-result-wide v10

    .line 156
    sub-long/2addr v10, v0

    .line 157
    iget v6, p0, Ll/i650;->g:I

    .line 158
    .line 159
    int-to-long v12, v6

    .line 160
    cmp-long v6, v10, v12

    .line 161
    .line 162
    if-gtz v6, :cond_5

    .line 163
    .line 164
    invoke-static {}, Lcom/immomo/medialog/util/utilcode/util/NetworkUtils;->b()Z

    .line 165
    .line 166
    .line 167
    move-result v6

    .line 168
    if-eqz v6, :cond_4

    .line 169
    .line 170
    const-wide/16 v8, 0x3e8

    .line 171
    .line 172
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V

    .line 173
    .line 174
    .line 175
    move v6, v7

    .line 176
    goto/16 :goto_1

    .line 177
    .line 178
    :cond_4
    new-instance p0, Lcom/immomo/medialog/api/http/LiveXRequestException;

    .line 179
    .line 180
    invoke-direct {p0, v4, v5, v3}, Lcom/immomo/medialog/api/http/LiveXRequestException;-><init>(ILjava/lang/Throwable;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    throw p0

    .line 184
    :cond_5
    new-instance p0, Lcom/immomo/medialog/api/http/LiveXRequestException;

    .line 185
    .line 186
    const/16 p1, -0x3eb

    .line 187
    .line 188
    invoke-direct {p0, p1, v8, v9}, Lcom/immomo/medialog/api/http/LiveXRequestException;-><init>(ILjava/lang/Throwable;Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    throw p0

    .line 192
    :cond_6
    new-instance p0, Lcom/immomo/medialog/api/http/LiveXRequestException;

    .line 193
    .line 194
    const/16 p1, -0x3ec

    .line 195
    .line 196
    invoke-direct {p0, p1, v5, v9}, Lcom/immomo/medialog/api/http/LiveXRequestException;-><init>(ILjava/lang/Throwable;Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    throw p0

    .line 200
    :cond_7
    new-instance p0, Lcom/immomo/medialog/api/http/LiveXRequestException;

    .line 201
    .line 202
    invoke-direct {p0, v4, v5, v3}, Lcom/immomo/medialog/api/http/LiveXRequestException;-><init>(ILjava/lang/Throwable;Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    throw p0
.end method


# virtual methods
.method public a()Ll/fvl$a;
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    invoke-direct {p0, v0}, Ll/i650;->f(Z)Ll/fvl$a;

    .line 3
    .line 4
    .line 5
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    return-object p0

    .line 7
    :catch_0
    move-exception p0

    .line 8
    instance-of v0, p0, Lcom/immomo/medialog/api/http/LiveXRequestException;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ll/fvl$a;

    .line 14
    .line 15
    check-cast p0, Lcom/immomo/medialog/api/http/LiveXRequestException;

    .line 16
    .line 17
    iget v2, p0, Lcom/immomo/medialog/api/http/LiveXRequestException;->code:I

    .line 18
    .line 19
    iget-object p0, p0, Lcom/immomo/medialog/api/http/LiveXRequestException;->showMsg:Ljava/lang/String;

    .line 20
    .line 21
    invoke-direct {v0, v2, p0, v1}, Ll/fvl$a;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_0
    new-instance v0, Ll/fvl$a;

    .line 26
    .line 27
    const/16 v2, -0x7cf

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-direct {v0, v2, p0, v1}, Ll/fvl$a;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-object v0
.end method

.method public b()Ll/fvl$a;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-direct {p0, v0}, Ll/i650;->f(Z)Ll/fvl$a;

    .line 3
    .line 4
    .line 5
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    return-object p0

    .line 7
    :catch_0
    move-exception p0

    .line 8
    instance-of v0, p0, Lcom/immomo/medialog/api/http/LiveXRequestException;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ll/fvl$a;

    .line 14
    .line 15
    check-cast p0, Lcom/immomo/medialog/api/http/LiveXRequestException;

    .line 16
    .line 17
    iget v2, p0, Lcom/immomo/medialog/api/http/LiveXRequestException;->code:I

    .line 18
    .line 19
    iget-object p0, p0, Lcom/immomo/medialog/api/http/LiveXRequestException;->showMsg:Ljava/lang/String;

    .line 20
    .line 21
    invoke-direct {v0, v2, p0, v1}, Ll/fvl$a;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_0
    new-instance v0, Ll/fvl$a;

    .line 26
    .line 27
    const/16 v2, -0x7cf

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-direct {v0, v2, p0, v1}, Ll/fvl$a;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-object v0
.end method
