.class public final synthetic Ll/lju;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lju;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lju;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->c2(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;)V

    return-void
.end method
