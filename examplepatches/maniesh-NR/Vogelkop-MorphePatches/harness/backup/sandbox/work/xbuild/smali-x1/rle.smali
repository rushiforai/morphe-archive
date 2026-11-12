.class public final Lrle;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;


# direct methods
.method public constructor <init>(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrle;->a:Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;

    invoke-static {p1}, Lorg/chromium/net/NetworkChangeNotifier;->addConnectionTypeObserver(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V

    return-void
.end method
