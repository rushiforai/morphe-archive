.class public final synthetic Ll/iln0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iln0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iln0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;

    invoke-static {p0, p1}, Ll/jln0;->B(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;)V

    return-void
.end method
