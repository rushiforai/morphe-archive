.class public final synthetic Ll/tpk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/hqk0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;


# direct methods
.method public synthetic constructor <init>(Ll/hqk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tpk0;->a:Ll/hqk0;

    iput-object p2, p0, Ll/tpk0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tpk0;->a:Ll/hqk0;

    iget-object p0, p0, Ll/tpk0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    invoke-static {v0, p0, p1}, Ll/hqk0;->d4(Ll/hqk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
