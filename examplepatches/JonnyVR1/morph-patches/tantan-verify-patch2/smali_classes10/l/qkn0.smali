.class public final synthetic Ll/qkn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qkn0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;

    iput-object p2, p0, Ll/qkn0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qkn0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;

    iget-object p0, p0, Ll/qkn0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;Landroid/view/View;)V

    return-void
.end method
