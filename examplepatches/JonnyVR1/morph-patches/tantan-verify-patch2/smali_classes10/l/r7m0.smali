.class public final synthetic Ll/r7m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

.field public final synthetic b:Ll/s7m0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;Ll/s7m0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r7m0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    iput-object p2, p0, Ll/r7m0;->b:Ll/s7m0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r7m0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    iget-object p0, p0, Ll/r7m0;->b:Ll/s7m0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    invoke-static {v0, p0, p1}, Ll/s7m0;->f4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;Ll/s7m0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method
