.class public Lorg/fourthline/cling/mock/MockProtocolFactory;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/protocol/ProtocolFactory;


# annotations
.annotation runtime Ljavax/enterprise/inject/Alternative;
.end annotation


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


# virtual methods
.method public createReceivingAsync(Lorg/fourthline/cling/model/message/IncomingDatagramMessage;)Lorg/fourthline/cling/protocol/ReceivingAsync;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/fourthline/cling/protocol/ProtocolCreationException;
        }
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public createReceivingSync(Lorg/fourthline/cling/model/message/StreamRequestMessage;)Lorg/fourthline/cling/protocol/ReceivingSync;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/fourthline/cling/protocol/ProtocolCreationException;
        }
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public createSendingAction(Lorg/fourthline/cling/model/action/ActionInvocation;Ljava/net/URL;)Lorg/fourthline/cling/protocol/sync/SendingAction;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public createSendingEvent(Lorg/fourthline/cling/model/gena/LocalGENASubscription;)Lorg/fourthline/cling/protocol/sync/SendingEvent;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public createSendingNotificationAlive(Lorg/fourthline/cling/model/meta/LocalDevice;)Lorg/fourthline/cling/protocol/async/SendingNotificationAlive;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public createSendingNotificationByebye(Lorg/fourthline/cling/model/meta/LocalDevice;)Lorg/fourthline/cling/protocol/async/SendingNotificationByebye;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public createSendingRenewal(Lorg/fourthline/cling/model/gena/RemoteGENASubscription;)Lorg/fourthline/cling/protocol/sync/SendingRenewal;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public createSendingSearch(Lorg/fourthline/cling/model/message/header/UpnpHeader;I)Lorg/fourthline/cling/protocol/async/SendingSearch;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public createSendingSubscribe(Lorg/fourthline/cling/model/gena/RemoteGENASubscription;)Lorg/fourthline/cling/protocol/sync/SendingSubscribe;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public createSendingUnsubscribe(Lorg/fourthline/cling/model/gena/RemoteGENASubscription;)Lorg/fourthline/cling/protocol/sync/SendingUnsubscribe;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getUpnpService()Lorg/fourthline/cling/UpnpService;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method
