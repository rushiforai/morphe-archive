.class public final synthetic Ll/xmm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hnm0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;


# direct methods
.method public synthetic constructor <init>(Ll/hnm0;Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xmm0;->a:Ll/hnm0;

    iput-object p2, p0, Ll/xmm0;->b:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xmm0;->a:Ll/hnm0;

    iget-object p0, p0, Ll/xmm0;->b:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    invoke-static {v0, p0, p1}, Ll/hnm0;->J3(Ll/hnm0;Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    return-void
.end method
