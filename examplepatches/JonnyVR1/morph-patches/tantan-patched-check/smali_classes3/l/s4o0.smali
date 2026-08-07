.class public final synthetic Ll/s4o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/t4o0;


# direct methods
.method public synthetic constructor <init>(Ll/t4o0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s4o0;->a:Ll/t4o0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s4o0;->a:Ll/t4o0;

    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomBgPicUpdateMessage;

    invoke-static {p0, p1}, Ll/t4o0;->J3(Ll/t4o0;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomBgPicUpdateMessage;)V

    return-void
.end method
