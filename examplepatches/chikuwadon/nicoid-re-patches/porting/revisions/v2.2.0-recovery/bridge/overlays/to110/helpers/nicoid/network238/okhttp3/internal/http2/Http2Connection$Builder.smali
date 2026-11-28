.class public final Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/http2/Http2Connection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0016\u0010\u000e\u001a\u00020\u00002\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u00102\u001a\u00020\u0015J\u000e\u0010\u001a\u001a\u00020\u00002\u0006\u0010\u001a\u001a\u00020\u001bJ\u000e\u0010 \u001a\u00020\u00002\u0006\u0010 \u001a\u00020!J\u000e\u0010&\u001a\u00020\u00002\u0006\u0010&\u001a\u00020\'J\u000e\u0010,\u001a\u00020\u00002\u0006\u0010,\u001a\u00020-J\u0006\u00103\u001a\u000204R\u001a\u0010\u0002\u001a\u00020\u0003X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0008\u0010\t\"\u0004\u0008\n\u0010\u000bR\u0014\u0010\u0004\u001a\u00020\u0005X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u001a\u0010\u000e\u001a\u00020\u000fX\u0080.\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011\"\u0004\u0008\u0012\u0010\u0013R\u001a\u0010\u0014\u001a\u00020\u0015X\u0080.\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0016\u0010\u0017\"\u0004\u0008\u0018\u0010\u0019R\u001a\u0010\u001a\u001a\u00020\u001bX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001c\u0010\u001d\"\u0004\u0008\u001e\u0010\u001fR\u001a\u0010 \u001a\u00020!X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\"\u0010#\"\u0004\u0008$\u0010%R\u001a\u0010&\u001a\u00020\'X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008(\u0010)\"\u0004\u0008*\u0010+R\u001a\u0010,\u001a\u00020-X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008.\u0010/\"\u0004\u00080\u00101\u00a8\u00065"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;",
        "",
        "client",
        "",
        "taskRunner",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "<init>",
        "(ZLnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)V",
        "getClient$okhttp",
        "()Z",
        "setClient$okhttp",
        "(Z)V",
        "getTaskRunner$okhttp",
        "()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "socket",
        "Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;",
        "getSocket$okhttp",
        "()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;",
        "setSocket$okhttp",
        "(Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;)V",
        "connectionName",
        "",
        "getConnectionName$okhttp",
        "()Ljava/lang/String;",
        "setConnectionName$okhttp",
        "(Ljava/lang/String;)V",
        "listener",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;",
        "getListener$okhttp",
        "()Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;",
        "setListener$okhttp",
        "(Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;)V",
        "pushObserver",
        "Lnicoid/network238/okhttp3/internal/http2/PushObserver;",
        "getPushObserver$okhttp",
        "()Lnicoid/network238/okhttp3/internal/http2/PushObserver;",
        "setPushObserver$okhttp",
        "(Lnicoid/network238/okhttp3/internal/http2/PushObserver;)V",
        "pingIntervalMillis",
        "",
        "getPingIntervalMillis$okhttp",
        "()I",
        "setPingIntervalMillis$okhttp",
        "(I)V",
        "flowControlListener",
        "Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;",
        "getFlowControlListener$okhttp",
        "()Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;",
        "setFlowControlListener$okhttp",
        "(Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;)V",
        "peerName",
        "build",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Connection;",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private client:Z

.field public connectionName:Ljava/lang/String;

.field private flowControlListener:Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;

.field private listener:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;

.field private pingIntervalMillis:I

.field private pushObserver:Lnicoid/network238/okhttp3/internal/http2/PushObserver;

.field public socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

.field private final taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;


# direct methods
.method public constructor <init>(ZLnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)V
    .registers 3

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 567
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 569
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->client:Z

    .line 570
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 574
    sget-object p1, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;->REFUSE_INCOMING_STREAMS:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->listener:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;

    .line 575
    sget-object p1, Lnicoid/network238/okhttp3/internal/http2/PushObserver;->CANCEL:Lnicoid/network238/okhttp3/internal/http2/PushObserver;

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->pushObserver:Lnicoid/network238/okhttp3/internal/http2/PushObserver;

    .line 577
    sget-object p1, Lnicoid/network238/okhttp3/internal/http2/FlowControlListener$None;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/FlowControlListener$None;

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->flowControlListener:Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;

    return-void
.end method


# virtual methods
.method public final build()Lnicoid/network238/okhttp3/internal/http2/Http2Connection;
    .registers 2

    .line 612
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    invoke-direct {v0, p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;-><init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;)V

    return-object v0
.end method

.method public final flowControlListener(Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;)Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 609
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->flowControlListener:Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;

    return-object p0
.end method

.method public final getClient$okhttp()Z
    .registers 2

    .line 569
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->client:Z

    return v0
.end method

.method public final getConnectionName$okhttp()Ljava/lang/String;
    .registers 2

    .line 573
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->connectionName:Ljava/lang/String;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    const-string v0, "connectionName"

    invoke-static {v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public final getFlowControlListener$okhttp()Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;
    .registers 2

    .line 577
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->flowControlListener:Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;

    return-object v0
.end method

.method public final getListener$okhttp()Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;
    .registers 2

    .line 574
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->listener:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;

    return-object v0
.end method

.method public final getPingIntervalMillis$okhttp()I
    .registers 2

    .line 576
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->pingIntervalMillis:I

    return v0
.end method

.method public final getPushObserver$okhttp()Lnicoid/network238/okhttp3/internal/http2/PushObserver;
    .registers 2

    .line 575
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->pushObserver:Lnicoid/network238/okhttp3/internal/http2/PushObserver;

    return-object v0
.end method

.method public final getSocket$okhttp()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;
    .registers 2

    .line 572
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    const-string v0, "socket"

    invoke-static {v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public final getTaskRunner$okhttp()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;
    .registers 2

    .line 570
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    return-object v0
.end method

.method public final listener(Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;)Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 594
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->listener:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;

    return-object p0
.end method

.method public final pingIntervalMillis(I)Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;
    .registers 2

    .line 604
    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->pingIntervalMillis:I

    return-object p0
.end method

.method public final pushObserver(Lnicoid/network238/okhttp3/internal/http2/PushObserver;)Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 599
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->pushObserver:Lnicoid/network238/okhttp3/internal/http2/PushObserver;

    return-object p0
.end method

.method public final setClient$okhttp(Z)V
    .registers 2

    .line 569
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->client:Z

    return-void
.end method

.method public final setConnectionName$okhttp(Ljava/lang/String;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 573
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->connectionName:Ljava/lang/String;

    return-void
.end method

.method public final setFlowControlListener$okhttp(Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 577
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->flowControlListener:Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;

    return-void
.end method

.method public final setListener$okhttp(Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 574
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->listener:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;

    return-void
.end method

.method public final setPingIntervalMillis$okhttp(I)V
    .registers 2

    .line 576
    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->pingIntervalMillis:I

    return-void
.end method

.method public final setPushObserver$okhttp(Lnicoid/network238/okhttp3/internal/http2/PushObserver;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 575
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->pushObserver:Lnicoid/network238/okhttp3/internal/http2/PushObserver;

    return-void
.end method

.method public final setSocket$okhttp(Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 572
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    return-void
.end method

.method public final socket(Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;Ljava/lang/String;)Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 584
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->setSocket$okhttp(Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;)V

    .line 587
    iget-boolean p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->client:Z

    if-eqz p1, :cond_0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->okHttpName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const/16 v0, 0x20

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 588
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "MockWebServer "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 585
    :goto_0
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->setConnectionName$okhttp(Ljava/lang/String;)V

    return-object p0
.end method
