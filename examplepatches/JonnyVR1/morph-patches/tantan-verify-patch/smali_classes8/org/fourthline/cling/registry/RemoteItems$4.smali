.class Lorg/fourthline/cling/registry/RemoteItems$4;
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

.field final synthetic val$listener:Lorg/fourthline/cling/registry/RegistryListener;

.field final synthetic val$registeredDevice:Lorg/fourthline/cling/model/meta/RemoteDevice;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/registry/RemoteItems;Lorg/fourthline/cling/registry/RegistryListener;Lorg/fourthline/cling/model/meta/RemoteDevice;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/registry/RemoteItems$4;->this$0:Lorg/fourthline/cling/registry/RemoteItems;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/fourthline/cling/registry/RemoteItems$4;->val$listener:Lorg/fourthline/cling/registry/RegistryListener;

    .line 4
    .line 5
    iput-object p3, p0, Lorg/fourthline/cling/registry/RemoteItems$4;->val$registeredDevice:Lorg/fourthline/cling/model/meta/RemoteDevice;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/registry/RemoteItems$4;->val$listener:Lorg/fourthline/cling/registry/RegistryListener;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/fourthline/cling/registry/RemoteItems$4;->this$0:Lorg/fourthline/cling/registry/RemoteItems;

    .line 4
    .line 5
    iget-object v1, v1, Lorg/fourthline/cling/registry/RegistryItems;->registry:Lorg/fourthline/cling/registry/RegistryImpl;

    .line 6
    .line 7
    iget-object p0, p0, Lorg/fourthline/cling/registry/RemoteItems$4;->val$registeredDevice:Lorg/fourthline/cling/model/meta/RemoteDevice;

    .line 8
    .line 9
    invoke-interface {v0, v1, p0}, Lorg/fourthline/cling/registry/RegistryListener;->remoteDeviceRemoved(Lorg/fourthline/cling/registry/Registry;Lorg/fourthline/cling/model/meta/RemoteDevice;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
