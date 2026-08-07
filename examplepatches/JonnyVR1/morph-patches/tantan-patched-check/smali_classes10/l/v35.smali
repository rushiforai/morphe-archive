.class public final Ll/v35;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/settleList/view/CheckInUserItemView;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0002\n\u0002\u0008\r\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u001f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0008\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0017\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\r\u001a\u00020\u0002H\u0014\u00a2\u0006\u0004\u0008\u000f\u0010\u0010R\u0017\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0011\u0010\u0012\u001a\u0004\u0008\u0013\u0010\u000cR\u0017\u0010\u0006\u001a\u00020\u00058\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0014\u0010\u0015\u001a\u0004\u0008\u0016\u0010\u0017R\u0017\u0010\u0008\u001a\u00020\u00078\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0018\u0010\u0019\u001a\u0004\u0008\u0012\u0010\u001a\u00a8\u0006\u001b"
    }
    d2 = {
        "Ll/v35;",
        "Ll/d3q;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/settleList/view/CheckInUserItemView;",
        "",
        "index",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;",
        "user",
        "Ll/wgp0;",
        "listener",
        "<init>",
        "(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;Ll/wgp0;)V",
        "o",
        "()I",
        "itemView",
        "",
        "K",
        "(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/settleList/view/CheckInUserItemView;)V",
        "a",
        "I",
        "H",
        "b",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;",
        "J",
        "()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;",
        "c",
        "Ll/wgp0;",
        "()Ll/wgp0;",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:I

.field public final b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final c:Ll/wgp0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;Ll/wgp0;)V
    .locals 0
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/wgp0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 8
    .line 9
    .line 10
    iput p1, p0, Ll/v35;->a:I

    .line 11
    .line 12
    iput-object p2, p0, Ll/v35;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;

    .line 13
    .line 14
    iput-object p3, p0, Ll/v35;->c:Ll/wgp0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final H()I
    .locals 0

    .line 1
    iget p0, p0, Ll/v35;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public final I()Ll/wgp0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/v35;->c:Ll/wgp0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final J()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/v35;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;

    .line 2
    .line 3
    return-object p0
.end method

.method public K(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/settleList/view/CheckInUserItemView;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/settleList/view/CheckInUserItemView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/settleList/view/CheckInUserItemView;->v(Ll/v35;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->db:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/settleList/view/CheckInUserItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v35;->K(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/settleList/view/CheckInUserItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
