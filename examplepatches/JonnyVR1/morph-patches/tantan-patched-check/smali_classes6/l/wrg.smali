.class public final synthetic Ll/wrg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/js/bridge/FeedBridgeImplementation;

.field public final synthetic b:Ll/aqq;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/js/bridge/FeedBridgeImplementation;Ll/aqq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wrg;->a:Lcom/p1/mobile/putong/feed/js/bridge/FeedBridgeImplementation;

    iput-object p2, p0, Ll/wrg;->b:Ll/aqq;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wrg;->a:Lcom/p1/mobile/putong/feed/js/bridge/FeedBridgeImplementation;

    iget-object p0, p0, Ll/wrg;->b:Ll/aqq;

    check-cast p1, Ll/pf60;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/js/bridge/FeedBridgeImplementation;->c(Lcom/p1/mobile/putong/feed/js/bridge/FeedBridgeImplementation;Ll/aqq;Ll/pf60;)V

    return-void
.end method
