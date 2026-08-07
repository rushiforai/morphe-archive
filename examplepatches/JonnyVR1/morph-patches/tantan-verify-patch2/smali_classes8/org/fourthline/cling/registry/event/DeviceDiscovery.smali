.class public Lorg/fourthline/cling/registry/event/DeviceDiscovery;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Lorg/fourthline/cling/model/meta/Device;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected device:Lorg/fourthline/cling/model/meta/Device;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TD;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/model/meta/Device;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TD;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/fourthline/cling/registry/event/DeviceDiscovery;->device:Lorg/fourthline/cling/model/meta/Device;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getDevice()Lorg/fourthline/cling/model/meta/Device;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TD;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/registry/event/DeviceDiscovery;->device:Lorg/fourthline/cling/model/meta/Device;

    .line 2
    .line 3
    return-object p0
.end method
