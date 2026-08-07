.class Lcom/tencent/liteav/network/c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/tencent/liteav/network/b;

.field public b:I

.field private final c:Ljava/lang/String;

.field private final d:Ljava/lang/String;

.field private final e:Ljava/lang/String;

.field private final f:Ljava/lang/String;

.field private final g:Ljava/lang/String;

.field private final h:Ljava/lang/String;

.field private final i:Ljava/lang/String;

.field private final j:I

.field private final k:I

.field private l:Ljava/lang/Thread;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "https://tcdns.myqcloud.com/queryip"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/liteav/network/c;->c:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "https://tcdnsipv6.myqcloud.com/queryip"

    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/liteav/network/c;->d:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "forward_stream"

    .line 13
    .line 14
    iput-object v0, p0, Lcom/tencent/liteav/network/c;->e:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "forward_num"

    .line 17
    .line 18
    iput-object v0, p0, Lcom/tencent/liteav/network/c;->f:Ljava/lang/String;

    .line 19
    .line 20
    const-string v0, "request_type"

    .line 21
    .line 22
    iput-object v0, p0, Lcom/tencent/liteav/network/c;->g:Ljava/lang/String;

    .line 23
    .line 24
    const-string v0, "sdk_version"

    .line 25
    .line 26
    iput-object v0, p0, Lcom/tencent/liteav/network/c;->h:Ljava/lang/String;

    .line 27
    .line 28
    const-string v0, "51451748-d8f2-4629-9071-db2983aa7251"

    .line 29
    .line 30
    iput-object v0, p0, Lcom/tencent/liteav/network/c;->i:Ljava/lang/String;

    .line 31
    .line 32
    const/4 v0, 0x5

    .line 33
    iput v0, p0, Lcom/tencent/liteav/network/c;->j:I

    .line 34
    .line 35
    const/4 v1, 0x2

    .line 36
    iput v1, p0, Lcom/tencent/liteav/network/c;->k:I

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    iput-object v1, p0, Lcom/tencent/liteav/network/c;->a:Lcom/tencent/liteav/network/b;

    .line 40
    .line 41
    iput v0, p0, Lcom/tencent/liteav/network/c;->b:I

    .line 42
    .line 43
    iput-object v1, p0, Lcom/tencent/liteav/network/c;->l:Ljava/lang/Thread;

    .line 44
    .line 45
    return-void
.end method

