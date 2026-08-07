.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/Interceptor;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

.field public final c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

.field public final d:I

.field public final e:Lcom/tencent/cloud/ai/network/okhttp3/Request;

.field public final f:Lcom/tencent/cloud/ai/network/okhttp3/Call;

.field public final g:I

.field public final h:I

.field public final i:I

.field public j:I


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;ILcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/Call;III)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/Interceptor;",
            ">;",
            "Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;",
            "Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;",
            "I",
            "Lcom/tencent/cloud/ai/network/okhttp3/Request;",
            "Lcom/tencent/cloud/ai/network/okhttp3/Call;",
            "III)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->a:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 9
    .line 10
    iput p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->d:I

    .line 11
    .line 12
    iput-object p5, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->e:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->f:Lcom/tencent/cloud/ai/network/okhttp3/Call;

    .line 15
    .line 16
    iput p7, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->g:I

    .line 17
    .line 18
    iput p8, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->h:I

    .line 19
    .line 20
    iput p9, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->i:I

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public call()Lcom/tencent/cloud/ai/network/okhttp3/Call;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->f:Lcom/tencent/cloud/ai/network/okhttp3/Call;

    .line 2
    .line 3
    return-object p0
.end method

.method public connectTimeoutMillis()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public connection()Lcom/tencent/cloud/ai/network/okhttp3/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    .line 6
    .line 7
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->connection()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public exchange()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0
.end method

