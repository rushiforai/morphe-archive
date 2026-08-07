.class public Ll/y1;
.super Ll/gr2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/gr2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static g(Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;)Lcom/tantanapp/common/network/NetworkTrackInfo;
    .locals 5

    .line 1
    new-instance v0, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/common/network/NetworkTrackInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;->AV:Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setReportType(Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;)V

    .line 9
    .line 10
    .line 11
    iget-wide v1, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mAddTimestamp:J

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setCreateTime(J)V

    .line 14
    .line 15
    .line 16
    iget-wide v1, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mAddTimestamp:J

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setRequestTimestamp(J)V

    .line 19
    .line 20
    .line 21
    iget v1, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mEventSubCode:I

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    new-instance v1, Ljava/lang/Exception;

    .line 26
    .line 27
    iget v2, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mEventSubCode:I

    .line 28
    .line 29
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setThrowable(Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-object v1, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mUrl:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setUrl(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-wide v1, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mRequireStart:J

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setRangeStart(J)V

    .line 47
    .line 48
    .line 49
    iget v1, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mHeaderSize:I

    .line 50
    .line 51
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setRequestHeaderSize(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget v1, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mHttpCode:I

    .line 59
    .line 60
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setResponseCode(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-wide v1, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDownloadedSize:J

    .line 68
    .line 69
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setResponseBodyByteCount(J)V

    .line 70
    .line 71
    .line 72
    const-wide/16 v1, 0x0

    .line 73
    .line 74
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setDnsStartTime(J)V

    .line 75
    .line 76
    .line 77
    iget-wide v3, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mDnsUsedTime:J

    .line 78
    .line 79
    invoke-virtual {v0, v3, v4}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setDnsEndTime(J)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setConnectStartTime(J)V

    .line 83
    .line 84
    .line 85
    iget-wide v3, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mConnectUsedTime:J

    .line 86
    .line 87
    invoke-virtual {v0, v3, v4}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setConnectEndTime(J)V

    .line 88
    .line 89
    .line 90
    iget-object v3, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mCdnIp:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v0, v3}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setConnectIp(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setSecureConnectStartTime(J)V

    .line 96
    .line 97
    .line 98
    iget v3, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mTlsTime:I

    .line 99
    .line 100
    int-to-long v3, v3

    .line 101
    invoke-virtual {v0, v3, v4}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setSecureConnectEndTime(J)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setRequestHeadersEndTime(J)V

    .line 105
    .line 106
    .line 107
    iget p0, p0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;->mFirstPacketTime:I

    .line 108
    .line 109
    int-to-long v1, p0

    .line 110
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/common/network/NetworkTrackInfo;->setResponseHeadersEndTime(J)V

    .line 111
    .line 112
    .line 113
    return-object v0
.end method


# virtual methods
.method public e(Lcom/tantanapp/common/network/NetworkTrackInfo;)Ljava/util/HashMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/network/NetworkTrackInfo;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/gr2;->e(Lcom/tantanapp/common/network/NetworkTrackInfo;)Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getThrowable()Ljava/lang/Throwable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getThrowable()Ljava/lang/Throwable;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "err"

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    :cond_0
    :try_start_0
    const-string v1, "url"

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getRequestUrl()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catch_0
    move-exception v1

    .line 35
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    new-instance v2, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v3, "exception happend: "

    .line 41
    .line 42
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const-string v2, "parse_error"

    .line 57
    .line 58
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    :goto_0
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getRangeStart()J

    .line 62
    .line 63
    .line 64
    move-result-wide v1

    .line 65
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const-string v1, "range_offset"

    .line 70
    .line 71
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    const-string p1, "uip"

    .line 75
    .line 76
    invoke-virtual {p0}, Ll/y1;->f()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    return-object v0
.end method

.method public final f()Ljava/lang/String;
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :cond_0
    invoke-interface {p0}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/net/NetworkInterface;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :cond_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ljava/net/InetAddress;

    .line 32
    .line 33
    instance-of v2, v1, Ljava/net/Inet4Address;

    .line 34
    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    const-string v2, "127.0.0.1"

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v2
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    if-nez v2, :cond_1

    .line 50
    .line 51
    return-object v1

    .line 52
    :catch_0
    move-exception p0

    .line 53
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    const-string p0, ""

    .line 57
    .line 58
    return-object p0
.end method