.method private a(Lorg/json/JSONObject;)Lcom/tencent/liteav/network/a;
    .locals 3

    .line 198
    const-string v0, "type"

    new-instance v1, Lcom/tencent/liteav/network/a;

    invoke-direct {v1}, Lcom/tencent/liteav/network/a;-><init>()V

    .line 199
    :try_start_0
    const-string v2, "ip"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/tencent/liteav/network/a;->a:Ljava/lang/String;

    .line 200
    const-string v2, "port"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/tencent/liteav/network/a;->b:Ljava/lang/String;

    const/4 v2, 0x0

    .line 201
    iput v2, v1, Lcom/tencent/liteav/network/a;->e:I

    .line 202
    iput-boolean v2, v1, Lcom/tencent/liteav/network/a;->c:Z

    .line 203
    iget-object v2, v1, Lcom/tencent/liteav/network/a;->a:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/tencent/liteav/network/c;->c(Ljava/lang/String;)Z

    move-result p0

    iput-boolean p0, v1, Lcom/tencent/liteav/network/a;->d:Z

    .line 204
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p0

    const/4 p1, 0x2

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    .line 205
    iput-boolean p0, v1, Lcom/tencent/liteav/network/a;->c:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-object v1

    :catch_0
    move-exception p0

    .line 206
    const-string p1, "TXCIntelligentRoute"

    const-string v0, "get ip record from json object failed."

    invoke-static {p1, v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static synthetic a(Lcom/tencent/liteav/network/c;Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 197
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/liteav/network/c;->a(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private a(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 190
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 191
    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Lcom/tencent/liteav/network/c;->b(Ljava/lang/String;ILjava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    if-nez p0, :cond_0

    return-object v1

    .line 192
    :cond_0
    new-instance p1, Ljava/io/BufferedReader;

    new-instance p2, Ljava/io/InputStreamReader;

    invoke-direct {p2, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {p1, p2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 193
    :goto_0
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 194
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 195
    const-string p1, "TXCIntelligentRoute"

    const-string p2, "get json string from url failed."

    invoke-static {p1, p2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 196
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Lcom/tencent/liteav/network/c;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 0

    .line 187
    invoke-direct {p0, p1}, Lcom/tencent/liteav/network/c;->a(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method

.method private a(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/tencent/liteav/network/a;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "51451748-d8f2-4629-9071-db2983aa7251"

    .line 2
    .line 3
    const-string v1, "Network"

    .line 4
    .line 5
    new-instance v2, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    .line 11
    .line 12
    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string p1, "state"

    .line 16
    .line 17
    invoke-virtual {v3, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/4 v4, 0x0

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    return-object v4

    .line 25
    :cond_0
    const-string p1, "content"

    .line 26
    .line 27
    invoke-virtual {v3, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v3, "list"

    .line 32
    .line 33
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    return-object v4

    .line 40
    :cond_1
    const/4 v3, 0x0

    .line 41
    move v4, v3

    .line 42
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    if-ge v4, v5, :cond_3

    .line 47
    .line 48
    invoke-virtual {p1, v4}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    check-cast v5, Lorg/json/JSONObject;

    .line 53
    .line 54
    invoke-direct {p0, v5}, Lcom/tencent/liteav/network/c;->a(Lorg/json/JSONObject;)Lcom/tencent/liteav/network/a;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    if-eqz v5, :cond_2

    .line 59
    .line 60
    iget-boolean v6, v5, Lcom/tencent/liteav/network/a;->c:Z

    .line 61
    .line 62
    if-eqz v6, :cond_2

    .line 63
    .line 64
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :catch_0
    move-exception p0

    .line 69
    goto :goto_3

    .line 70
    :cond_2
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    move v4, v3

    .line 74
    :goto_2
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    if-ge v4, v5, :cond_5

    .line 79
    .line 80
    invoke-virtual {p1, v4}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    check-cast v5, Lorg/json/JSONObject;

    .line 85
    .line 86
    invoke-direct {p0, v5}, Lcom/tencent/liteav/network/c;->a(Lorg/json/JSONObject;)Lcom/tencent/liteav/network/a;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    if-eqz v5, :cond_4

    .line 91
    .line 92
    iget-boolean v6, v5, Lcom/tencent/liteav/network/a;->c:Z

    .line 93
    .line 94
    if-nez v6, :cond_4

    .line 95
    .line 96
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    :cond_4
    add-int/lit8 v4, v4, 0x1

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_5
    invoke-static {}, Lcom/tencent/liteav/basic/d/c;->a()Lcom/tencent/liteav/basic/d/c;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    const-string v4, "EnableRouteOptimize"

    .line 107
    .line 108
    invoke-virtual {p1, v1, v4}, Lcom/tencent/liteav/basic/d/c;->a(Ljava/lang/String;Ljava/lang/String;)J

    .line 109
    .line 110
    .line 111
    move-result-wide v4

    .line 112
    const-wide/16 v6, 0x1

    .line 113
    .line 114
    cmp-long p1, v4, v6

    .line 115
    .line 116
    if-nez p1, :cond_6

    .line 117
    .line 118
    invoke-static {}, Lcom/tencent/liteav/network/i;->a()Lcom/tencent/liteav/network/i;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {p1}, Lcom/tencent/liteav/network/i;->c()Z

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    if-eqz p1, :cond_6

    .line 127
    .line 128
    const/4 p1, 0x1

    .line 129
    invoke-direct {p0, v2, p1}, Lcom/tencent/liteav/network/c;->a(Ljava/util/ArrayList;Z)Ljava/util/ArrayList;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-direct {p0, v2}, Lcom/tencent/liteav/network/c;->a(Ljava/util/ArrayList;)V

    .line 134
    .line 135
    .line 136
    return-object v2

    .line 137
    :cond_6
    invoke-static {}, Lcom/tencent/liteav/basic/d/c;->a()Lcom/tencent/liteav/basic/d/c;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    const-string v4, "RouteSamplingMaxCount"

    .line 142
    .line 143
    invoke-virtual {p1, v1, v4}, Lcom/tencent/liteav/basic/d/c;->a(Ljava/lang/String;Ljava/lang/String;)J

    .line 144
    .line 145
    .line 146
    move-result-wide v4

    .line 147
    cmp-long p1, v4, v6

    .line 148
    .line 149
    if-ltz p1, :cond_7

    .line 150
    .line 151
    invoke-static {}, Lcom/tencent/liteav/network/i;->a()Lcom/tencent/liteav/network/i;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/network/i;->a(Ljava/lang/String;)J

    .line 156
    .line 157
    .line 158
    move-result-wide v8

    .line 159
    cmp-long p1, v8, v4

    .line 160
    .line 161
    if-gtz p1, :cond_7

    .line 162
    .line 163
    invoke-direct {p0, v2, v3}, Lcom/tencent/liteav/network/c;->a(Ljava/util/ArrayList;Z)Ljava/util/ArrayList;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    invoke-static {}, Lcom/tencent/liteav/network/i;->a()Lcom/tencent/liteav/network/i;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    add-long/2addr v8, v6

    .line 172
    invoke-virtual {p1, v0, v8, v9}, Lcom/tencent/liteav/network/i;->a(Ljava/lang/String;J)V

    .line 173
    .line 174
    .line 175
    :cond_7
    invoke-direct {p0, v2}, Lcom/tencent/liteav/network/c;->a(Ljava/util/ArrayList;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    .line 177
    .line 178
    return-object v2

    .line 179
    :goto_3
    const-string p1, "TXCIntelligentRoute"

    .line 180
    .line 181
    const-string v0, "get records from json string failed."

    .line 182
    .line 183
    invoke-static {p1, v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 184
    .line 185
    .line 186
    return-object v2
.end method

.method private a(Ljava/util/ArrayList;Z)Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/tencent/liteav/network/a;",
            ">;Z)",
            "Ljava/util/ArrayList<",
            "Lcom/tencent/liteav/network/a;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_c

    .line 207
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_5

    .line 208
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 209
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 210
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    move-object v3, v0

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tencent/liteav/network/a;

    .line 211
    iget-boolean v4, v0, Lcom/tencent/liteav/network/a;->c:Z

    if-eqz v4, :cond_1

    .line 212
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 213
    :cond_1
    iget-boolean v4, v0, Lcom/tencent/liteav/network/a;->d:Z

    if-eqz v4, :cond_2

    goto :goto_0

    .line 214
    :cond_2
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 215
    :cond_3
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 216
    :cond_4
    :goto_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_7

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_5

    goto :goto_3

    .line 217
    :cond_5
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lez p2, :cond_6

    add-int/lit8 p2, p2, -0x1

    .line 218
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/tencent/liteav/network/a;

    if-eqz p2, :cond_6

    .line 219
    iget-object p2, p2, Lcom/tencent/liteav/network/a;->a:Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/tencent/liteav/network/c;->c(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_6

    if-eqz v3, :cond_6

    .line 220
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_6
    return-object p1

    :cond_7
    :goto_3
    const/4 v0, 0x0

    if-eqz p2, :cond_9

    if-eqz v3, :cond_8

    .line 221
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 222
    :cond_8
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_b

    .line 223
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 224
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_4

    .line 225
    :cond_9
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_a

    .line 226
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 227
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_a
    if-eqz v3, :cond_b

    .line 228
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 229
    :cond_b
    :goto_4
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_4

    .line 230
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 231
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_2

    :cond_c
    :goto_5
    return-object v0
.end method

.method private a(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/tencent/liteav/network/a;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 232
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-lez p0, :cond_1

    .line 233
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const-string p1, ""

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/tencent/liteav/network/a;

    .line 234
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " \n Nearest IP: "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, v0, Lcom/tencent/liteav/network/a;->a:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " Port: "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, v0, Lcom/tencent/liteav/network/a;->b:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " Q Channel: "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean p1, v0, Lcom/tencent/liteav/network/a;->c:Z

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 235
    :cond_0
    const-string p0, "TXCIntelligentRoute"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method private b(Ljava/lang/String;ILjava/lang/String;)Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string v0, "2"

    .line 2
    .line 3
    new-instance v1, Ljava/net/URL;

    .line 4
    .line 5
    invoke-direct {v1, p3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    const/4 v1, 0x0

    .line 13
    :try_start_0
    check-cast p3, Ljava/net/HttpURLConnection;

    .line 14
    .line 15
    const-string v2, "GET"

    .line 16
    .line 17
    invoke-virtual {p3, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const-string v2, "forward_stream"

    .line 21
    .line 22
    invoke-virtual {p3, v2, p1}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const-string p1, "forward_num"

    .line 26
    .line 27
    invoke-virtual {p3, p1, v0}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const-string p1, "sdk_version"

    .line 31
    .line 32
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getSDKVersionStr()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {p3, p1, v2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    const/4 p1, 0x1

    .line 40
    const-string v2, "request_type"

    .line 41
    .line 42
    if-ne p2, p1, :cond_0

    .line 43
    .line 44
    :try_start_1
    const-string p1, "1"

    .line 45
    .line 46
    invoke-virtual {p3, v2, p1}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catch_0
    move-exception p0

    .line 51
    goto :goto_1

    .line 52
    :cond_0
    const/4 p1, 0x2

    .line 53
    if-ne p2, p1, :cond_1

    .line 54
    .line 55
    invoke-virtual {p3, v2, v0}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    const-string p1, "3"

    .line 60
    .line 61
    invoke-virtual {p3, v2, p1}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :goto_0
    iget p1, p0, Lcom/tencent/liteav/network/c;->b:I

    .line 65
    .line 66
    if-lez p1, :cond_2

    .line 67
    .line 68
    mul-int/lit16 p1, p1, 0x3e8

    .line 69
    .line 70
    invoke-virtual {p3, p1}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 71
    .line 72
    .line 73
    iget p0, p0, Lcom/tencent/liteav/network/c;->b:I

    .line 74
    .line 75
    mul-int/lit16 p0, p0, 0x3e8

    .line 76
    .line 77
    invoke-virtual {p3, p0}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 78
    .line 79
    .line 80
    :cond_2
    invoke-virtual {p3}, Ljava/net/URLConnection;->connect()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    const/16 p1, 0xc8

    .line 88
    .line 89
    if-ne p0, p1, :cond_3

    .line 90
    .line 91
    invoke-virtual {p3}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 92
    .line 93
    .line 94
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 95
    return-object p0

    .line 96
    :cond_3
    return-object v1

    .line 97
    :goto_1
    const-string p1, "TXCIntelligentRoute"

    .line 98
    .line 99
    const-string p2, "http failed."

    .line 100
    .line 101
    invoke-static {p1, p2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 102
    .line 103
    .line 104
    return-object v1
.end method

.method private b(Ljava/lang/String;)Z
    .locals 0

    .line 105
    const-string p0, ":"

    invoke-virtual {p1, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 106
    array-length p0, p0

    const/4 p1, 0x1

    if-le p0, p1, :cond_0

    return p1

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private c(Ljava/lang/String;)Z
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/network/c;->b(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    if-eqz p1, :cond_2

    .line 10
    .line 11
    const-string v0, "[.]"

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    array-length v0, p1

    .line 18
    move v2, v1

    .line 19
    :goto_0
    if-ge v2, v0, :cond_2

    .line 20
    .line 21
    aget-object v3, p1, v2

    .line 22
    .line 23
    invoke-direct {p0, v3}, Lcom/tencent/liteav/network/c;->d(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-nez v3, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    return v1
.end method

.method private d(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "[0-9]*"

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method


# virtual methods
.method public a(Ljava/lang/String;I)V
    .locals 2

    .line 188
    new-instance v0, Lcom/tencent/liteav/network/c$1;

    const-string v1, "TXCPushRoute"

    invoke-direct {v0, p0, v1, p1, p2}, Lcom/tencent/liteav/network/c$1;-><init>(Lcom/tencent/liteav/network/c;Ljava/lang/String;Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/tencent/liteav/network/c;->l:Ljava/lang/Thread;

    .line 189
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method
