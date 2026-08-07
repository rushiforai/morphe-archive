.class public final synthetic Ll/ayo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/kyo0;

.field public final synthetic b:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/kyo0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ayo0;->a:Ll/kyo0;

    iput-object p2, p0, Ll/ayo0;->b:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    iput-object p3, p0, Ll/ayo0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ayo0;->a:Ll/kyo0;

    iget-object v1, p0, Ll/ayo0;->b:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    iget-object p0, p0, Ll/ayo0;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;

    invoke-static {v0, v1, p0, p1}, Ll/kyo0;->T3(Ll/kyo0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V

    return-void
.end method
