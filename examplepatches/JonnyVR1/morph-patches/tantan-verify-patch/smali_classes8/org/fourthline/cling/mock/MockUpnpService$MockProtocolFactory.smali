.class public Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory;
.super Lorg/fourthline/cling/protocol/ProtocolFactoryImpl;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/fourthline/cling/mock/MockUpnpService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MockProtocolFactory"
.end annotation


# instance fields
.field private sendsAlive:Z


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/UpnpService;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lorg/fourthline/cling/protocol/ProtocolFactoryImpl;-><init>(Lorg/fourthline/cling/UpnpService;)V

    .line 2
    .line 3
    .line 4
    iput-boolean p2, p0, Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory;->sendsAlive:Z

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic access$000(Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory;->sendsAlive:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public createSendingNotificationAlive(Lorg/fourthline/cling/model/meta/LocalDevice;)Lorg/fourthline/cling/protocol/async/SendingNotificationAlive;
    .locals 2

    .line 1
    new-instance v0, Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory$1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/fourthline/cling/protocol/ProtocolFactoryImpl;->getUpnpService()Lorg/fourthline/cling/UpnpService;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, p0, v1, p1}, Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory$1;-><init>(Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory;Lorg/fourthline/cling/UpnpService;Lorg/fourthline/cling/model/meta/LocalDevice;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public createSendingSearch(Lorg/fourthline/cling/model/message/header/UpnpHeader;I)Lorg/fourthline/cling/protocol/async/SendingSearch;
    .locals 2

    .line 1
    new-instance v0, Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory$2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/fourthline/cling/protocol/ProtocolFactoryImpl;->getUpnpService()Lorg/fourthline/cling/UpnpService;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, p0, v1, p1, p2}, Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory$2;-><init>(Lorg/fourthline/cling/mock/MockUpnpService$MockProtocolFactory;Lorg/fourthline/cling/UpnpService;Lorg/fourthline/cling/model/message/header/UpnpHeader;I)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method
