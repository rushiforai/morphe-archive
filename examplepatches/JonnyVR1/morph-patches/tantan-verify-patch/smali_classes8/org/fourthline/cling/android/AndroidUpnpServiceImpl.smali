.class public Lorg/fourthline/cling/android/AndroidUpnpServiceImpl;
.super Landroid/app/Service;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/fourthline/cling/android/AndroidUpnpServiceImpl$Binder;
    }
.end annotation


# instance fields
.field protected binder:Lorg/fourthline/cling/android/AndroidUpnpServiceImpl$Binder;

.field protected upnpService:Lorg/fourthline/cling/UpnpService;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/fourthline/cling/android/AndroidUpnpServiceImpl$Binder;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lorg/fourthline/cling/android/AndroidUpnpServiceImpl$Binder;-><init>(Lorg/fourthline/cling/android/AndroidUpnpServiceImpl;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/fourthline/cling/android/AndroidUpnpServiceImpl;->binder:Lorg/fourthline/cling/android/AndroidUpnpServiceImpl$Binder;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public createConfiguration()Lorg/fourthline/cling/UpnpServiceConfiguration;
    .locals 0

    .line 1
    new-instance p0, Lorg/fourthline/cling/android/AndroidUpnpServiceConfiguration;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/fourthline/cling/android/AndroidUpnpServiceConfiguration;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public createRouter(Lorg/fourthline/cling/UpnpServiceConfiguration;Lorg/fourthline/cling/protocol/ProtocolFactory;Landroid/content/Context;)Lorg/fourthline/cling/android/AndroidRouter;
    .locals 0

    .line 1
    new-instance p0, Lorg/fourthline/cling/android/AndroidRouter;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, p3}, Lorg/fourthline/cling/android/AndroidRouter;-><init>(Lorg/fourthline/cling/UpnpServiceConfiguration;Lorg/fourthline/cling/protocol/ProtocolFactory;Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/android/AndroidUpnpServiceImpl;->binder:Lorg/fourthline/cling/android/AndroidUpnpServiceImpl$Binder;

    .line 2
    .line 3
    return-object p0
.end method

.method public onCreate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/fourthline/cling/android/AndroidUpnpServiceImpl$1;

    .line 5
    .line 6
    invoke-virtual {p0}, Lorg/fourthline/cling/android/AndroidUpnpServiceImpl;->createConfiguration()Lorg/fourthline/cling/UpnpServiceConfiguration;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const/4 v2, 0x0

    .line 11
    new-array v2, v2, [Lorg/fourthline/cling/registry/RegistryListener;

    .line 12
    .line 13
    invoke-direct {v0, p0, v1, v2}, Lorg/fourthline/cling/android/AndroidUpnpServiceImpl$1;-><init>(Lorg/fourthline/cling/android/AndroidUpnpServiceImpl;Lorg/fourthline/cling/UpnpServiceConfiguration;[Lorg/fourthline/cling/registry/RegistryListener;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lorg/fourthline/cling/android/AndroidUpnpServiceImpl;->upnpService:Lorg/fourthline/cling/UpnpService;

    .line 17
    .line 18
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/android/AndroidUpnpServiceImpl;->upnpService:Lorg/fourthline/cling/UpnpService;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/fourthline/cling/UpnpService;->shutdown()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
