.class public final synthetic Ll/foj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/foj;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;

    iput-object p2, p0, Ll/foj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;

    iput-object p3, p0, Ll/foj;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/foj;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;

    iget-object v1, p0, Ll/foj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;

    iget-object p0, p0, Ll/foj;->c:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftTabEntrance;

    invoke-static {v0, v1, p0, p1}, Ll/cpj;->a(Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveGiftTabEntrance;)V

    return-void
.end method
