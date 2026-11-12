.class public abstract Lsle;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)Lrle;
    .registers 2

    invoke-static {}, Lsle;->b()V

    new-instance v0, Lrle;

    invoke-direct {v0, p0}, Lrle;-><init>(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V

    return-object v0
.end method

.method public static b()V
    .registers 1

    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_d

    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->init()Lorg/chromium/net/NetworkChangeNotifier;

    const/4 v0, 0x1

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifier;->setAutoDetectConnectivityState(Z)V

    :cond_d
    return-void
.end method

.method public static c()I
    .registers 1

    invoke-static {}, Lsle;->b()V

    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->getInstance()Lorg/chromium/net/NetworkChangeNotifier;

    move-result-object v0

    invoke-virtual {v0}, Lorg/chromium/net/NetworkChangeNotifier;->getCurrentConnectionType()I

    move-result v0

    return v0
.end method

.method public static d()Z
    .registers 1

    invoke-static {}, Lsle;->b()V

    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->isOnline()Z

    move-result v0

    return v0
.end method
