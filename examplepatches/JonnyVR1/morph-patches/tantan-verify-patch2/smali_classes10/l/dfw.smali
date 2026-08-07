.class public final synthetic Ll/dfw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLovePlanetUser;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLovePlanetUser;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dfw;->a:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLovePlanetUser;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dfw;->a:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLovePlanetUser;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    invoke-static {p0, p1}, Ll/hfw;->j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLovePlanetUser;Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
