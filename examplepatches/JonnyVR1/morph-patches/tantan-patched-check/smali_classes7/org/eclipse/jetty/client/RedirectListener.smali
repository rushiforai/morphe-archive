.class public Lorg/eclipse/jetty/client/RedirectListener;
.super Lorg/eclipse/jetty/client/HttpEventListenerWrapper;
.source "SourceFile"


# instance fields
.field private _attempts:I

.field private _destination:Lorg/eclipse/jetty/client/HttpDestination;

.field private final _exchange:Lorg/eclipse/jetty/client/HttpExchange;

.field private _location:Ljava/lang/String;

.field private _redirected:Z

.field private _requestComplete:Z

.field private _responseComplete:Z


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/client/HttpDestination;Lorg/eclipse/jetty/client/HttpExchange;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Lorg/eclipse/jetty/client/HttpExchange;->getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;-><init>(Lorg/eclipse/jetty/client/HttpEventListener;Z)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lorg/eclipse/jetty/client/RedirectListener;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 10
    .line 11
    iput-object p2, p0, Lorg/eclipse/jetty/client/RedirectListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public checkExchangeComplete()Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/client/RedirectListener;->_redirected:Z

    .line 2
    .line 3
    if-eqz v0, :cond_7

    .line 4
    .line 5
    iget-boolean v0, p0, Lorg/eclipse/jetty/client/RedirectListener;->_requestComplete:Z

    .line 6
    .line 7
    if-eqz v0, :cond_7

    .line 8
    .line 9
    iget-boolean v0, p0, Lorg/eclipse/jetty/client/RedirectListener;->_responseComplete:Z

    .line 10
    .line 11
    if-eqz v0, :cond_7

    .line 12
    .line 13
    iget-object v0, p0, Lorg/eclipse/jetty/client/RedirectListener;->_location:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_6

    .line 17
    .line 18
    const-string v2, "://"

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v2, p0, Lorg/eclipse/jetty/client/RedirectListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 25
    .line 26
    if-lez v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Lorg/eclipse/jetty/client/RedirectListener;->_location:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v2, v0}, Lorg/eclipse/jetty/client/HttpExchange;->setURL(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/client/RedirectListener;->_location:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v2, v0}, Lorg/eclipse/jetty/client/HttpExchange;->setRequestURI(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/client/RedirectListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 40
    .line 41
    invoke-virtual {v0}, Lorg/eclipse/jetty/client/HttpExchange;->getScheme()Lorg/eclipse/jetty/io/Buffer;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v2, "https"

    .line 50
    .line 51
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iget-object v2, p0, Lorg/eclipse/jetty/client/RedirectListener;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 56
    .line 57
    invoke-virtual {v2}, Lorg/eclipse/jetty/client/HttpDestination;->getHttpClient()Lorg/eclipse/jetty/client/HttpClient;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    iget-object v3, p0, Lorg/eclipse/jetty/client/RedirectListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 62
    .line 63
    invoke-virtual {v3}, Lorg/eclipse/jetty/client/HttpExchange;->getAddress()Lorg/eclipse/jetty/client/Address;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-virtual {v2, v3, v0}, Lorg/eclipse/jetty/client/HttpClient;->getDestination(Lorg/eclipse/jetty/client/Address;Z)Lorg/eclipse/jetty/client/HttpDestination;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    iget-object v3, p0, Lorg/eclipse/jetty/client/RedirectListener;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 72
    .line 73
    if-ne v3, v2, :cond_1

    .line 74
    .line 75
    iget-object p0, p0, Lorg/eclipse/jetty/client/RedirectListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 76
    .line 77
    invoke-virtual {v3, p0}, Lorg/eclipse/jetty/client/HttpDestination;->resend(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 78
    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_1
    move-object v3, p0

    .line 82
    :goto_1
    instance-of v4, v3, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;

    .line 83
    .line 84
    if-eqz v4, :cond_2

    .line 85
    .line 86
    check-cast v3, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;

    .line 87
    .line 88
    invoke-virtual {v3}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    goto :goto_1

    .line 93
    :cond_2
    iget-object v4, p0, Lorg/eclipse/jetty/client/RedirectListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 94
    .line 95
    invoke-virtual {v4}, Lorg/eclipse/jetty/client/HttpExchange;->getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    invoke-interface {v4}, Lorg/eclipse/jetty/client/HttpEventListener;->onRetry()V

    .line 100
    .line 101
    .line 102
    iget-object v4, p0, Lorg/eclipse/jetty/client/RedirectListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 103
    .line 104
    invoke-virtual {v4}, Lorg/eclipse/jetty/client/HttpExchange;->reset()V

    .line 105
    .line 106
    .line 107
    iget-object v4, p0, Lorg/eclipse/jetty/client/RedirectListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 108
    .line 109
    invoke-virtual {v4, v3}, Lorg/eclipse/jetty/client/HttpExchange;->setEventListener(Lorg/eclipse/jetty/client/HttpEventListener;)V

    .line 110
    .line 111
    .line 112
    iget-object v3, p0, Lorg/eclipse/jetty/client/RedirectListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 113
    .line 114
    invoke-virtual {v3}, Lorg/eclipse/jetty/client/HttpExchange;->getAddress()Lorg/eclipse/jetty/client/Address;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    invoke-virtual {v3}, Lorg/eclipse/jetty/client/Address;->getPort()I

    .line 119
    .line 120
    .line 121
    move-result v4

    .line 122
    new-instance v5, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    const/16 v6, 0x40

    .line 125
    .line 126
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v3}, Lorg/eclipse/jetty/client/Address;->getHost()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    const/16 v3, 0x50

    .line 137
    .line 138
    if-ne v4, v3, :cond_3

    .line 139
    .line 140
    if-eqz v0, :cond_5

    .line 141
    .line 142
    :cond_3
    const/16 v3, 0x1bb

    .line 143
    .line 144
    if-ne v4, v3, :cond_4

    .line 145
    .line 146
    if-nez v0, :cond_5

    .line 147
    .line 148
    :cond_4
    const/16 v0, 0x3a

    .line 149
    .line 150
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    :cond_5
    iget-object v0, p0, Lorg/eclipse/jetty/client/RedirectListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 157
    .line 158
    const-string v3, "Host"

    .line 159
    .line 160
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    invoke-virtual {v0, v3, v4}, Lorg/eclipse/jetty/client/HttpExchange;->setRequestHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    iget-object p0, p0, Lorg/eclipse/jetty/client/RedirectListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 168
    .line 169
    invoke-virtual {v2, p0}, Lorg/eclipse/jetty/client/HttpDestination;->send(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 170
    .line 171
    .line 172
    :goto_2
    return v1

    .line 173
    :cond_6
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegationResult(Z)V

    .line 174
    .line 175
    .line 176
    :cond_7
    const/4 p0, 0x1

    .line 177
    return p0
.end method

.method public onConnectionFailed(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingRequests(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingResponses(Z)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0, p1}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->onConnectionFailed(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onException(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingRequests(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingResponses(Z)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0, p1}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->onException(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onRequestComplete()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/RedirectListener;->_requestComplete:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/RedirectListener;->checkExchangeComplete()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-super {p0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->onRequestComplete()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public onResponseComplete()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/RedirectListener;->_responseComplete:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/RedirectListener;->checkExchangeComplete()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-super {p0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->onResponseComplete()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public onResponseHeader(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/client/RedirectListener;->_redirected:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/BufferCache;->getOrdinal(Lorg/eclipse/jetty/io/Buffer;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/16 v1, 0x2d

    .line 12
    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lorg/eclipse/jetty/client/RedirectListener;->_location:Ljava/lang/String;

    .line 21
    .line 22
    :cond_1
    :goto_0
    invoke-super {p0, p1, p2}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->onResponseHeader(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onResponseStatus(Lorg/eclipse/jetty/io/Buffer;ILorg/eclipse/jetty/io/Buffer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/16 v0, 0x12d

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eq p2, v0, :cond_0

    .line 5
    .line 6
    const/16 v0, 0x12e

    .line 7
    .line 8
    if-ne p2, v0, :cond_1

    .line 9
    .line 10
    :cond_0
    iget v0, p0, Lorg/eclipse/jetty/client/RedirectListener;->_attempts:I

    .line 11
    .line 12
    iget-object v2, p0, Lorg/eclipse/jetty/client/RedirectListener;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 13
    .line 14
    invoke-virtual {v2}, Lorg/eclipse/jetty/client/HttpDestination;->getHttpClient()Lorg/eclipse/jetty/client/HttpClient;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Lorg/eclipse/jetty/client/HttpClient;->maxRedirects()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-ge v0, v2, :cond_1

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move v0, v1

    .line 27
    :goto_0
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/RedirectListener;->_redirected:Z

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingRequests(Z)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingResponses(Z)V

    .line 35
    .line 36
    .line 37
    :cond_2
    invoke-super {p0, p1, p2, p3}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->onResponseStatus(Lorg/eclipse/jetty/io/Buffer;ILorg/eclipse/jetty/io/Buffer;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onRetry()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/RedirectListener;->_redirected:Z

    .line 3
    .line 4
    iget v1, p0, Lorg/eclipse/jetty/client/RedirectListener;->_attempts:I

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    add-int/2addr v1, v2

    .line 8
    iput v1, p0, Lorg/eclipse/jetty/client/RedirectListener;->_attempts:I

    .line 9
    .line 10
    invoke-virtual {p0, v2}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingRequests(Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v2}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingResponses(Z)V

    .line 14
    .line 15
    .line 16
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/RedirectListener;->_requestComplete:Z

    .line 17
    .line 18
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/RedirectListener;->_responseComplete:Z

    .line 19
    .line 20
    invoke-super {p0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->onRetry()V

    .line 21
    .line 22
    .line 23
    return-void
.end method
