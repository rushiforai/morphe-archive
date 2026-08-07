.class public final synthetic Ll/nym0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/qym0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;


# direct methods
.method public synthetic constructor <init>(Ll/qym0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nym0;->a:Ll/qym0;

    iput-object p2, p0, Ll/nym0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nym0;->a:Ll/qym0;

    iget-object p0, p0, Ll/nym0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Ll/qym0;->M3(Ll/qym0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
