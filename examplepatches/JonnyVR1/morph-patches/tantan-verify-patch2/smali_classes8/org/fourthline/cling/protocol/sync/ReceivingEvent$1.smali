.class Lorg/fourthline/cling/protocol/sync/ReceivingEvent$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/protocol/sync/ReceivingEvent;->executeSync()Lorg/fourthline/cling/model/message/gena/OutgoingEventResponseMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/protocol/sync/ReceivingEvent;

.field final synthetic val$ex:Lorg/fourthline/cling/model/UnsupportedDataException;

.field final synthetic val$subscription:Lorg/fourthline/cling/model/gena/RemoteGENASubscription;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/protocol/sync/ReceivingEvent;Lorg/fourthline/cling/model/gena/RemoteGENASubscription;Lorg/fourthline/cling/model/UnsupportedDataException;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/protocol/sync/ReceivingEvent$1;->this$0:Lorg/fourthline/cling/protocol/sync/ReceivingEvent;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/fourthline/cling/protocol/sync/ReceivingEvent$1;->val$subscription:Lorg/fourthline/cling/model/gena/RemoteGENASubscription;

    .line 4
    .line 5
    iput-object p3, p0, Lorg/fourthline/cling/protocol/sync/ReceivingEvent$1;->val$ex:Lorg/fourthline/cling/model/UnsupportedDataException;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/protocol/sync/ReceivingEvent$1;->val$subscription:Lorg/fourthline/cling/model/gena/RemoteGENASubscription;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/fourthline/cling/protocol/sync/ReceivingEvent$1;->val$ex:Lorg/fourthline/cling/model/UnsupportedDataException;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/fourthline/cling/model/gena/RemoteGENASubscription;->invalidMessage(Lorg/fourthline/cling/model/UnsupportedDataException;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
