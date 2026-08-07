.class public final synthetic Ll/d4n0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/tantanapp/media/ttmediautils/download/Action1;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWallGift;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/media/ttmediautils/download/Action1;Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWallGift;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d4n0;->a:Lcom/tantanapp/media/ttmediautils/download/Action1;

    iput-object p2, p0, Ll/d4n0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWallGift;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d4n0;->a:Lcom/tantanapp/media/ttmediautils/download/Action1;

    iget-object p0, p0, Ll/d4n0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWallGift;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->c(Lcom/tantanapp/media/ttmediautils/download/Action1;Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWallGift;Landroid/view/View;)V

    return-void
.end method
