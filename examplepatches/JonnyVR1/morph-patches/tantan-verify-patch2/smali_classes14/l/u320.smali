.class public final synthetic Ll/u320;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u320;->a:Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;

    iput-object p2, p0, Ll/u320;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u320;->a:Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;

    iget-object p0, p0, Ll/u320;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;->a(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInExpandedCard;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;Landroid/view/View;)V

    return-void
.end method