.method public proceed(Lcom/tencent/cloud/ai/network/okhttp3/Request;)Lcom/tencent/cloud/ai/network/okhttp3/Response;
    .locals 2

    .line 170
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    invoke-virtual {p0, p1, v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->proceed(Lcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;)Lcom/tencent/cloud/ai/network/okhttp3/Response;

    move-result-object p0

    return-object p0
.end method

.method public proceed(Lcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;)Lcom/tencent/cloud/ai/network/okhttp3/Response;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->d:I

    .line 4
    .line 5
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x0

    .line 12
    if-ge v1, v2, :cond_8

    .line 13
    .line 14
    iget v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->j:I

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    add-int/2addr v1, v2

    .line 18
    iput v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->j:I

    .line 19
    .line 20
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 21
    .line 22
    const-string v4, "network interceptor "

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    .line 27
    .line 28
    invoke-interface {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->connection()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual/range {p1 .. p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->url()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    invoke-virtual {v1, v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->a(Lcom/tencent/cloud/ai/network/okhttp3/p;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->a:Ljava/util/List;

    .line 44
    .line 45
    iget v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->d:I

    .line 46
    .line 47
    sub-int/2addr v0, v2

    .line 48
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v1, " must retain the same host and port"

    .line 53
    .line 54
    invoke-static {v4, v0, v1}, Ll/m5j;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    return-object v3

    .line 58
    :cond_1
    :goto_0
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 59
    .line 60
    const-string v5, " must call proceed() exactly once"

    .line 61
    .line 62
    if-eqz v1, :cond_3

    .line 63
    .line 64
    iget v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->j:I

    .line 65
    .line 66
    if-gt v1, v2, :cond_2

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->a:Ljava/util/List;

    .line 70
    .line 71
    iget v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->d:I

    .line 72
    .line 73
    sub-int/2addr v0, v2

    .line 74
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v4, v0, v5}, Ll/m5j;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    return-object v3

    .line 82
    :cond_3
    :goto_1
    new-instance v6, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;

    .line 83
    .line 84
    iget-object v7, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->a:Ljava/util/List;

    .line 85
    .line 86
    iget v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->d:I

    .line 87
    .line 88
    add-int/lit8 v10, v1, 0x1

    .line 89
    .line 90
    iget-object v12, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->f:Lcom/tencent/cloud/ai/network/okhttp3/Call;

    .line 91
    .line 92
    iget v13, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->g:I

    .line 93
    .line 94
    iget v14, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->h:I

    .line 95
    .line 96
    iget v15, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->i:I

    .line 97
    .line 98
    move-object/from16 v11, p1

    .line 99
    .line 100
    move-object/from16 v8, p2

    .line 101
    .line 102
    move-object/from16 v9, p3

    .line 103
    .line 104
    invoke-direct/range {v6 .. v15}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;-><init>(Ljava/util/List;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;ILcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/Call;III)V

    .line 105
    .line 106
    .line 107
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->a:Ljava/util/List;

    .line 108
    .line 109
    iget v7, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->d:I

    .line 110
    .line 111
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    check-cast v1, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor;

    .line 116
    .line 117
    invoke-interface {v1, v6}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor;->intercept(Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;)Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 118
    .line 119
    .line 120
    move-result-object v7

    .line 121
    if-eqz p3, :cond_5

    .line 122
    .line 123
    iget v8, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->d:I

    .line 124
    .line 125
    add-int/2addr v8, v2

    .line 126
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->a:Ljava/util/List;

    .line 127
    .line 128
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-ge v8, v0, :cond_5

    .line 133
    .line 134
    iget v0, v6, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->j:I

    .line 135
    .line 136
    if-ne v0, v2, :cond_4

    .line 137
    .line 138
    goto :goto_2

    .line 139
    :cond_4
    invoke-static {v4, v1, v5}, Ll/wmw;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    return-object v3

    .line 143
    :cond_5
    :goto_2
    const-string v0, "interceptor "

    .line 144
    .line 145
    if-eqz v7, :cond_7

    .line 146
    .line 147
    invoke-virtual {v7}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->body()Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    if-eqz v2, :cond_6

    .line 152
    .line 153
    return-object v7

    .line 154
    :cond_6
    const-string v2, " returned a response with no body"

    .line 155
    .line 156
    invoke-static {v0, v1, v2}, Ll/wmw;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 157
    .line 158
    .line 159
    return-object v3

    .line 160
    :cond_7
    const-string v2, " returned null"

    .line 161
    .line 162
    invoke-static {v0, v1, v2}, Ll/c0l;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    return-object v3

    .line 166
    :cond_8
    invoke-static {}, Ll/aqg0;->a()V

    .line 167
    .line 168
    .line 169
    return-object v3
.end method

.method public readTimeoutMillis()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public request()Lcom/tencent/cloud/ai/network/okhttp3/Request;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->e:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 2
    .line 3
    return-object p0
.end method

.method public transmitter()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 2
    .line 3
    return-object p0
.end method

.method public withConnectTimeout(ILjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;
    .locals 12

    .line 1
    int-to-long v0, p1

    .line 2
    const-string p1, "timeout"

    .line 3
    .line 4
    invoke-static {p1, v0, v1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    .line 5
    .line 6
    .line 7
    move-result v9

    .line 8
    new-instance v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;

    .line 9
    .line 10
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->a:Ljava/util/List;

    .line 11
    .line 12
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 13
    .line 14
    iget-object v5, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 15
    .line 16
    iget v6, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->d:I

    .line 17
    .line 18
    iget-object v7, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->e:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 19
    .line 20
    iget-object v8, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->f:Lcom/tencent/cloud/ai/network/okhttp3/Call;

    .line 21
    .line 22
    iget v10, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->h:I

    .line 23
    .line 24
    iget v11, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->i:I

    .line 25
    .line 26
    invoke-direct/range {v2 .. v11}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;-><init>(Ljava/util/List;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;ILcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/Call;III)V

    .line 27
    .line 28
    .line 29
    return-object v2
.end method

.method public withReadTimeout(ILjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;
    .locals 12

    .line 1
    int-to-long v0, p1

    .line 2
    const-string p1, "timeout"

    .line 3
    .line 4
    invoke-static {p1, v0, v1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    .line 5
    .line 6
    .line 7
    move-result v10

    .line 8
    new-instance v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;

    .line 9
    .line 10
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->a:Ljava/util/List;

    .line 11
    .line 12
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 13
    .line 14
    iget-object v5, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 15
    .line 16
    iget v6, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->d:I

    .line 17
    .line 18
    iget-object v7, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->e:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 19
    .line 20
    iget-object v8, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->f:Lcom/tencent/cloud/ai/network/okhttp3/Call;

    .line 21
    .line 22
    iget v9, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->g:I

    .line 23
    .line 24
    iget v11, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->i:I

    .line 25
    .line 26
    invoke-direct/range {v2 .. v11}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;-><init>(Ljava/util/List;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;ILcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/Call;III)V

    .line 27
    .line 28
    .line 29
    return-object v2
.end method

.method public withWriteTimeout(ILjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;
    .locals 12

    .line 1
    int-to-long v0, p1

    .line 2
    const-string p1, "timeout"

    .line 3
    .line 4
    invoke-static {p1, v0, v1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    .line 5
    .line 6
    .line 7
    move-result v11

    .line 8
    new-instance v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;

    .line 9
    .line 10
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->a:Ljava/util/List;

    .line 11
    .line 12
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 13
    .line 14
    iget-object v5, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 15
    .line 16
    iget v6, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->d:I

    .line 17
    .line 18
    iget-object v7, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->e:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 19
    .line 20
    iget-object v8, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->f:Lcom/tencent/cloud/ai/network/okhttp3/Call;

    .line 21
    .line 22
    iget v9, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->g:I

    .line 23
    .line 24
    iget v10, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->h:I

    .line 25
    .line 26
    invoke-direct/range {v2 .. v11}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;-><init>(Ljava/util/List;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;ILcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/Call;III)V

    .line 27
    .line 28
    .line 29
    return-object v2
.end method

.method public writeTimeoutMillis()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->i:I

    .line 2
    .line 3
    return p0
.end method
