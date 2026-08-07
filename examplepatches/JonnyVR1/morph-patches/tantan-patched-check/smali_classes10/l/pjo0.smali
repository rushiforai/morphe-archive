.class public final synthetic Ll/pjo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pjo0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;

    iput-object p2, p0, Ll/pjo0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pjo0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;

    iget-object p0, p0, Ll/pjo0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->s(Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;Ljava/lang/Long;)V

    return-void
.end method
