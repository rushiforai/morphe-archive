.class public final synthetic Ll/cym0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/kym0;


# direct methods
.method public synthetic constructor <init>(Ll/kym0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cym0;->a:Ll/kym0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cym0;->a:Ll/kym0;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceStreamBizTypeMessage;

    invoke-static {p0, p1}, Ll/kym0;->N3(Ll/kym0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceStreamBizTypeMessage;)V

    return-void
.end method
