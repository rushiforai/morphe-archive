.class public abstract Ltech/sud/a/a/Sudif;
.super Ll/trg0;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;
.implements Ll/hog0;


# instance fields
.field public final a:Ljava/lang/String;

.field protected b:Ltech/sud/runtime/component/websocket/a;

.field private c:Ll/swg0;

.field private d:Ljava/net/Socket;

.field private e:Ljava/io/OutputStream;

.field private f:Ljava/net/Proxy;

.field private g:Ljava/lang/Thread;

.field private h:Ljava/lang/Thread;

.field private i:Ll/okg0;

.field private j:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private k:Ljava/util/concurrent/CountDownLatch;

.field private l:Ljava/util/concurrent/CountDownLatch;

.field private m:I


# direct methods
.method public constructor <init>(Ltech/sud/runtime/component/websocket/a;)V
    .locals 5

    .line 1
    new-instance v0, Ll/wrg0;

    .line 2
    .line 3
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 4
    .line 5
    new-instance v2, Ll/dkg0;

    .line 6
    .line 7
    invoke-direct {v2}, Ll/dkg0;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-direct {v0, v1, v2}, Ll/wrg0;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Ll/trg0;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v1, "SudNative WebSocketClient"

    .line 21
    .line 22
    iput-object v1, p0, Ltech/sud/a/a/Sudif;->a:Ljava/lang/String;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    iput-object v2, p0, Ltech/sud/a/a/Sudif;->b:Ltech/sud/runtime/component/websocket/a;

    .line 26
    .line 27
    iput-object v2, p0, Ltech/sud/a/a/Sudif;->c:Ll/swg0;

    .line 28
    .line 29
    iput-object v2, p0, Ltech/sud/a/a/Sudif;->d:Ljava/net/Socket;

    .line 30
    .line 31
    sget-object v3, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    .line 32
    .line 33
    iput-object v3, p0, Ltech/sud/a/a/Sudif;->f:Ljava/net/Proxy;

    .line 34
    .line 35
    new-instance v3, Ljava/util/concurrent/CountDownLatch;

    .line 36
    .line 37
    const/4 v4, 0x1

    .line 38
    invoke-direct {v3, v4}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 39
    .line 40
    .line 41
    iput-object v3, p0, Ltech/sud/a/a/Sudif;->k:Ljava/util/concurrent/CountDownLatch;

    .line 42
    .line 43
    new-instance v3, Ljava/util/concurrent/CountDownLatch;

    .line 44
    .line 45
    invoke-direct {v3, v4}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 46
    .line 47
    .line 48
    iput-object v3, p0, Ltech/sud/a/a/Sudif;->l:Ljava/util/concurrent/CountDownLatch;

    .line 49
    .line 50
    iput-object p1, p0, Ltech/sud/a/a/Sudif;->b:Ltech/sud/runtime/component/websocket/a;

    .line 51
    .line 52
    iput-object v0, p0, Ltech/sud/a/a/Sudif;->i:Ll/okg0;

    .line 53
    .line 54
    iput-object v2, p0, Ltech/sud/a/a/Sudif;->j:Ljava/util/Map;

    .line 55
    .line 56
    const/16 p1, 0x3a98

    .line 57
    .line 58
    iput p1, p0, Ltech/sud/a/a/Sudif;->m:I

    .line 59
    .line 60
    const/4 p1, 0x0

    .line 61
    invoke-virtual {p0, p1}, Ll/trg0;->a(Z)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ll/trg0;->b(Z)V

    .line 65
    .line 66
    .line 67
    new-instance p1, Ll/swg0;

    .line 68
    .line 69
    invoke-direct {p1, p0, v0}, Ll/swg0;-><init>(Ll/kug0;Ll/wrg0;)V

    .line 70
    .line 71
    .line 72
    iput-object p1, p0, Ltech/sud/a/a/Sudif;->c:Ll/swg0;

    .line 73
    .line 74
    const-string p0, "created WebSocketClient"

    .line 75
    .line 76
    invoke-static {v1, p0}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public static synthetic a(Ltech/sud/a/a/Sudif;Ljava/lang/Thread;)Ljava/lang/Thread;
    .locals 0

    .line 72
    iput-object p1, p0, Ltech/sud/a/a/Sudif;->g:Ljava/lang/Thread;

    return-object p1
.end method

.method public static synthetic a(Ltech/sud/a/a/Sudif;)Ll/swg0;
    .locals 0

    .line 71
    iget-object p0, p0, Ltech/sud/a/a/Sudif;->c:Ll/swg0;

    return-object p0
.end method

.method public static a(Ltech/sud/a/a/Sudif;Ljava/io/IOException;)V
    .locals 2

    .line 99
    instance-of v0, p1, Ljavax/net/ssl/SSLException;

    if-eqz v0, :cond_0

    .line 100
    invoke-virtual {p0, p1}, Ltech/sud/a/a/Sudif;->a(Ljava/lang/Exception;)V

    .line 101
    :cond_0
    iget-object p0, p0, Ltech/sud/a/a/Sudif;->c:Ll/swg0;

    .line 102
    iget p1, p0, Ll/swg0;->d:I

    const-string v0, ""

    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    const/4 p1, -0x1

    .line 103
    invoke-virtual {p0, p1, v0, v1}, Ll/swg0;->e(ILjava/lang/String;Z)V

    return-void

    .line 104
    :cond_1
    iget-boolean p1, p0, Ll/swg0;->c:Z

    if-eqz p1, :cond_2

    .line 105
    iget-object p1, p0, Ll/swg0;->j:Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Ll/swg0;->i:Ljava/lang/String;

    iget-object v1, p0, Ll/swg0;->k:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Ll/swg0;->e(ILjava/lang/String;Z)V

    return-void

    .line 106
    :cond_2
    iget-object p1, p0, Ll/swg0;->e:Ll/wrg0;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 107
    iget-object p1, p0, Ll/swg0;->e:Ll/wrg0;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 p1, 0x3ee

    .line 108
    invoke-virtual {p0, p1, v0, v1}, Ll/swg0;->e(ILjava/lang/String;Z)V

    return-void
