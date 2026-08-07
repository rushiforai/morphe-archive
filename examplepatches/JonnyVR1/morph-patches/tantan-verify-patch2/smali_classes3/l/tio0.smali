.class public final synthetic Ll/tio0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/floatview/VoicePreviewFlowItemView;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/floatview/VoicePreviewFlowItemView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tio0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;

    iput-object p2, p0, Ll/tio0;->b:Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/floatview/VoicePreviewFlowItemView;

    iput-object p3, p0, Ll/tio0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tio0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;

    iget-object v1, p0, Ll/tio0;->b:Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/floatview/VoicePreviewFlowItemView;

    iget-object p0, p0, Ll/tio0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->i(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/floatview/VoicePreviewFlowItemView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;Landroid/view/View;)V

    return-void
.end method
