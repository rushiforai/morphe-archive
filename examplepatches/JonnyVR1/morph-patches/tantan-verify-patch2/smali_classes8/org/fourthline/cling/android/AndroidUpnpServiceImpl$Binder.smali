.class public Lorg/fourthline/cling/android/AndroidUpnpServiceImpl$Binder;
.super Landroid/os/Binder;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/android/AndroidUpnpService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/fourthline/cling/android/AndroidUpnpServiceImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Binder"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/android/AndroidUpnpServiceImpl;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/android/AndroidUpnpServiceImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/android/AndroidUpnpServiceImpl$Binder;->this$0:Lorg/fourthline/cling/android/AndroidUpnpServiceImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public get()Lorg/fourthline/cling/UpnpService;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/android/AndroidUpnpServiceImpl$Binder;->this$0:Lorg/fourthline/cling/android/AndroidUpnpServiceImpl;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/fourthline/cling/android/AndroidUpnpServiceImpl;->upnpService:Lorg/fourthline/cling/UpnpService;

    .line 4
    .line 5
    return-object p0
.end method

.method public getConfiguration()Lorg/fourthline/cling/UpnpServiceConfiguration;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/android/AndroidUpnpServiceImpl$Binder;->this$0:Lorg/fourthline/cling/android/AndroidUpnpServiceImpl;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/fourthline/cling/android/AndroidUpnpServiceImpl;->upnpService:Lorg/fourthline/cling/UpnpService;

    .line 4
    .line 5
    invoke-interface {p0}, Lorg/fourthline/cling/UpnpService;->getConfiguration()Lorg/fourthline/cling/UpnpServiceConfiguration;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getControlPoint()Lorg/fourthline/cling/controlpoint/ControlPoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/android/AndroidUpnpServiceImpl$Binder;->this$0:Lorg/fourthline/cling/android/AndroidUpnpServiceImpl;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/fourthline/cling/android/AndroidUpnpServiceImpl;->upnpService:Lorg/fourthline/cling/UpnpService;

    .line 4
    .line 5
    invoke-interface {p0}, Lorg/fourthline/cling/UpnpService;->getControlPoint()Lorg/fourthline/cling/controlpoint/ControlPoint;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRegistry()Lorg/fourthline/cling/registry/Registry;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/android/AndroidUpnpServiceImpl$Binder;->this$0:Lorg/fourthline/cling/android/AndroidUpnpServiceImpl;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/fourthline/cling/android/AndroidUpnpServiceImpl;->upnpService:Lorg/fourthline/cling/UpnpService;

    .line 4
    .line 5
    invoke-interface {p0}, Lorg/fourthline/cling/UpnpService;->getRegistry()Lorg/fourthline/cling/registry/Registry;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
