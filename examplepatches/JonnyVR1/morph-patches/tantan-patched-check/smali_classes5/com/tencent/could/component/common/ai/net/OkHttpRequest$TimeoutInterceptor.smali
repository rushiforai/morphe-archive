.class public Lcom/tencent/could/component/common/ai/net/OkHttpRequest$TimeoutInterceptor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okhttp3/Interceptor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/could/component/common/ai/net/OkHttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TimeoutInterceptor"
.end annotation


# instance fields
.field public final synthetic a:Lcom/tencent/could/component/common/ai/net/OkHttpRequest;


# direct methods
.method public constructor <init>(Lcom/tencent/could/component/common/ai/net/OkHttpRequest;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/net/OkHttpRequest$TimeoutInterceptor;->a:Lcom/tencent/could/component/common/ai/net/OkHttpRequest;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public intercept(Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;)Lcom/tencent/cloud/ai/network/okhttp3/Response;
    .locals 4

    .line 1
    invoke-interface {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->request()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "TimeoutInterceptor intercept"

    .line 6
    .line 7
    const-string v2, "OkHttpRequest"

    .line 8
    .line 9
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/OkHttpRequest$TimeoutInterceptor;->a:Lcom/tencent/could/component/common/ai/net/OkHttpRequest;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 15
    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    invoke-static {}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->getInstance()Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v1, "netWorkParam is null!"

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->logDebug(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->proceed(Lcom/tencent/cloud/ai/network/okhttp3/Request;)Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v1, "currentConnectTimeout:"

    .line 35
    .line 36
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    sget v1, Lcom/tencent/could/component/common/ai/net/OkHttpRequest;->currentConnectTimeout:I

    .line 40
    .line 41
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    new-instance p0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v1, "currentTimeout:"

    .line 54
    .line 55
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    sget v1, Lcom/tencent/could/component/common/ai/net/OkHttpRequest;->currentTimeout:I

    .line 59
    .line 60
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    sget p0, Lcom/tencent/could/component/common/ai/net/OkHttpRequest;->currentConnectTimeout:I

    .line 71
    .line 72
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 73
    .line 74
    invoke-interface {p1, p0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->withConnectTimeout(ILjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    sget p1, Lcom/tencent/could/component/common/ai/net/OkHttpRequest;->currentTimeout:I

    .line 79
    .line 80
    invoke-interface {p0, p1, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->withWriteTimeout(ILjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    sget p1, Lcom/tencent/could/component/common/ai/net/OkHttpRequest;->currentTimeout:I

    .line 85
    .line 86
    invoke-interface {p0, p1, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->withReadTimeout(ILjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    new-instance v1, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    const-string v3, "ConnectTimeout:"

    .line 97
    .line 98
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->connectTimeoutMillis()I

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {p1, v2, v1}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    new-instance v1, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    const-string v3, "WriteTimeout:"

    .line 122
    .line 123
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->writeTimeoutMillis()I

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {p1, v2, v1}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    new-instance v1, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    const-string v3, "ReadTimeout:"

    .line 147
    .line 148
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->readTimeoutMillis()I

    .line 152
    .line 153
    .line 154
    move-result v3

    .line 155
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    invoke-virtual {p1, v2, v1}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    invoke-interface {p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->proceed(Lcom/tencent/cloud/ai/network/okhttp3/Request;)Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    return-object p0
.end method
