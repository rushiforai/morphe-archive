.class public final synthetic Ll/xep0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xep0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xep0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomLevelUp;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->I0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomLevelUp;)V

    return-void
.end method
