.class Lorg/fourthline/cling/protocol/sync/SendingRenewal$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/protocol/sync/SendingRenewal;->executeSync()Lorg/fourthline/cling/model/message/gena/IncomingSubscribeResponseMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/protocol/sync/SendingRenewal;

.field final synthetic val$responseMessage:Lorg/fourthline/cling/model/message/gena/IncomingSubscribeResponseMessage;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/protocol/sync/SendingRenewal;Lorg/fourthline/cling/model/message/gena/IncomingSubscribeResponseMessage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/protocol/sync/SendingRenewal$1;->this$0:Lorg/fourthline/cling/protocol/sync/SendingRenewal;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/fourthline/cling/protocol/sync/SendingRenewal$1;->val$responseMessage:Lorg/fourthline/cling/model/message/gena/IncomingSubscribeResponseMessage;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/protocol/sync/SendingRenewal$1;->this$0:Lorg/fourthline/cling/protocol/sync/SendingRenewal;

    .line 2
    .line 3
    iget-object v0, v0, Lorg/fourthline/cling/protocol/sync/SendingRenewal;->subscription:Lorg/fourthline/cling/model/gena/RemoteGENASubscription;

    .line 4
    .line 5
    sget-object v1, Lorg/fourthline/cling/model/gena/CancelReason;->RENEWAL_FAILED:Lorg/fourthline/cling/model/gena/CancelReason;

    .line 6
    .line 7
    iget-object p0, p0, Lorg/fourthline/cling/protocol/sync/SendingRenewal$1;->val$responseMessage:Lorg/fourthline/cling/model/message/gena/IncomingSubscribeResponseMessage;

    .line 8
    .line 9
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/UpnpMessage;->getOperation()Lorg/fourthline/cling/model/message/UpnpOperation;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lorg/fourthline/cling/model/message/UpnpResponse;

    .line 14
    .line 15
    invoke-virtual {v0, v1, p0}, Lorg/fourthline/cling/model/gena/RemoteGENASubscription;->end(Lorg/fourthline/cling/model/gena/CancelReason;Lorg/fourthline/cling/model/message/UpnpResponse;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
