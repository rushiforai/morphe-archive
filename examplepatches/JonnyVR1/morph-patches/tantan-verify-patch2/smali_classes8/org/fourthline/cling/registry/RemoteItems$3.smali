.class Lorg/fourthline/cling/registry/RemoteItems$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/registry/RemoteItems;->remove(Lorg/fourthline/cling/model/meta/RemoteDevice;Z)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/registry/RemoteItems;

.field final synthetic val$outgoingSubscription:Lorg/fourthline/cling/registry/RegistryItem;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/registry/RemoteItems;Lorg/fourthline/cling/registry/RegistryItem;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/registry/RemoteItems$3;->this$0:Lorg/fourthline/cling/registry/RemoteItems;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/fourthline/cling/registry/RemoteItems$3;->val$outgoingSubscription:Lorg/fourthline/cling/registry/RegistryItem;

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
    iget-object p0, p0, Lorg/fourthline/cling/registry/RemoteItems$3;->val$outgoingSubscription:Lorg/fourthline/cling/registry/RegistryItem;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/fourthline/cling/registry/RegistryItem;->getItem()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/model/gena/RemoteGENASubscription;

    .line 8
    .line 9
    sget-object v0, Lorg/fourthline/cling/model/gena/CancelReason;->DEVICE_WAS_REMOVED:Lorg/fourthline/cling/model/gena/CancelReason;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v0, v1}, Lorg/fourthline/cling/model/gena/RemoteGENASubscription;->end(Lorg/fourthline/cling/model/gena/CancelReason;Lorg/fourthline/cling/model/message/UpnpResponse;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
