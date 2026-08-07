.class public final synthetic Ll/epn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tpn0;


# direct methods
.method public synthetic constructor <init>(Ll/tpn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/epn0;->a:Ll/tpn0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/epn0;->a:Ll/tpn0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;

    invoke-static {p0, p1}, Ll/tpn0;->k3(Ll/tpn0;Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;)V

    return-void
.end method
