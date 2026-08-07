.class public Ll/c1m0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualLevelRightItem;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomLevelRight;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomLevelRight;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/c1m0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomLevelRight;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualLevelRightItem;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/c1m0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomLevelRight;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualLevelRightItem;->i0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomLevelRight;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->Ya:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualLevelRightItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/c1m0;->H(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualLevelRightItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
