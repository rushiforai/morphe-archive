.class public final synthetic Ll/ljo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ljo0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;

    iput-object p2, p0, Ll/ljo0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ljo0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;

    iget-object p0, p0, Ll/ljo0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->v(Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;Landroid/view/View;)V

    return-void
.end method
