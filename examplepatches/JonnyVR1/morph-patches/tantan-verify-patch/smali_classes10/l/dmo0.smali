.class public final synthetic Ll/dmo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zmo0;


# direct methods
.method public synthetic constructor <init>(Ll/zmo0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dmo0;->a:Ll/zmo0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dmo0;->a:Ll/zmo0;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceSwitchLiveMode$VoiceLiveModeMessage;

    invoke-static {p0, p1}, Ll/zmo0;->q(Ll/zmo0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceSwitchLiveMode$VoiceLiveModeMessage;)V

    return-void
.end method
