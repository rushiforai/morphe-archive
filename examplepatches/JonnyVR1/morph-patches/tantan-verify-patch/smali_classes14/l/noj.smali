.class public final synthetic Ll/noj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/noj;->a:Ljava/util/List;

    iput-object p2, p0, Ll/noj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;

    iput-object p3, p0, Ll/noj;->c:Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/noj;->a:Ljava/util/List;

    iget-object v1, p0, Ll/noj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;

    iget-object p0, p0, Ll/noj;->c:Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    invoke-static {v0, v1, p0, p1}, Ll/dpj;->f(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;)V

    return-void
.end method