.end method

.method public static synthetic b(Ltech/sud/a/a/Sudif;)Ljava/io/OutputStream;
    .locals 0

    .line 87
    iget-object p0, p0, Ltech/sud/a/a/Sudif;->e:Ljava/io/OutputStream;

    return-object p0
.end method

.method public static c(Ltech/sud/a/a/Sudif;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    :try_start_0
    iget-object v0, p0, Ltech/sud/a/a/Sudif;->d:Ljava/net/Socket;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception v0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void

    .line 15
    :goto_0
    invoke-virtual {p0, p0, v0}, Ltech/sud/a/a/Sudif;->a(Ll/hog0;Ljava/lang/Exception;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final Suddo()I
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/a/a/Sudif;->b:Ltech/sud/runtime/component/websocket/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ltech/sud/runtime/component/websocket/a;->e()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    if-ne v0, v1, :cond_2

    .line 9
    .line 10
    iget-object p0, p0, Ltech/sud/a/a/Sudif;->b:Ltech/sud/runtime/component/websocket/a;

    .line 11
    .line 12
    invoke-virtual {p0}, Ltech/sud/runtime/component/websocket/a;->a()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "wss"

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    const/16 p0, 0x1bb

    .line 25
    .line 26
    return p0

    .line 27
    :cond_0
    const-string v0, "ws"

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    const/16 p0, 0x50

    .line 36
    .line 37
    return p0

    .line 38
    :cond_1
    const-string v0, "unknown scheme: "

    .line 39
    .line 40
    invoke-static {v0, p0}, Ll/ypg0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    return p0

    .line 45
    :cond_2
    return v0
.end method

.method public final Sudif()V
    .locals 8

    .line 1
    iget-object v0, p0, Ltech/sud/a/a/Sudif;->b:Ltech/sud/runtime/component/websocket/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ltech/sud/runtime/component/websocket/a;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ltech/sud/a/a/Sudif;->b:Ltech/sud/runtime/component/websocket/a;

    .line 8
    .line 9
    invoke-virtual {v1}, Ltech/sud/runtime/component/websocket/a;->d()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-nez v2, :cond_1

    .line 20
    .line 21
    :cond_0
    const-string v0, "/"

    .line 22
    .line 23
    :cond_1
    if-eqz v1, :cond_2

    .line 24
    .line 25
    new-instance v2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const/16 v0, 0x3f

    .line 34
    .line 35
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    :cond_2
    invoke-virtual {p0}, Ltech/sud/a/a/Sudif;->Suddo()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    new-instance v2, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    iget-object v3, p0, Ltech/sud/a/a/Sudif;->b:Ltech/sud/runtime/component/websocket/a;

    .line 55
    .line 56
    invoke-virtual {v3}, Ltech/sud/runtime/component/websocket/a;->b()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const/16 v3, 0x50

    .line 64
    .line 65
    if-eq v1, v3, :cond_3

    .line 66
    .line 67
    const/16 v3, 0x1bb

    .line 68
    .line 69
    if-eq v1, v3, :cond_3

    .line 70
    .line 71
    const-string v3, ":"

    .line 72
    .line 73
    invoke-static {v1, v3}, Ll/dmg0;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    goto :goto_0

    .line 78
    :cond_3
    const-string v1, ""

    .line 79
    .line 80
    :goto_0
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    new-instance v2, Ll/irg0;

    .line 88
    .line 89
    invoke-direct {v2}, Ll/irg0;-><init>()V

    .line 90
    .line 91
    .line 92
    iput-object v0, v2, Ll/irg0;->b:Ljava/lang/String;

    .line 93
    .line 94
    iget-object v0, v2, Ll/mwg0;->a:Ljava/util/TreeMap;

    .line 95
    .line 96
    const-string v3, "Host"

    .line 97
    .line 98
    invoke-virtual {v0, v3, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ltech/sud/a/a/Sudif;->j:Ljava/util/Map;

    .line 102
    .line 103
    if-eqz v0, :cond_4

    .line 104
    .line 105
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-eqz v1, :cond_4

    .line 118
    .line 119
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    check-cast v1, Ljava/util/Map$Entry;

    .line 124
    .line 125
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    check-cast v3, Ljava/lang/String;

    .line 130
    .line 131
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    check-cast v1, Ljava/lang/String;

    .line 136
    .line 137
    iget-object v4, v2, Ll/mwg0;->a:Ljava/util/TreeMap;

    .line 138
    .line 139
    invoke-virtual {v4, v3, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_4
    iget-object p0, p0, Ltech/sud/a/a/Sudif;->c:Ll/swg0;

    .line 144
    .line 145
    iget-object v0, p0, Ll/swg0;->e:Ll/wrg0;

    .line 146
    .line 147
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 148
    .line 149
    .line 150
    iget-object v1, v2, Ll/mwg0;->a:Ljava/util/TreeMap;

    .line 151
    .line 152
    const-string v3, "websocket"

    .line 153
    .line 154
    const-string v4, "Upgrade"

    .line 155
    .line 156
    invoke-virtual {v1, v4, v3}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    iget-object v1, v2, Ll/mwg0;->a:Ljava/util/TreeMap;

    .line 160
    .line 161
    const-string v3, "Connection"

    .line 162
    .line 163
    invoke-virtual {v1, v3, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    const/16 v1, 0x10

    .line 167
    .line 168
    new-array v1, v1, [B

    .line 169
    .line 170
    iget-object v3, v0, Ll/wrg0;->i:Ljava/util/Random;

    .line 171
    .line 172
    invoke-virtual {v3, v1}, Ljava/util/Random;->nextBytes([B)V

    .line 173
    .line 174
    .line 175
    invoke-static {v1}, Ll/ikg0;->a([B)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    iget-object v3, v2, Ll/mwg0;->a:Ljava/util/TreeMap;

    .line 180
    .line 181
    const-string v4, "Sec-WebSocket-Key"

    .line 182
    .line 183
    invoke-virtual {v3, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    iget-object v1, v2, Ll/mwg0;->a:Ljava/util/TreeMap;

    .line 187
    .line 188
    const-string v3, "Sec-WebSocket-Version"

    .line 189
    .line 190
    const-string v4, "13"

    .line 191
    .line 192
    invoke-virtual {v1, v3, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    new-instance v1, Ljava/lang/StringBuilder;

    .line 196
    .line 197
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 198
    .line 199
    .line 200
    iget-object v3, v0, Ll/wrg0;->c:Ljava/util/ArrayList;

    .line 201
    .line 202
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 203
    .line 204
    .line 205
    move-result v4

    .line 206
    const/4 v5, 0x0

    .line 207
    move v6, v5

    .line 208
    :goto_2
    if-ge v6, v4, :cond_5

    .line 209
    .line 210
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    move-result-object v7

    .line 214
    add-int/lit8 v6, v6, 0x1

    .line 215
    .line 216
    check-cast v7, Ll/ykg0;

    .line 217
    .line 218
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 219
    .line 220
    .line 221
    goto :goto_2

    .line 222
    :cond_5
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 223
    .line 224
    .line 225
    move-result v3

    .line 226
    if-eqz v3, :cond_6

    .line 227
    .line 228
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    iget-object v3, v2, Ll/mwg0;->a:Ljava/util/TreeMap;

    .line 233
    .line 234
    const-string v4, "Sec-WebSocket-Extensions"

    .line 235
    .line 236
    invoke-virtual {v3, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    :cond_6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 240
    .line 241
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 242
    .line 243
    .line 244
    iget-object v0, v0, Ll/wrg0;->e:Ljava/util/ArrayList;

    .line 245
    .line 246
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 247
    .line 248
    .line 249
    move-result v3

    .line 250
    :goto_3
    if-ge v5, v3, :cond_7

    .line 251
    .line 252
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v4

    .line 256
    add-int/lit8 v5, v5, 0x1

    .line 257
    .line 258
    check-cast v4, Ll/dkg0;

    .line 259
    .line 260
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 261
    .line 262
    .line 263
    goto :goto_3

    .line 264
    :cond_7
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 265
    .line 266
    .line 267
    move-result v0

    .line 268
    if-eqz v0, :cond_8

    .line 269
    .line 270
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    iget-object v1, v2, Ll/mwg0;->a:Ljava/util/TreeMap;

    .line 275
    .line 276
    const-string v3, "Sec-WebSocket-Protocol"

    .line 277
    .line 278
    invoke-virtual {v1, v3, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 279
    .line 280
    .line 281
    :cond_8
    iput-object v2, p0, Ll/swg0;->h:Ll/irg0;

    .line 282
    .line 283
    iget-object v0, v2, Ll/irg0;->b:Ljava/lang/String;

    .line 284
    .line 285
    sget-boolean v1, Ll/swg0;->o:Z

    .line 286
    .line 287
    if-nez v1, :cond_a

    .line 288
    .line 289
    if-eqz v0, :cond_9

    .line 290
    .line 291
    goto :goto_4

    .line 292
    :cond_9
    invoke-static {}, Ll/aqg0;->a()V

    .line 293
    .line 294
    .line 295
    return-void

    .line 296
    :cond_a
    :goto_4
    :try_start_0
    iget-object v0, p0, Ll/swg0;->b:Ll/kug0;

    .line 297
    .line 298
    invoke-virtual {v0, p0, v2}, Ll/kug0;->a(Ll/hog0;Ll/xjg0;)V
    :try_end_0
    .catch LSudthrow/Sudfor; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 299
    .line 300
    .line 301
    iget-object v0, p0, Ll/swg0;->e:Ll/wrg0;

    .line 302
    .line 303
    iget-object v1, p0, Ll/swg0;->h:Ll/irg0;

    .line 304
    .line 305
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 306
    .line 307
    .line 308
    new-instance v0, Ljava/lang/StringBuilder;

    .line 309
    .line 310
    const/16 v2, 0x64

    .line 311
    .line 312
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 313
    .line 314
    .line 315
    if-eqz v1, :cond_b

    .line 316
    .line 317
    const-string v2, "GET "

    .line 318
    .line 319
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    iget-object v2, v1, Ll/irg0;->b:Ljava/lang/String;

    .line 323
    .line 324
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    const-string v2, " HTTP/1.1"

    .line 328
    .line 329
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    goto :goto_5

    .line 333
    :cond_b
    instance-of v2, v1, Ll/gzg0;

    .line 334
    .line 335
    if-eqz v2, :cond_d

    .line 336
    .line 337
    const-string v2, "HTTP/1.1 101 "

    .line 338
    .line 339
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    move-object v2, v1

    .line 343
    check-cast v2, Ll/gzg0;

    .line 344
    .line 345
    check-cast v2, Ll/zng0;

    .line 346
    .line 347
    iget-object v2, v2, Ll/zng0;->b:Ljava/lang/String;

    .line 348
    .line 349
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    :goto_5
    const-string v2, "\r\n"

    .line 353
    .line 354
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    .line 356
    .line 357
    iget-object v3, v1, Ll/mwg0;->a:Ljava/util/TreeMap;

    .line 358
    .line 359
    invoke-virtual {v3}, Ljava/util/TreeMap;->keySet()Ljava/util/Set;

    .line 360
    .line 361
    .line 362
    move-result-object v3

    .line 363
    invoke-static {v3}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 364
    .line 365
    .line 366
    move-result-object v3

    .line 367
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 368
    .line 369
    .line 370
    move-result-object v3

    .line 371
    :goto_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 372
    .line 373
    .line 374
    move-result v4

    .line 375
    if-eqz v4, :cond_c

    .line 376
    .line 377
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 378
    .line 379
    .line 380
    move-result-object v4

    .line 381
    check-cast v4, Ljava/lang/String;

    .line 382
    .line 383
    invoke-virtual {v1, v4}, Ll/mwg0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 384
    .line 385
    .line 386
    move-result-object v5

    .line 387
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 388
    .line 389
    .line 390
    const-string v4, ": "

    .line 391
    .line 392
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 393
    .line 394
    .line 395
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 396
    .line 397
    .line 398
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 399
    .line 400
    .line 401
    goto :goto_6

    .line 402
    :cond_c
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 403
    .line 404
    .line 405
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object v0

    .line 409
    sget-object v1, Ll/rrg0;->a:Ljava/nio/charset/CodingErrorAction;

    .line 410
    .line 411
    :try_start_1
    const-string v1, "ASCII"

    .line 412
    .line 413
    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 414
    .line 415
    .line 416
    move-result-object v0
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    .line 417
    array-length v1, v0

    .line 418
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 419
    .line 420
    .line 421
    move-result-object v1

    .line 422
    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 423
    .line 424
    .line 425
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 426
    .line 427
    .line 428
    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 429
    .line 430
    .line 431
    move-result-object v0

    .line 432
    invoke-virtual {p0, v0}, Ll/swg0;->g(Ljava/util/List;)V

    .line 433
    .line 434
    .line 435
    return-void

    .line 436
    :catch_0
    move-exception p0

    .line 437
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 438
    .line 439
    .line 440
    return-void

    .line 441
    :cond_d
    const-string p0, "unknown role"

    .line 442
    .line 443
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 444
    .line 445
    .line 446
    return-void

    .line 447
    :catch_1
    move-exception v0

    .line 448
    iget-object v1, p0, Ll/swg0;->b:Ll/kug0;

    .line 449
    .line 450
    invoke-virtual {v1, p0, v0}, Ll/kug0;->a(Ll/hog0;Ljava/lang/Exception;)V

    .line 451
    .line 452
    .line 453
    new-instance p0, LSudthrow/Sudnew;

    .line 454
    .line 455
    new-instance v1, Ljava/lang/StringBuilder;

    .line 456
    .line 457
    const-string v2, "rejected because of"

    .line 458
    .line 459
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 460
    .line 461
    .line 462
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 463
    .line 464
    .line 465
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 466
    .line 467
    .line 468
    move-result-object v0

    .line 469
    invoke-direct {p0, v0}, LSudthrow/Sudnew;-><init>(Ljava/lang/String;)V

    .line 470
    .line 471
    .line 472
    throw p0

    .line 473
    :catch_2
    new-instance p0, LSudthrow/Sudnew;

    .line 474
    .line 475
    const-string v0, "Handshake data rejected by client."

    .line 476
    .line 477
    invoke-direct {p0, v0}, LSudthrow/Sudnew;-><init>(Ljava/lang/String;)V

    .line 478
    .line 479
    .line 480
    throw p0
.end method

.method public a(ILjava/lang/String;)V
    .locals 0

    .line 73
    return-void
.end method

.method public a(ILjava/lang/String;Z)V
    .locals 0

    .line 70
    return-void
.end method

.method public abstract a(Ljava/lang/Exception;)V
.end method

.method public a(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object p0, p0, Ltech/sud/a/a/Sudif;->c:Ll/swg0;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/swg0;->e:Ll/wrg0;

    .line 6
    .line 7
    iget v1, p0, Ll/swg0;->f:I

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-ne v1, v2, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v2, 0x0

    .line 14
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    new-instance v0, Ll/ovg0;

    .line 18
    .line 19
    invoke-direct {v0}, Ll/ovg0;-><init>()V

    .line 20
    .line 21
    .line 22
    sget-object v1, Ll/rrg0;->a:Ljava/nio/charset/CodingErrorAction;

    .line 23
    .line 24
    :try_start_0
    const-string v1, "UTF8"

    .line 25
    .line 26
    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 27
    .line 28
    .line 29
    move-result-object p1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    .line 30
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, v0, Ll/phg0;->c:Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    iput-boolean v2, v0, Ll/phg0;->d:Z

    .line 37
    .line 38
    :try_start_1
    invoke-virtual {v0}, Ll/ovg0;->a()V
    :try_end_1
    .catch LSudthrow/Sudfor; {:try_start_1 .. :try_end_1} :catch_0

    .line 39
    .line 40
    .line 41
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0, p1}, Ll/swg0;->c(Ljava/util/List;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :catch_0
    move-exception p0

    .line 50
    new-instance p1, LSudthrow/Sudbyte;

    .line 51
    .line 52
    invoke-direct {p1, p0}, LSudthrow/Sudbyte;-><init>(LSudthrow/Sudfor;)V

    .line 53
    .line 54
    .line 55
    throw p1

    .line 56
    :catch_1
    move-exception p0

    .line 57
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 62
    .line 63
    .line 64
    const-string p0, "Cannot send \'null\' data to a WebSocketImpl."

    .line 65
    .line 66
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public abstract a(Ljava/nio/ByteBuffer;)V
.end method

.method public abstract a(Ll/gzg0;)V
.end method

.method public final a(Ll/hog0;)V
    .locals 0

    .line 95
    return-void
.end method

.method public a(Ll/hog0;ILjava/lang/String;)V
    .locals 0

    .line 96
    invoke-virtual {p0, p2, p3}, Ltech/sud/a/a/Sudif;->a(ILjava/lang/String;)V

    return-void
.end method

.method public final a(Ll/hog0;ILjava/lang/String;Z)V
    .locals 0

    .line 88
    invoke-virtual {p0}, Ll/trg0;->a()V

    .line 89
    iget-object p1, p0, Ltech/sud/a/a/Sudif;->g:Ljava/lang/Thread;

    if-eqz p1, :cond_0

    .line 90
    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    .line 91
    :cond_0
    invoke-virtual {p0, p2, p3, p4}, Ltech/sud/a/a/Sudif;->b(ILjava/lang/String;Z)V

    .line 92
    iget-object p1, p0, Ltech/sud/a/a/Sudif;->k:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 93
    iget-object p0, p0, Ltech/sud/a/a/Sudif;->l:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method

.method public final a(Ll/hog0;Ljava/lang/Exception;)V
    .locals 0

    .line 94
    invoke-virtual {p0, p2}, Ltech/sud/a/a/Sudif;->a(Ljava/lang/Exception;)V

    return-void
.end method

.method public final a(Ll/hog0;Ljava/lang/String;)V
    .locals 0

    .line 83
    invoke-virtual {p0, p2}, Ltech/sud/a/a/Sudif;->c(Ljava/lang/String;)V

    return-void
.end method

.method public final a(Ll/hog0;Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 84
    invoke-virtual {p0, p2}, Ltech/sud/a/a/Sudif;->a(Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public final a(Ll/hog0;Ll/cug0;)V
    .locals 0

    .line 85
    invoke-virtual {p0}, Ll/trg0;->b()V

    .line 86
    check-cast p2, Ll/gzg0;

    invoke-virtual {p0, p2}, Ltech/sud/a/a/Sudif;->a(Ll/gzg0;)V

    .line 87
    iget-object p0, p0, Ltech/sud/a/a/Sudif;->k:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method

.method public a(Ll/ueg0;)V
    .locals 0

    .line 97
    iget-object p0, p0, Ltech/sud/a/a/Sudif;->c:Ll/swg0;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 98
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/swg0;->c(Ljava/util/List;)V

    return-void
.end method

.method public a([B)V
    .locals 3

    .line 74
    iget-object p0, p0, Ltech/sud/a/a/Sudif;->c:Ll/swg0;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 75
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 76
    iget-object v0, p0, Ll/swg0;->e:Ll/wrg0;

    iget v1, p0, Ll/swg0;->f:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 77
    new-instance v0, Ll/mjg0;

    invoke-direct {v0}, Ll/mjg0;-><init>()V

    .line 78
    iput-object p1, v0, Ll/phg0;->c:Ljava/nio/ByteBuffer;

    .line 79
    iput-boolean v2, v0, Ll/phg0;->d:Z

    .line 80
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    .line 81
    invoke-virtual {p0, p1}, Ll/swg0;->c(Ljava/util/List;)V

    return-void

    .line 82
    :cond_1
    const-string p0, "Cannot send \'null\' data to a WebSocketImpl."

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-void
.end method

.method public b(Ljava/lang/String;)Ljava/net/InetAddress;
    .locals 7

    .line 1
    invoke-static {p1}, Ljava/net/InetAddress;->getAllByName(Ljava/lang/String;)[Ljava/net/InetAddress;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "null"

    .line 6
    .line 7
    const-string v0, "SudNative WebSocketClient"

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz p0, :cond_4

    .line 11
    .line 12
    array-length v2, p0

    .line 13
    if-lez v2, :cond_4

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    move v3, v2

    .line 17
    :goto_0
    array-length v4, p0

    .line 18
    if-ge v3, v4, :cond_3

    .line 19
    .line 20
    aget-object v4, p0, v3

    .line 21
    .line 22
    if-nez v3, :cond_1

    .line 23
    .line 24
    new-instance v5, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v6, "getInetAddressPriorityIpv4 \u539f\u672c\u5e94\u8be5\u8fde\u63a5\u7684\u7b2c\u4e00\u4f4dInetAddress:"

    .line 27
    .line 28
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    if-nez v4, :cond_0

    .line 32
    .line 33
    move-object v6, p1

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    invoke-virtual {v4}, Ljava/net/InetAddress;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    :goto_1
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    invoke-static {v0, v5}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    instance-of v5, v4, Ljava/net/Inet4Address;

    .line 50
    .line 51
    if-eqz v5, :cond_2

    .line 52
    .line 53
    move-object v1, v4

    .line 54
    goto :goto_2

    .line 55
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_3
    :goto_2
    if-nez v1, :cond_4

    .line 59
    .line 60
    aget-object v1, p0, v2

    .line 61
    .line 62
    :cond_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string v2, "getInetAddressPriorityIpv4 \u8c03\u6574\u540e\u8fde\u63a5\u7684InetAddress:"

    .line 65
    .line 66
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    if-nez v1, :cond_5

    .line 70
    .line 71
    goto :goto_3

    .line 72
    :cond_5
    invoke-virtual {v1}, Ljava/net/InetAddress;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    :goto_3
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-static {v0, p0}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-object v1
.end method

.method public abstract b(ILjava/lang/String;Z)V
.end method

.method public b(Ll/hog0;ILjava/lang/String;Z)V
    .locals 0

    .line 88
    invoke-virtual {p0, p2, p3, p4}, Ltech/sud/a/a/Sudif;->a(ILjava/lang/String;Z)V

    return-void
.end method

.method public c()Ljava/util/Collection;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ll/hog0;",
            ">;"
        }
    .end annotation

    .line 19
    iget-object p0, p0, Ltech/sud/a/a/Sudif;->c:Ll/swg0;

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public abstract c(Ljava/lang/String;)V
.end method

.method public f()V
    .locals 4

    .line 1
    iget-object v0, p0, Ltech/sud/a/a/Sudif;->h:Ljava/lang/Thread;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/Thread;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ltech/sud/a/a/Sudif;->h:Ljava/lang/Thread;

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "WebSocketConnectReadThread-"

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v2, p0, Ltech/sud/a/a/Sudif;->h:Ljava/lang/Thread;

    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/Thread;->getId()J

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ltech/sud/a/a/Sudif;->h:Ljava/lang/Thread;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    const-string p0, "WebSocketClient objects are not reuseable"

    .line 42
    .line 43
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public g()V
    .locals 3

    .line 1
    iget-object v0, p0, Ltech/sud/a/a/Sudif;->g:Ljava/lang/Thread;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ltech/sud/a/a/Sudif;->c:Ll/swg0;

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/16 v2, 0x3e8

    .line 11
    .line 12
    invoke-virtual {p0, v2, v0, v1}, Ll/swg0;->a(ILjava/lang/String;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public h()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ltech/sud/a/a/Sudif;->c:Ll/swg0;

    .line 2
    .line 3
    iget p0, p0, Ll/swg0;->d:I

    .line 4
    .line 5
    const/4 v0, 0x5

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public i()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ltech/sud/a/a/Sudif;->c:Ll/swg0;

    .line 2
    .line 3
    iget p0, p0, Ll/swg0;->d:I

    .line 4
    .line 5
    const/4 v0, 0x4

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public run()V
    .locals 11

    .line 1
    const-string v0, " port:"

    .line 2
    .line 3
    const-string v1, "SudNative WebSocketClient"

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    const-string v3, "connect end host:"

    .line 8
    .line 9
    const-string v4, "connect start host:"

    .line 10
    .line 11
    const/4 v5, -0x1

    .line 12
    const/4 v6, 0x0

    .line 13
    :try_start_0
    iget-object v7, p0, Ltech/sud/a/a/Sudif;->d:Ljava/net/Socket;

    .line 14
    .line 15
    const/4 v8, 0x1

    .line 16
    if-nez v7, :cond_0

    .line 17
    .line 18
    new-instance v7, Ljava/net/Socket;

    .line 19
    .line 20
    iget-object v9, p0, Ltech/sud/a/a/Sudif;->f:Ljava/net/Proxy;

    .line 21
    .line 22
    invoke-direct {v7, v9}, Ljava/net/Socket;-><init>(Ljava/net/Proxy;)V

    .line 23
    .line 24
    .line 25
    iput-object v7, p0, Ltech/sud/a/a/Sudif;->d:Ljava/net/Socket;

    .line 26
    .line 27
    move v7, v8

    .line 28
    goto :goto_0

    .line 29
    :catch_0
    move-exception v0

    .line 30
    goto/16 :goto_6

    .line 31
    .line 32
    :cond_0
    invoke-virtual {v7}, Ljava/net/Socket;->isClosed()Z

    .line 33
    .line 34
    .line 35
    move-result v7

    .line 36
    if-nez v7, :cond_a

    .line 37
    .line 38
    move v7, v6

    .line 39
    :goto_0
    iget-object v9, p0, Ltech/sud/a/a/Sudif;->d:Ljava/net/Socket;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/trg0;->d()Z

    .line 42
    .line 43
    .line 44
    move-result v10

    .line 45
    invoke-virtual {v9, v10}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 46
    .line 47
    .line 48
    iget-object v9, p0, Ltech/sud/a/a/Sudif;->d:Ljava/net/Socket;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/trg0;->e()Z

    .line 51
    .line 52
    .line 53
    move-result v10

    .line 54
    invoke-virtual {v9, v10}, Ljava/net/Socket;->setReuseAddress(Z)V

    .line 55
    .line 56
    .line 57
    iget-object v9, p0, Ltech/sud/a/a/Sudif;->d:Ljava/net/Socket;

    .line 58
    .line 59
    invoke-virtual {v9}, Ljava/net/Socket;->isBound()Z

    .line 60
    .line 61
    .line 62
    move-result v9

    .line 63
    if-nez v9, :cond_2

    .line 64
    .line 65
    new-instance v9, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {v9, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object v4, p0, Ltech/sud/a/a/Sudif;->b:Ltech/sud/runtime/component/websocket/a;

    .line 71
    .line 72
    invoke-virtual {v4}, Ltech/sud/runtime/component/websocket/a;->b()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ltech/sud/a/a/Sudif;->Suddo()I

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    invoke-static {v1, v4}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iget-object v4, p0, Ltech/sud/a/a/Sudif;->b:Ltech/sud/runtime/component/websocket/a;

    .line 97
    .line 98
    invoke-virtual {v4}, Ltech/sud/runtime/component/websocket/a;->b()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    invoke-virtual {p0, v4}, Ltech/sud/a/a/Sudif;->b(Ljava/lang/String;)Ljava/net/InetAddress;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    if-nez v4, :cond_1

    .line 107
    .line 108
    new-instance v4, Ljava/net/InetSocketAddress;

    .line 109
    .line 110
    iget-object v9, p0, Ltech/sud/a/a/Sudif;->b:Ltech/sud/runtime/component/websocket/a;

    .line 111
    .line 112
    invoke-virtual {v9}, Ltech/sud/runtime/component/websocket/a;->b()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v9

    .line 116
    invoke-virtual {p0}, Ltech/sud/a/a/Sudif;->Suddo()I

    .line 117
    .line 118
    .line 119
    move-result v10

    .line 120
    invoke-direct {v4, v9, v10}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    .line 121
    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_1
    new-instance v9, Ljava/net/InetSocketAddress;

    .line 125
    .line 126
    invoke-virtual {p0}, Ltech/sud/a/a/Sudif;->Suddo()I

    .line 127
    .line 128
    .line 129
    move-result v10

    .line 130
    invoke-direct {v9, v4, v10}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 131
    .line 132
    .line 133
    move-object v4, v9

    .line 134
    :goto_1
    iget-object v9, p0, Ltech/sud/a/a/Sudif;->d:Ljava/net/Socket;

    .line 135
    .line 136
    iget v10, p0, Ltech/sud/a/a/Sudif;->m:I

    .line 137
    .line 138
    invoke-virtual {v9, v4, v10}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 139
    .line 140
    .line 141
    new-instance v4, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    iget-object v3, p0, Ltech/sud/a/a/Sudif;->b:Ltech/sud/runtime/component/websocket/a;

    .line 147
    .line 148
    invoke-virtual {v3}, Ltech/sud/runtime/component/websocket/a;->b()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v3

    .line 152
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0}, Ltech/sud/a/a/Sudif;->Suddo()I

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-static {v1, v0}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    :cond_2
    const/4 v0, 0x0

    .line 173
    if-eqz v7, :cond_3

    .line 174
    .line 175
    const-string v1, "wss"

    .line 176
    .line 177
    iget-object v3, p0, Ltech/sud/a/a/Sudif;->b:Ltech/sud/runtime/component/websocket/a;

    .line 178
    .line 179
    invoke-virtual {v3}, Ltech/sud/runtime/component/websocket/a;->a()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v3

    .line 183
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    if-eqz v1, :cond_3

    .line 188
    .line 189
    const-string v1, "TLS"

    .line 190
    .line 191
    invoke-static {v1}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    invoke-virtual {v1, v0, v0, v0}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v1}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    iget-object v3, p0, Ltech/sud/a/a/Sudif;->d:Ljava/net/Socket;

    .line 203
    .line 204
    iget-object v4, p0, Ltech/sud/a/a/Sudif;->b:Ltech/sud/runtime/component/websocket/a;

    .line 205
    .line 206
    invoke-virtual {v4}, Ltech/sud/runtime/component/websocket/a;->b()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v4

    .line 210
    invoke-virtual {p0}, Ltech/sud/a/a/Sudif;->Suddo()I

    .line 211
    .line 212
    .line 213
    move-result v7

    .line 214
    invoke-virtual {v1, v3, v4, v7, v8}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    iput-object v1, p0, Ltech/sud/a/a/Sudif;->d:Ljava/net/Socket;

    .line 219
    .line 220
    instance-of v3, v1, Ljavax/net/ssl/SSLSocket;

    .line 221
    .line 222
    if-eqz v3, :cond_3

    .line 223
    .line 224
    check-cast v1, Ljavax/net/ssl/SSLSocket;

    .line 225
    .line 226
    invoke-virtual {v1}, Ljavax/net/ssl/SSLSocket;->getSSLParameters()Ljavax/net/ssl/SSLParameters;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    new-instance v4, Ljavax/net/ssl/SNIHostName;

    .line 231
    .line 232
    iget-object v7, p0, Ltech/sud/a/a/Sudif;->b:Ltech/sud/runtime/component/websocket/a;

    .line 233
    .line 234
    invoke-virtual {v7}, Ltech/sud/runtime/component/websocket/a;->b()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v7

    .line 238
    invoke-direct {v4, v7}, Ljavax/net/ssl/SNIHostName;-><init>(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 242
    .line 243
    .line 244
    move-result-object v4

    .line 245
    invoke-virtual {v3, v4}, Ljavax/net/ssl/SSLParameters;->setServerNames(Ljava/util/List;)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {v1, v3}, Ljavax/net/ssl/SSLSocket;->setSSLParameters(Ljavax/net/ssl/SSLParameters;)V

    .line 249
    .line 250
    .line 251
    :cond_3
    iget-object v1, p0, Ltech/sud/a/a/Sudif;->d:Ljava/net/Socket;

    .line 252
    .line 253
    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    iget-object v3, p0, Ltech/sud/a/a/Sudif;->d:Ljava/net/Socket;

    .line 258
    .line 259
    invoke-virtual {v3}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    .line 260
    .line 261
    .line 262
    move-result-object v3

    .line 263
    iput-object v3, p0, Ltech/sud/a/a/Sudif;->e:Ljava/io/OutputStream;

    .line 264
    .line 265
    invoke-virtual {p0}, Ltech/sud/a/a/Sudif;->Sudif()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 266
    .line 267
    .line 268
    new-instance v3, Ljava/lang/Thread;

    .line 269
    .line 270
    new-instance v4, Ltech/sud/a/a/Suddo;

    .line 271
    .line 272
    invoke-direct {v4, p0}, Ltech/sud/a/a/Suddo;-><init>(Ltech/sud/a/a/Sudif;)V

    .line 273
    .line 274
    .line 275
    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 276
    .line 277
    .line 278
    iput-object v3, p0, Ltech/sud/a/a/Sudif;->g:Ljava/lang/Thread;

    .line 279
    .line 280
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 281
    .line 282
    .line 283
    const/16 v3, 0x4000

    .line 284
    .line 285
    new-array v3, v3, [B

    .line 286
    .line 287
    :goto_2
    const/16 v4, 0x3ee

    .line 288
    .line 289
    :try_start_1
    invoke-virtual {p0}, Ltech/sud/a/a/Sudif;->i()Z

    .line 290
    .line 291
    .line 292
    move-result v7

    .line 293
    if-nez v7, :cond_4

    .line 294
    .line 295
    invoke-virtual {p0}, Ltech/sud/a/a/Sudif;->h()Z

    .line 296
    .line 297
    .line 298
    move-result v7

    .line 299
    if-nez v7, :cond_4

    .line 300
    .line 301
    invoke-virtual {v1, v3}, Ljava/io/InputStream;->read([B)I

    .line 302
    .line 303
    .line 304
    move-result v7

    .line 305
    if-eq v7, v5, :cond_4

    .line 306
    .line 307
    iget-object v9, p0, Ltech/sud/a/a/Sudif;->c:Ll/swg0;

    .line 308
    .line 309
    invoke-static {v3, v6, v7}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    .line 310
    .line 311
    .line 312
    move-result-object v7

    .line 313
    invoke-virtual {v9, v7}, Ll/swg0;->b(Ljava/nio/ByteBuffer;)V

    .line 314
    .line 315
    .line 316
    goto :goto_2

    .line 317
    :catch_1
    move-exception v1

    .line 318
    goto :goto_3

    .line 319
    :catch_2
    move-exception v1

    .line 320
    goto :goto_4

    .line 321
    :cond_4
    iget-object v1, p0, Ltech/sud/a/a/Sudif;->c:Ll/swg0;

    .line 322
    .line 323
    iget v3, v1, Ll/swg0;->d:I

    .line 324
    .line 325
    if-ne v3, v8, :cond_5

    .line 326
    .line 327
    invoke-virtual {v1, v5, v2, v8}, Ll/swg0;->e(ILjava/lang/String;Z)V

    .line 328
    .line 329
    .line 330
    goto :goto_5

    .line 331
    :cond_5
    iget-boolean v3, v1, Ll/swg0;->c:Z

    .line 332
    .line 333
    if-eqz v3, :cond_6

    .line 334
    .line 335
    iget-object v3, v1, Ll/swg0;->j:Ljava/lang/Integer;

    .line 336
    .line 337
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 338
    .line 339
    .line 340
    move-result v3

    .line 341
    iget-object v7, v1, Ll/swg0;->i:Ljava/lang/String;

    .line 342
    .line 343
    iget-object v9, v1, Ll/swg0;->k:Ljava/lang/Boolean;

    .line 344
    .line 345
    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    .line 346
    .line 347
    .line 348
    move-result v9

    .line 349
    invoke-virtual {v1, v3, v7, v9}, Ll/swg0;->e(ILjava/lang/String;Z)V

    .line 350
    .line 351
    .line 352
    goto :goto_5

    .line 353
    :cond_6
    iget-object v3, v1, Ll/swg0;->e:Ll/wrg0;

    .line 354
    .line 355
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 356
    .line 357
    .line 358
    iget-object v3, v1, Ll/swg0;->e:Ll/wrg0;

    .line 359
    .line 360
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 361
    .line 362
    .line 363
    invoke-virtual {v1, v4, v2, v8}, Ll/swg0;->e(ILjava/lang/String;Z)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 364
    .line 365
    .line 366
    goto :goto_5

    .line 367
    :goto_3
    invoke-virtual {p0, v1}, Ltech/sud/a/a/Sudif;->a(Ljava/lang/Exception;)V

    .line 368
    .line 369
    .line 370
    iget-object v2, p0, Ltech/sud/a/a/Sudif;->c:Ll/swg0;

    .line 371
    .line 372
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object v1

    .line 376
    invoke-virtual {v2, v4, v1, v6}, Ll/swg0;->e(ILjava/lang/String;Z)V

    .line 377
    .line 378
    .line 379
    goto :goto_5

    .line 380
    :goto_4
    instance-of v3, v1, Ljavax/net/ssl/SSLException;

    .line 381
    .line 382
    if-eqz v3, :cond_7

    .line 383
    .line 384
    invoke-virtual {p0, v1}, Ltech/sud/a/a/Sudif;->a(Ljava/lang/Exception;)V

    .line 385
    .line 386
    .line 387
    :cond_7
    iget-object v1, p0, Ltech/sud/a/a/Sudif;->c:Ll/swg0;

    .line 388
    .line 389
    iget v3, v1, Ll/swg0;->d:I

    .line 390
    .line 391
    if-ne v3, v8, :cond_8

    .line 392
    .line 393
    invoke-virtual {v1, v5, v2, v8}, Ll/swg0;->e(ILjava/lang/String;Z)V

    .line 394
    .line 395
    .line 396
    goto :goto_5

    .line 397
    :cond_8
    iget-boolean v3, v1, Ll/swg0;->c:Z

    .line 398
    .line 399
    if-eqz v3, :cond_9

    .line 400
    .line 401
    iget-object v2, v1, Ll/swg0;->j:Ljava/lang/Integer;

    .line 402
    .line 403
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 404
    .line 405
    .line 406
    move-result v2

    .line 407
    iget-object v3, v1, Ll/swg0;->i:Ljava/lang/String;

    .line 408
    .line 409
    iget-object v4, v1, Ll/swg0;->k:Ljava/lang/Boolean;

    .line 410
    .line 411
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 412
    .line 413
    .line 414
    move-result v4

    .line 415
    invoke-virtual {v1, v2, v3, v4}, Ll/swg0;->e(ILjava/lang/String;Z)V

    .line 416
    .line 417
    .line 418
    goto :goto_5

    .line 419
    :cond_9
    iget-object v3, v1, Ll/swg0;->e:Ll/wrg0;

    .line 420
    .line 421
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 422
    .line 423
    .line 424
    iget-object v3, v1, Ll/swg0;->e:Ll/wrg0;

    .line 425
    .line 426
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 427
    .line 428
    .line 429
    invoke-virtual {v1, v4, v2, v8}, Ll/swg0;->e(ILjava/lang/String;Z)V

    .line 430
    .line 431
    .line 432
    :goto_5
    iput-object v0, p0, Ltech/sud/a/a/Sudif;->h:Ljava/lang/Thread;

    .line 433
    .line 434
    return-void

    .line 435
    :cond_a
    :try_start_2
    new-instance v0, Ljava/io/IOException;

    .line 436
    .line 437
    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    .line 438
    .line 439
    .line 440
    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 441
    :goto_6
    iget-object v1, p0, Ltech/sud/a/a/Sudif;->c:Ll/swg0;

    .line 442
    .line 443
    invoke-virtual {p0, v1, v0}, Ltech/sud/a/a/Sudif;->a(Ll/hog0;Ljava/lang/Exception;)V

    .line 444
    .line 445
    .line 446
    iget-object p0, p0, Ltech/sud/a/a/Sudif;->c:Ll/swg0;

    .line 447
    .line 448
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 449
    .line 450
    .line 451
    move-result-object v0

    .line 452
    invoke-virtual {p0, v5, v0, v6}, Ll/swg0;->e(ILjava/lang/String;Z)V

    .line 453
    .line 454
    .line 455
    return-void
.end method
