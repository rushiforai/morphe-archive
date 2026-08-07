.class public final synthetic Ll/q0m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/u0m0;


# direct methods
.method public synthetic constructor <init>(Ll/u0m0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q0m0;->a:Ll/u0m0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0m0;->a:Ll/u0m0;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomPersonalUpdate;

    invoke-static {p0, p1}, Ll/u0m0;->L3(Ll/u0m0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomPersonalUpdate;)V

    return-void
.end method
