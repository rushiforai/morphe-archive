.class public final synthetic Ll/dd1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dd1;->a:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dd1;->a:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    invoke-static {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->a(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)V

    return-void
.end method
