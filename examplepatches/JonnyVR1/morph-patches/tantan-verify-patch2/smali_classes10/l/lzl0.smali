.class public final synthetic Ll/lzl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pzl0;


# direct methods
.method public synthetic constructor <init>(Ll/pzl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lzl0;->a:Ll/pzl0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lzl0;->a:Ll/pzl0;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceGameMessage;

    invoke-static {p0, p1}, Ll/pzl0;->w4(Ll/pzl0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceGameMessage;)V

    return-void
.end method
