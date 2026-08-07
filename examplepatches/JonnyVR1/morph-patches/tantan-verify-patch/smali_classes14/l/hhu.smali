.class public final synthetic Ll/hhu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hhu;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;

    iput-object p2, p0, Ll/hhu;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hhu;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;

    iget-object p0, p0, Ll/hhu;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->b(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    return-void
.end method
