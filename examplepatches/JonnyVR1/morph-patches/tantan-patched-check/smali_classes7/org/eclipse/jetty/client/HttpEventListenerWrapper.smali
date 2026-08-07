.class public Lorg/eclipse/jetty/client/HttpEventListenerWrapper;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/client/HttpEventListener;


# instance fields
.field _delegatingRequests:Z

.field _delegatingResponses:Z

.field _delegationResult:Z

.field _listener:Lorg/eclipse/jetty/client/HttpEventListener;

.field private _reason:Lorg/eclipse/jetty/io/Buffer;

.field private _status:I

.field private _version:Lorg/eclipse/jetty/io/Buffer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegationResult:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_listener:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingRequests:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingResponses:Z

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jetty/client/HttpEventListener;Z)V
    .locals 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegationResult:Z

    .line 18
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_listener:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 19
    iput-boolean p2, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingRequests:Z

    .line 20
    iput-boolean p2, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingResponses:Z

    return-void
.end method


# virtual methods
.method public getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_listener:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public isDelegatingRequests()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingRequests:Z

    .line 2
    .line 3
    return p0
.end method

.method public isDelegatingResponses()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingResponses:Z

    .line 2
    .line 3
    return p0
.end method

.method public onConnectionFailed(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingRequests:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_listener:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/client/HttpEventListener;->onConnectionFailed(Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onException(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingRequests:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingResponses:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_listener:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/client/HttpEventListener;->onException(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onExpire()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingRequests:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingResponses:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_listener:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 12
    .line 13
    invoke-interface {p0}, Lorg/eclipse/jetty/client/HttpEventListener;->onExpire()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onRequestCommitted()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingRequests:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_listener:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 6
    .line 7
    invoke-interface {p0}, Lorg/eclipse/jetty/client/HttpEventListener;->onRequestCommitted()V

    .line 8
    .line 9
    .line 10
    :cond_0
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
    iget-boolean v0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingRequests:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_listener:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 6
    .line 7
    invoke-interface {p0}, Lorg/eclipse/jetty/client/HttpEventListener;->onRequestComplete()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onResponseComplete()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingResponses:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegationResult:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_listener:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 10
    .line 11
    iget-object v1, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_version:Lorg/eclipse/jetty/io/Buffer;

    .line 12
    .line 13
    iget v2, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_status:I

    .line 14
    .line 15
    iget-object v3, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_reason:Lorg/eclipse/jetty/io/Buffer;

    .line 16
    .line 17
    invoke-interface {v0, v1, v2, v3}, Lorg/eclipse/jetty/client/HttpEventListener;->onResponseStatus(Lorg/eclipse/jetty/io/Buffer;ILorg/eclipse/jetty/io/Buffer;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_listener:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 21
    .line 22
    invoke-interface {p0}, Lorg/eclipse/jetty/client/HttpEventListener;->onResponseComplete()V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public onResponseContent(Lorg/eclipse/jetty/io/Buffer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingResponses:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_listener:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/client/HttpEventListener;->onResponseContent(Lorg/eclipse/jetty/io/Buffer;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onResponseHeader(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingResponses:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_listener:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 6
    .line 7
    invoke-interface {p0, p1, p2}, Lorg/eclipse/jetty/client/HttpEventListener;->onResponseHeader(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onResponseHeaderComplete()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingResponses:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_listener:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 6
    .line 7
    invoke-interface {p0}, Lorg/eclipse/jetty/client/HttpEventListener;->onResponseHeaderComplete()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onResponseStatus(Lorg/eclipse/jetty/io/Buffer;ILorg/eclipse/jetty/io/Buffer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingResponses:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_listener:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 6
    .line 7
    invoke-interface {p0, p1, p2, p3}, Lorg/eclipse/jetty/client/HttpEventListener;->onResponseStatus(Lorg/eclipse/jetty/io/Buffer;ILorg/eclipse/jetty/io/Buffer;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_version:Lorg/eclipse/jetty/io/Buffer;

    .line 12
    .line 13
    iput p2, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_status:I

    .line 14
    .line 15
    iput-object p3, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_reason:Lorg/eclipse/jetty/io/Buffer;

    .line 16
    .line 17
    return-void
.end method

.method public onRetry()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingRequests:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_listener:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 6
    .line 7
    invoke-interface {p0}, Lorg/eclipse/jetty/client/HttpEventListener;->onRetry()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setDelegatingRequests(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingRequests:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDelegatingResponses(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegatingResponses:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDelegationResult(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_delegationResult:Z

    .line 2
    .line 3
    return-void
.end method

.method public setEventListener(Lorg/eclipse/jetty/client/HttpEventListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->_listener:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 2
    .line 3
    return-void
.end method
