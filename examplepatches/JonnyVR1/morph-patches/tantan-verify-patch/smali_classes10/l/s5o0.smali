.class public final synthetic Ll/s5o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/t5o0;


# direct methods
.method public synthetic constructor <init>(Ll/t5o0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s5o0;->a:Ll/t5o0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s5o0;->a:Ll/t5o0;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceRoomAnnouncementUpdate;

    invoke-static {p0, p1}, Ll/t5o0;->K3(Ll/t5o0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceRoomAnnouncementUpdate;)V

    return-void
.end method
