.class public final synthetic Ll/g6r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/k6r;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;


# direct methods
.method public synthetic constructor <init>(Ll/k6r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g6r;->a:Ll/k6r;

    iput-object p2, p0, Ll/g6r;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g6r;->a:Ll/k6r;

    iget-object p0, p0, Ll/g6r;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {v0, p0, p1}, Ll/k6r;->R3(Ll/k6r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
