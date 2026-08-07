.class Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->createCallable(Lorg/fourthline/cling/model/message/StreamRequestMessage;Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;)Ljava/util/concurrent/Callable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lorg/fourthline/cling/model/message/StreamResponseMessage;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;

.field final synthetic val$exchange:Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;

.field final synthetic val$requestMessage:Lorg/fourthline/cling/model/message/StreamRequestMessage;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;Lorg/fourthline/cling/model/message/StreamRequestMessage;Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$2;->this$0:Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$2;->val$requestMessage:Lorg/fourthline/cling/model/message/StreamRequestMessage;

    .line 4
    .line 5
    iput-object p3, p0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$2;->val$exchange:Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 125
    invoke-virtual {p0}, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$2;->call()Lorg/fourthline/cling/model/message/StreamResponseMessage;

    move-result-object p0

    return-object p0
.end method

.method public call()Lorg/fourthline/cling/model/message/StreamResponseMessage;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {}, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->access$000()Ljava/util/logging/Logger;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->access$000()Ljava/util/logging/Logger;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v2, "Sending HTTP request: "

    .line 20
    .line 21
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$2;->val$requestMessage:Lorg/fourthline/cling/model/message/StreamRequestMessage;

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object v0, p0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$2;->this$0:Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;

    .line 37
    .line 38
    iget-object v0, v0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->client:Lorg/eclipse/jetty/client/HttpClient;

    .line 39
    .line 40
    iget-object v1, p0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$2;->val$exchange:Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpClient;->send(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$2;->val$exchange:Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;

    .line 46
    .line 47
    invoke-virtual {v0}, Lorg/eclipse/jetty/client/HttpExchange;->waitForDone()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    const/4 v1, 0x7

    .line 52
    const/4 v2, 0x0

    .line 53
    if-ne v0, v1, :cond_1

    .line 54
    .line 55
    :try_start_0
    iget-object v0, p0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$2;->val$exchange:Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;

    .line 56
    .line 57
    invoke-virtual {v0}, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$HttpContentExchange;->createResponse()Lorg/fourthline/cling/model/message/StreamResponseMessage;

    .line 58
    .line 59
    .line 60
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    return-object p0

    .line 62
    :catchall_0
    move-exception v0

    .line 63
    invoke-static {}, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->access$000()Ljava/util/logging/Logger;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    sget-object v3, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 68
    .line 69
    new-instance v4, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string v5, "Error reading response: "

    .line 72
    .line 73
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl$2;->val$requestMessage:Lorg/fourthline/cling/model/message/StreamRequestMessage;

    .line 77
    .line 78
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-static {v0}, Lorg/seamless/util/Exceptions;->unwrap(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v1, v3, p0, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 90
    .line 91
    .line 92
    return-object v2

    .line 93
    :cond_1
    const/16 p0, 0xb

    .line 94
    .line 95
    if-ne v0, p0, :cond_2

    .line 96
    .line 97
    return-object v2

    .line 98
    :cond_2
    const/16 p0, 0x9

    .line 99
    .line 100
    if-ne v0, p0, :cond_3

    .line 101
    .line 102
    return-object v2

    .line 103
    :cond_3
    invoke-static {}, Lorg/fourthline/cling/transport/impl/jetty/StreamClientImpl;->access$000()Ljava/util/logging/Logger;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    new-instance v1, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    const-string v3, "Unhandled HTTP exchange status: "

    .line 110
    .line 111
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {p0, v0}, Ljava/util/logging/Logger;->warning(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    return-object v2
.end method
