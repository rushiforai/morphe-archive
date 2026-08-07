.class public final synthetic Ll/aqs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aqs;->a:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aqs;->a:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;

    invoke-static {p0, p1}, Ll/bqs;->M(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
