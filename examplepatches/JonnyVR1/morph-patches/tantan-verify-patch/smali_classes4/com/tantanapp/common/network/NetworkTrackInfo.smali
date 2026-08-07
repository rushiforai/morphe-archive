.class public Lcom/tantanapp/common/network/NetworkTrackInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;
    }
.end annotation


# instance fields
.field private callEndTime:J

.field private callStartTime:J

.field private clientIp:Ljava/lang/String;

.field private connectEndTime:J

.field private connectIp:Ljava/lang/String;

.field private connectStartTime:J

.field private connection:Ll/bx5;

.field private connectionAcquiredTime:J

.field private createTime:J

.field private dnsEndTime:J

.field private dnsStartTime:J

.field private domainName:Ljava/lang/String;

.field private finishTime:J

.field private handshake:Ll/txk;

.field private inetSocketAddress:Ljava/net/InetSocketAddress;

.field private isCancel:Z

.field private isHttpDns:Z

.field private protocol:Lokhttp3/Protocol;

.field private rangeStart:J

.field private reportType:Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

.field private request:Ll/x1d0;

.field private requestBodyByteCount:J

.field private requestBodyEndTime:J

.field private requestBodySize:Ljava/lang/String;

.field private requestBodyStartTime:J

.field private requestHeaderSize:Ljava/lang/String;

.field private requestHeadersEndTime:J

.field private requestHeadersStartTime:J

.field private requestSize:Ljava/lang/String;

.field private requestTimestamp:J

.field private response:Ll/i5d0;

.field private responseBodyByteCount:J

.field private responseBodyEndTime:J

.field private responseBodyStartTime:J

.field private responseCode:Ljava/lang/String;

.field private responseHeadersEndTime:J

.field private responseHeadersStartTime:J

.field private secureConnectEndTime:J

.field private secureConnectStartTime:J

.field private throwable:Ljava/lang/Throwable;

.field private tlsVersion:Lokhttp3/TlsVersion;

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->isCancel:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->isHttpDns:Z

    .line 8
    .line 9
    return-void
.end method

