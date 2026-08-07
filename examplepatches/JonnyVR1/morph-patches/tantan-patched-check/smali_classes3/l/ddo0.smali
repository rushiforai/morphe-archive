.class public final synthetic Ll/ddo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ddo0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;

    iput-object p2, p0, Ll/ddo0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ddo0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;

    iget-object p0, p0, Ll/ddo0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;

    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;->b(Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationItemWebView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method
