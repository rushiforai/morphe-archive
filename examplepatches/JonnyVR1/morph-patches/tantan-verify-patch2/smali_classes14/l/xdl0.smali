.class public Ll/xdl0;
.super Ll/lbl0;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public c:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lbl0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xdl0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 5
    .line 6
    iput-object p2, p0, Ll/xdl0;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/xdl0;->b:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/lbl0;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 5
    .line 6
    iget-object v1, p0, Ll/xdl0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 7
    .line 8
    iget-object v2, p0, Ll/xdl0;->a:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p0, p0, Ll/xdl0;->b:Ljava/lang/String;

    .line 11
    .line 12
    invoke-direct {v0, v1, v2, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->c2(Landroid/content/Context;Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    sget p0, Ll/q7c0;->e:I

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p1, p0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "VideoFakeChatActChecker"

    .line 2
    .line 3
    return-object p0
.end method
