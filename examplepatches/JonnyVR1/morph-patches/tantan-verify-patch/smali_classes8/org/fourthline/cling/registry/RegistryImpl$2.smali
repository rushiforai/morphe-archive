.class Lorg/fourthline/cling/registry/RegistryImpl$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/registry/RegistryImpl;->notifyDiscoveryFailure(Lorg/fourthline/cling/model/meta/RemoteDevice;Ljava/lang/Exception;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/registry/RegistryImpl;

.field final synthetic val$device:Lorg/fourthline/cling/model/meta/RemoteDevice;

.field final synthetic val$ex:Ljava/lang/Exception;

.field final synthetic val$listener:Lorg/fourthline/cling/registry/RegistryListener;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/registry/RegistryImpl;Lorg/fourthline/cling/registry/RegistryListener;Lorg/fourthline/cling/model/meta/RemoteDevice;Ljava/lang/Exception;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/registry/RegistryImpl$2;->this$0:Lorg/fourthline/cling/registry/RegistryImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/fourthline/cling/registry/RegistryImpl$2;->val$listener:Lorg/fourthline/cling/registry/RegistryListener;

    .line 4
    .line 5
    iput-object p3, p0, Lorg/fourthline/cling/registry/RegistryImpl$2;->val$device:Lorg/fourthline/cling/model/meta/RemoteDevice;

    .line 6
    .line 7
    iput-object p4, p0, Lorg/fourthline/cling/registry/RegistryImpl$2;->val$ex:Ljava/lang/Exception;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/registry/RegistryImpl$2;->val$listener:Lorg/fourthline/cling/registry/RegistryListener;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/fourthline/cling/registry/RegistryImpl$2;->this$0:Lorg/fourthline/cling/registry/RegistryImpl;

    .line 4
    .line 5
    iget-object v2, p0, Lorg/fourthline/cling/registry/RegistryImpl$2;->val$device:Lorg/fourthline/cling/model/meta/RemoteDevice;

    .line 6
    .line 7
    iget-object p0, p0, Lorg/fourthline/cling/registry/RegistryImpl$2;->val$ex:Ljava/lang/Exception;

    .line 8
    .line 9
    invoke-interface {v0, v1, v2, p0}, Lorg/fourthline/cling/registry/RegistryListener;->remoteDeviceDiscoveryFailed(Lorg/fourthline/cling/registry/Registry;Lorg/fourthline/cling/model/meta/RemoteDevice;Ljava/lang/Exception;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
