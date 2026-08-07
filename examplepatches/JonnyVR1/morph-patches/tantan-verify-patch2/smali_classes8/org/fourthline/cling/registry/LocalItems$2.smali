.class Lorg/fourthline/cling/registry/LocalItems$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/registry/LocalItems;->remove(Lorg/fourthline/cling/model/meta/LocalDevice;Z)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/registry/LocalItems;

.field final synthetic val$incomingSubscription:Lorg/fourthline/cling/registry/RegistryItem;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/registry/LocalItems;Lorg/fourthline/cling/registry/RegistryItem;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/registry/LocalItems$2;->this$0:Lorg/fourthline/cling/registry/LocalItems;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/fourthline/cling/registry/LocalItems$2;->val$incomingSubscription:Lorg/fourthline/cling/registry/RegistryItem;

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
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/registry/LocalItems$2;->val$incomingSubscription:Lorg/fourthline/cling/registry/RegistryItem;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/fourthline/cling/registry/RegistryItem;->getItem()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/model/gena/LocalGENASubscription;

    .line 8
    .line 9
    sget-object v0, Lorg/fourthline/cling/model/gena/CancelReason;->DEVICE_WAS_REMOVED:Lorg/fourthline/cling/model/gena/CancelReason;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/model/gena/LocalGENASubscription;->end(Lorg/fourthline/cling/model/gena/CancelReason;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
