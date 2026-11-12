.class public final Lzmk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;


# instance fields
.field public final synthetic a:Lcnk;


# direct methods
.method public constructor <init>(Lcnk;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lzmk;->a:Lcnk;

    return-void
.end method


# virtual methods
.method public final onConnectionTypeChanged(I)V
    .registers 4

    const/4 v0, 0x6

    if-eq p1, v0, :cond_21

    invoke-static {p0}, Lorg/chromium/net/NetworkChangeNotifier;->removeConnectionTypeObserver(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V

    iget-object p0, p0, Lzmk;->a:Lcnk;

    iget-object p1, p0, Lcnk;->b:Lumi;

    new-instance v0, Lymk;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lymk;-><init>(Lcnk;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lscl;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lscl;-><init>(Lesk;B)V

    invoke-virtual {p1, p0}, Lumi;->g(Ln5o;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    :cond_21
    return-void
.end method
