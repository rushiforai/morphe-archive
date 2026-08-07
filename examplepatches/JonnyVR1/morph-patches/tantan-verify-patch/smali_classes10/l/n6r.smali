.class public final synthetic Ll/n6r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n6r;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n6r;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    check-cast p1, Ll/d3q;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->k0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Ll/d3q;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
