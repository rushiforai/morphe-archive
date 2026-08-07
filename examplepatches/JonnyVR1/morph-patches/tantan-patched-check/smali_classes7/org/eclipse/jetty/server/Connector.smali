.class public interface abstract Lorg/eclipse/jetty/server/Connector;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/util/component/LifeCycle;


# virtual methods
.method public abstract close()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract customize(Lorg/eclipse/jetty/io/EndPoint;Lorg/eclipse/jetty/server/Request;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getConfidentialPort()I
.end method

.method public abstract getConfidentialScheme()Ljava/lang/String;
.end method

.method public abstract getConnection()Ljava/lang/Object;
.end method

.method public abstract getConnections()I
.end method

.method public abstract getConnectionsDurationMax()J
.end method

.method public abstract getConnectionsDurationMean()D
.end method

.method public abstract getConnectionsDurationStdDev()D
.end method

.method public abstract getConnectionsDurationTotal()J
.end method

.method public abstract getConnectionsOpen()I
.end method

.method public abstract getConnectionsOpenMax()I
.end method

.method public abstract getConnectionsRequestsMax()I
.end method

.method public abstract getConnectionsRequestsMean()D
.end method

.method public abstract getConnectionsRequestsStdDev()D
.end method

.method public abstract getHost()Ljava/lang/String;
.end method

.method public abstract getIntegralPort()I
.end method

.method public abstract getIntegralScheme()Ljava/lang/String;
.end method

.method public abstract getLocalPort()I
.end method

.method public abstract getLowResourceMaxIdleTime()I
.end method

.method public abstract getMaxIdleTime()I
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getPort()I
.end method

.method public abstract getRequestBufferSize()I
.end method

.method public abstract getRequestBuffers()Lorg/eclipse/jetty/io/Buffers;
.end method

.method public abstract getRequestHeaderSize()I
.end method

.method public abstract getRequests()I
.end method

.method public abstract getResolveNames()Z
.end method

.method public abstract getResponseBufferSize()I
.end method

.method public abstract getResponseBuffers()Lorg/eclipse/jetty/io/Buffers;
.end method

.method public abstract getResponseHeaderSize()I
.end method

.method public abstract getServer()Lorg/eclipse/jetty/server/Server;
.end method

.method public abstract getStatsOn()Z
.end method

.method public abstract getStatsOnMs()J
.end method

.method public abstract isConfidential(Lorg/eclipse/jetty/server/Request;)Z
.end method

.method public abstract isIntegral(Lorg/eclipse/jetty/server/Request;)Z
.end method

.method public abstract isLowResources()Z
.end method

.method public abstract open()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract persist(Lorg/eclipse/jetty/io/EndPoint;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract setHost(Ljava/lang/String;)V
.end method

.method public abstract setLowResourceMaxIdleTime(I)V
.end method

.method public abstract setMaxIdleTime(I)V
.end method

.method public abstract setPort(I)V
.end method

.method public abstract setRequestBufferSize(I)V
.end method

.method public abstract setRequestHeaderSize(I)V
.end method

.method public abstract setResponseBufferSize(I)V
.end method

.method public abstract setResponseHeaderSize(I)V
.end method

.method public abstract setServer(Lorg/eclipse/jetty/server/Server;)V
.end method

.method public abstract setStatsOn(Z)V
.end method

.method public abstract statsReset()V
.end method
