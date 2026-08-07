.class public final synthetic Ll/q3r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/t3r;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/t3r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q3r;->a:Ll/t3r;

    iput-object p2, p0, Ll/q3r;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    iput p3, p0, Ll/q3r;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q3r;->a:Ll/t3r;

    iget-object v1, p0, Ll/q3r;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    iget p0, p0, Ll/q3r;->c:I

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    invoke-static {v0, v1, p0, p1}, Ll/t3r;->c4(Ll/t3r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;ILcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method
