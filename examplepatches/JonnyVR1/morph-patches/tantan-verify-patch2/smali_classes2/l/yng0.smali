.class public final Ll/yng0;
.super Ll/bpg0;
.source "SourceFile"


# instance fields
.field public final c:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;


# direct methods
.method public constructor <init>(Ltech/sud/gip/core/network/detection/NetworkDetectionStep;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bpg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yng0;->c:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final callEnd(Ll/ry3;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/bpg0;->callEnd(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/yng0;->c:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    sget-object v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->COMPLETED:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 9
    .line 10
    iput-object v0, p1, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->status:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 11
    .line 12
    :cond_0
    sget-object p1, Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;->CALL_END:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/yng0;->d(Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final callFailed(Ll/ry3;Ljava/io/IOException;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/bpg0;->callFailed(Ll/ry3;Ljava/io/IOException;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/yng0;->c:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    sget-object p2, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->COMPLETED:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 9
    .line 10
    iput-object p2, p1, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->status:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 11
    .line 12
    :cond_0
    sget-object p1, Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;->CALL_FAILED:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/yng0;->d(Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final callStart(Ll/ry3;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/bpg0;->callStart(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/yng0;->c:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    sget-object v0, Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;->CHECKING:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 9
    .line 10
    iput-object v0, p1, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->status:Ltech/sud/gip/core/network/detection/NetworkDetectionStatus;

    .line 11
    .line 12
    :cond_0
    sget-object p1, Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;->CALL_START:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/yng0;->d(Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final connectEnd(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/bpg0;->connectEnd(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;->CONNECT_END:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/yng0;->d(Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final connectStart(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/bpg0;->connectStart(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;->CONNECT_START:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/yng0;->d(Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final d(Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V
    .locals 1

    .line 1
    new-instance v0, Ll/gng0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/gng0;-><init>(Ll/yng0;Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final dnsEnd(Ll/ry3;Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/bpg0;->dnsEnd(Ll/ry3;Ljava/lang/String;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;->DNS_END:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/yng0;->d(Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final dnsStart(Ll/ry3;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/bpg0;->dnsStart(Ll/ry3;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;->DNS_START:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/yng0;->d(Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic e(Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yng0;->c:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ltech/sud/gip/core/network/detection/NetworkDetectionDetail;

    .line 6
    .line 7
    invoke-direct {v0}, Ltech/sud/gip/core/network/detection/NetworkDetectionDetail;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    iput-wide v1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionDetail;->timestamp:J

    .line 15
    .line 16
    iput-object p1, v0, Ltech/sud/gip/core/network/detection/NetworkDetectionDetail;->type:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 17
    .line 18
    iget-object p0, p0, Ll/yng0;->c:Ltech/sud/gip/core/network/detection/NetworkDetectionStep;

    .line 19
    .line 20
    iget-object p0, p0, Ltech/sud/gip/core/network/detection/NetworkDetectionStep;->detailList:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final requestBodyEnd(Ll/ry3;J)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/bpg0;->requestBodyEnd(Ll/ry3;J)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;->REQUEST_BODY_END:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/yng0;->d(Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final requestBodyStart(Ll/ry3;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/bpg0;->requestBodyStart(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;->REQUEST_BODY_START:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/yng0;->d(Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final requestHeadersEnd(Ll/ry3;Ll/x1d0;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/bpg0;->requestHeadersEnd(Ll/ry3;Ll/x1d0;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;->REQUEST_HEADERS_END:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/yng0;->d(Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final requestHeadersStart(Ll/ry3;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/bpg0;->requestHeadersStart(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;->REQUEST_HEADERS_START:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/yng0;->d(Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final responseBodyEnd(Ll/ry3;J)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/bpg0;->responseBodyEnd(Ll/ry3;J)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;->RESPONSE_BODY_END:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/yng0;->d(Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final responseBodyStart(Ll/ry3;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/bpg0;->responseBodyStart(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;->RESPONSE_BODY_START:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/yng0;->d(Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final responseHeadersEnd(Ll/ry3;Ll/i5d0;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/bpg0;->responseHeadersEnd(Ll/ry3;Ll/i5d0;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;->RESPONSE_HEADERS_END:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/yng0;->d(Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final responseHeadersStart(Ll/ry3;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/bpg0;->responseHeadersStart(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;->RESPONSE_HEADERS_START:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/yng0;->d(Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final secureConnectEnd(Ll/ry3;Ll/txk;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/bpg0;->secureConnectEnd(Ll/ry3;Ll/txk;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;->SECURE_CONNECT_END:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/yng0;->d(Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final secureConnectStart(Ll/ry3;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/bpg0;->secureConnectStart(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;->SECURE_CONNECT_START:Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/yng0;->d(Ltech/sud/gip/core/network/detection/NetworkDetectionDetailType;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
