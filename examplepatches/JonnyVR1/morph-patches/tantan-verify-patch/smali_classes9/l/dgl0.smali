.class public final synthetic Ll/dgl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ggl0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLive;


# direct methods
.method public synthetic constructor <init>(Ll/ggl0;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dgl0;->a:Ll/ggl0;

    iput-object p2, p0, Ll/dgl0;->b:Lcom/p1/mobile/putong/live/base/data/BLive;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dgl0;->a:Ll/ggl0;

    iget-object p0, p0, Ll/dgl0;->b:Lcom/p1/mobile/putong/live/base/data/BLive;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;

    invoke-static {v0, p0, p1}, Ll/ggl0;->L3(Ll/ggl0;Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method
