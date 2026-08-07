.class public final synthetic Ll/lan0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lan0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lan0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseView;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseView;->i0(Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseView;Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;I)V

    return-void
.end method
