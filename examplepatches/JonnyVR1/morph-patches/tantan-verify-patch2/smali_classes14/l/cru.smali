.class public final synthetic Ll/cru;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gru;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;


# direct methods
.method public synthetic constructor <init>(Ll/gru;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cru;->a:Ll/gru;

    iput-object p2, p0, Ll/cru;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cru;->a:Ll/gru;

    iget-object p0, p0, Ll/cru;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;

    invoke-static {v0, p0, p1}, Ll/gru;->V2(Ll/gru;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method