.method public static getErrCode(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 2

    .line 1
    if-eqz p0, :cond_6

    .line 2
    .line 3
    instance-of v0, p0, Ljava/net/UnknownHostException;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "100000"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    instance-of v0, p0, Ljava/io/InterruptedIOException;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const-string p0, "102000"

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    instance-of v0, p0, Ljava/net/ConnectException;

    .line 18
    .line 19
    const-string v1, "101000"

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    return-object v1

    .line 24
    :cond_2
    instance-of v0, p0, Lcom/fasterxml/jackson/core/JsonProcessingException;

    .line 25
    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    const-string p0, "201200"

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_3
    instance-of v0, p0, Lcom/tantanapp/common/network/ApiExcep$Client$Unauthorized;

    .line 32
    .line 33
    if-eqz v0, :cond_4

    .line 34
    .line 35
    const-string p0, "202200"

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_4
    instance-of p0, p0, Lcom/tantanapp/common/network/ApiExcep$Client$TooManyRequests;

    .line 39
    .line 40
    if-eqz p0, :cond_5

    .line 41
    .line 42
    const-string p0, "203200"

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_5
    return-object v1

    .line 46
    :cond_6
    const-string p0, "0"

    .line 47
    .line 48
    return-object p0
.end method

.method public static getException(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p0, :cond_3

    .line 2
    .line 3
    instance-of v0, p0, Lokhttp3/internal/http2/StreamResetException;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "StreamResetException"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    instance-of v0, p0, Lokhttp3/internal/http2/ConnectionShutdownException;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const-string p0, "ConnectionShutdownException"

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    instance-of v0, p0, Lcom/fasterxml/jackson/core/JsonParseException;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    const-string p0, "JsonParseException"

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_3
    const-string p0, ""

    .line 34
    .line 35
    return-object p0
.end method

.method public static ifProxyExist()Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    const-string v1, "http.proxyHost"

    .line 3
    .line 4
    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const-string v2, "http.proxyPort"

    .line 9
    .line 10
    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-string v2, "-1"

    .line 18
    .line 19
    :goto_0
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    const/4 v1, -0x1

    .line 30
    if-eq v2, v1, :cond_1

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    :catch_0
    :cond_1
    return v0
.end method


# virtual methods
.method public getCallEndTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->callEndTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getCallStartTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->callStartTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getClientIp()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->clientIp:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->connectIp:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, ""

    .line 9
    .line 10
    return-object p0
.end method

.method public getConnectEndTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->connectEndTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getConnectIp()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->connectIp:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, ""

    .line 7
    .line 8
    return-object p0
.end method

.method public getConnectStartTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->connectStartTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getConnection()Ll/bx5;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->connection:Ll/bx5;

    .line 2
    .line 3
    return-object p0
.end method

.method public getConnectionAcquiredTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->connectionAcquiredTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getCreateTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->createTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getDnsEndTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->dnsEndTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getDnsStartTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->dnsStartTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getDomainName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->domainName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExceptionMessage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->throwable:Ljava/lang/Throwable;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getException(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getFinishTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->finishTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getHandshake()Ll/txk;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->handshake:Ll/txk;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInetSocketAddress()Ljava/net/InetSocketAddress;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->inetSocketAddress:Ljava/net/InetSocketAddress;

    .line 2
    .line 3
    return-object p0
.end method

.method public getProtocol()Lokhttp3/Protocol;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->protocol:Lokhttp3/Protocol;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRangeStart()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->rangeStart:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getReportType()Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->reportType:Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRequest()Ll/x1d0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->request:Ll/x1d0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRequestBodyByteCount()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestBodyByteCount:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRequestBodyEndTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestBodyEndTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRequestBodySize()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestBodySize:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "0"

    .line 7
    .line 8
    return-object p0
.end method

.method public getRequestBodyStartTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestBodyStartTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRequestHeaderSize()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestHeaderSize:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, ""

    .line 7
    .line 8
    return-object p0
.end method

.method public getRequestHeadersEndTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestHeadersEndTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRequestHeadersStartTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestHeadersStartTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRequestMethod()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->request:Ll/x1d0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/x1d0;->g()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, ""

    .line 11
    .line 12
    return-object p0
.end method

.method public getRequestSize()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestSize:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, ""

    .line 7
    .line 8
    return-object p0
.end method

.method public getRequestTimestamp()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestTimestamp:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRequestUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->url:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, ""

    .line 7
    .line 8
    return-object p0
.end method

.method public getResponse()Ll/i5d0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->response:Ll/i5d0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResponseBodyByteCount()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->responseBodyByteCount:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getResponseBodyEndTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->responseBodyEndTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getResponseBodyStartTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->responseBodyStartTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getResponseCode()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->responseCode:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "0"

    .line 7
    .line 8
    return-object p0
.end method

.method public getResponseHeadersEndTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->responseHeadersEndTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getResponseHeadersStartTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->responseHeadersStartTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getSecureConnectEndTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->secureConnectEndTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getSecureConnectStartTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->secureConnectStartTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->throwable:Ljava/lang/Throwable;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTlsVersion()Lokhttp3/TlsVersion;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->tlsVersion:Lokhttp3/TlsVersion;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->url:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isCancel()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->isCancel:Z

    .line 2
    .line 3
    return p0
.end method

.method public isHttpDns()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->isHttpDns:Z

    .line 2
    .line 3
    return p0
.end method

.method public setCallEndTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->callEndTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setCallStartTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->callStartTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setCancel(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->isCancel:Z

    .line 2
    .line 3
    return-void
.end method

.method public setClientIp(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->clientIp:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setConnectEndTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->connectEndTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setConnectIp(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->connectIp:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setConnectStartTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->connectStartTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setConnection(Ll/bx5;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->connection:Ll/bx5;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    :try_start_0
    invoke-interface {p1}, Ll/bx5;->c()Ll/txk;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/txk;->g()Lokhttp3/TlsVersion;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->tlsVersion:Lokhttp3/TlsVersion;

    .line 16
    .line 17
    :cond_0
    invoke-interface {p1}, Ll/bx5;->b()Ll/nnd0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/nnd0;->d()Ljava/net/InetSocketAddress;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->connectIp:Ljava/lang/String;

    .line 34
    .line 35
    invoke-interface {p1}, Ll/bx5;->d()Ljava/net/Socket;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ljava/net/Socket;->getLocalAddress()Ljava/net/InetAddress;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->clientIp:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->request:Ll/x1d0;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/x1d0;->k()Ll/rnl;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/rnl;->m()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-interface {p1}, Ll/bx5;->b()Ll/nnd0;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1}, Ll/nnd0;->d()Ljava/net/InetSocketAddress;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p1}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    xor-int/lit8 p1, p1, 0x1

    .line 76
    .line 77
    iput-boolean p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->isHttpDns:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    .line 79
    :catch_0
    :cond_1
    return-void
.end method

.method public setConnectionAcquiredTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->connectionAcquiredTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setCreateTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->createTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setDnsEndTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->dnsEndTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setDnsStartTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->dnsStartTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setDomainName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->domainName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setFinishTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->finishTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setHandshake(Ll/txk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->handshake:Ll/txk;

    .line 2
    .line 3
    return-void
.end method

.method public setInetSocketAddress(Ljava/net/InetSocketAddress;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->inetSocketAddress:Ljava/net/InetSocketAddress;

    .line 2
    .line 3
    return-void
.end method

.method public setProtocol(Lokhttp3/Protocol;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->protocol:Lokhttp3/Protocol;

    .line 2
    .line 3
    return-void
.end method

.method public setRangeStart(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->rangeStart:J

    .line 2
    .line 3
    return-void
.end method

.method public setReportType(Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->reportType:Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 2
    .line 3
    return-void
.end method

.method public setRequest(Ll/x1d0;)V
    .locals 6

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->request:Ll/x1d0;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ll/rnl;->m()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Ll/rnl;->h()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->url:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/x1d0;->e()Ll/e0l;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/e0l;->a()J

    .line 43
    .line 44
    .line 45
    move-result-wide v0

    .line 46
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    iput-object v2, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestHeaderSize:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v2}, Ll/rnl;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    add-int/lit8 v2, v2, 0x1

    .line 65
    .line 66
    int-to-long v2, v2

    .line 67
    add-long/2addr v2, v0

    .line 68
    long-to-int v2, v2

    .line 69
    invoke-virtual {p1}, Ll/x1d0;->a()Ll/z1d0;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    if-eqz v3, :cond_0

    .line 74
    .line 75
    int-to-long v2, v2

    .line 76
    invoke-virtual {p1}, Ll/x1d0;->a()Ll/z1d0;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p1}, Ll/z1d0;->contentLength()J

    .line 81
    .line 82
    .line 83
    move-result-wide v4

    .line 84
    add-long/2addr v2, v4

    .line 85
    long-to-int v2, v2

    .line 86
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 87
    .line 88
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iput-object p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestSize:Ljava/lang/String;

    .line 93
    .line 94
    int-to-long v2, v2

    .line 95
    sub-long/2addr v2, v0

    .line 96
    const-wide/16 v0, 0x0

    .line 97
    .line 98
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    .line 99
    .line 100
    .line 101
    move-result-wide v0

    .line 102
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iput-object p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestBodySize:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    .line 108
    :catch_0
    :cond_1
    return-void
.end method

.method public setRequestBodyByteCount(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestBodyByteCount:J

    .line 2
    .line 3
    return-void
.end method

.method public setRequestBodyEndTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestBodyEndTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setRequestBodyStartTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestBodyStartTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setRequestHeaderSize(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestHeaderSize:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setRequestHeadersEndTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestHeadersEndTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setRequestHeadersStartTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestHeadersStartTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setRequestSize(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestSize:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setRequestTimestamp(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestTimestamp:J

    .line 2
    .line 3
    return-void
.end method

.method public setResponse(Ll/i5d0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->response:Ll/i5d0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/i5d0;->q()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->responseCode:Ljava/lang/String;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public setResponseBodyByteCount(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->responseBodyByteCount:J

    .line 2
    .line 3
    return-void
.end method

.method public setResponseBodyEndTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->responseBodyEndTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setResponseBodyStartTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->responseBodyStartTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setResponseCode(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->responseCode:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setResponseHeadersEndTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->responseHeadersEndTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setResponseHeadersStartTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->responseHeadersStartTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setSecureConnectEndTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->secureConnectEndTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setSecureConnectStartTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->secureConnectStartTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setThrowable(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->throwable:Ljava/lang/Throwable;

    .line 2
    .line 3
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->url:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "NetworkTrackInfo{requestTimestamp="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-wide v1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestTimestamp:J

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "createTime="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-wide v1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->createTime:J

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", isHttpDns="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-boolean v1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->isHttpDns:Z

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", requestBodyByteCount="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-wide v1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestBodyByteCount:J

    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", responseBodyByteCount="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-wide v1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->responseBodyByteCount:J

    .line 49
    .line 50
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", reportType="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->reportType:Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", url=\'"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->url:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", requestHeaderSize=\'"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->requestHeaderSize:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ", responseCode=\'"

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->responseCode:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, ", throwable="

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo;->throwable:Ljava/lang/Throwable;

    .line 99
    .line 100
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const/16 p0, 0x7d

    .line 104
    .line 105
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    return-object p0
.end method
