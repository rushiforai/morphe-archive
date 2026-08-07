.class public final synthetic Ll/ywm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ywm0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ywm0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;

    invoke-static {p0, p1}, Ll/ixm0;->T3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
