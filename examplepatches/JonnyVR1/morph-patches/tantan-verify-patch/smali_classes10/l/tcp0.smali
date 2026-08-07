.class public final synthetic Ll/tcp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ndp0;


# direct methods
.method public synthetic constructor <init>(Ll/ndp0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tcp0;->a:Ll/ndp0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tcp0;->a:Ll/ndp0;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveLovePlanetUpdate;

    invoke-static {p0, p1}, Ll/ndp0;->L3(Ll/ndp0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveLovePlanetUpdate;)V

    return-void
.end method
