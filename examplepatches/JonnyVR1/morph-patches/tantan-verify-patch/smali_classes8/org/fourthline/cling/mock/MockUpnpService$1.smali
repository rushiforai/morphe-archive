.class Lorg/fourthline/cling/mock/MockUpnpService$1;
.super Lorg/fourthline/cling/registry/RegistryImpl;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/mock/MockUpnpService;-><init>(ZLorg/fourthline/cling/mock/MockUpnpServiceConfiguration;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/mock/MockUpnpService;

.field final synthetic val$configuration:Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/mock/MockUpnpService;Lorg/fourthline/cling/UpnpService;Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/mock/MockUpnpService$1;->this$0:Lorg/fourthline/cling/mock/MockUpnpService;

    .line 2
    .line 3
    iput-object p3, p0, Lorg/fourthline/cling/mock/MockUpnpService$1;->val$configuration:Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Lorg/fourthline/cling/registry/RegistryImpl;-><init>(Lorg/fourthline/cling/UpnpService;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public createRegistryMaintainer()Lorg/fourthline/cling/registry/RegistryMaintainer;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/mock/MockUpnpService$1;->val$configuration:Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/fourthline/cling/mock/MockUpnpServiceConfiguration;->isMaintainsRegistry()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0}, Lorg/fourthline/cling/registry/RegistryImpl;->createRegistryMaintainer()Lorg/fourthline/cling/registry/RegistryMaintainer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method
