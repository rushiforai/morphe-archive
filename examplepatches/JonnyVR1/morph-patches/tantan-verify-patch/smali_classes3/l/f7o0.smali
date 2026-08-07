.class public final synthetic Ll/f7o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f7o0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;

    iput-object p2, p0, Ll/f7o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f7o0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;

    iget-object p0, p0, Ll/f7o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->p(Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;Landroid/view/View;)V

    return-void
.end method
