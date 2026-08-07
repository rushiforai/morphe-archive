.class public final synthetic Ll/m3r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/t3r;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;


# direct methods
.method public synthetic constructor <init>(Ll/t3r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m3r;->a:Ll/t3r;

    iput-object p2, p0, Ll/m3r;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m3r;->a:Ll/t3r;

    iget-object p0, p0, Ll/m3r;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    invoke-static {v0, p0, p1}, Ll/t3r;->a4(Ll/t3r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
