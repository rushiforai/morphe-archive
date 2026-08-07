.class public Lorg/fourthline/cling/Main;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance p0, Lorg/fourthline/cling/Main$1;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/fourthline/cling/Main$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 7
    .line 8
    const-string v1, "Starting Cling..."

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Lorg/fourthline/cling/UpnpServiceImpl;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    new-array v1, v1, [Lorg/fourthline/cling/registry/RegistryListener;

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    aput-object p0, v1, v2

    .line 20
    .line 21
    invoke-direct {v0, v1}, Lorg/fourthline/cling/UpnpServiceImpl;-><init>([Lorg/fourthline/cling/registry/RegistryListener;)V

    .line 22
    .line 23
    .line 24
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 25
    .line 26
    const-string v1, "Sending SEARCH message to all devices..."

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {v0}, Lorg/fourthline/cling/UpnpService;->getControlPoint()Lorg/fourthline/cling/controlpoint/ControlPoint;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    new-instance v1, Lorg/fourthline/cling/model/message/header/STAllHeader;

    .line 36
    .line 37
    invoke-direct {v1}, Lorg/fourthline/cling/model/message/header/STAllHeader;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-interface {p0, v1}, Lorg/fourthline/cling/controlpoint/ControlPoint;->search(Lorg/fourthline/cling/model/message/header/UpnpHeader;)V

    .line 41
    .line 42
    .line 43
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 44
    .line 45
    const-string v1, "Waiting 10 seconds before shutting down..."

    .line 46
    .line 47
    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const-wide/16 v1, 0x2710

    .line 51
    .line 52
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    .line 53
    .line 54
    .line 55
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 56
    .line 57
    const-string v1, "Stopping Cling..."

    .line 58
    .line 59
    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-interface {v0}, Lorg/fourthline/cling/UpnpService;->shutdown()V

    .line 63
    .line 64
    .line 65
    return-void
.end method
