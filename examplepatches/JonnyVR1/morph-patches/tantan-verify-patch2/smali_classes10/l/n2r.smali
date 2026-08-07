.class public final synthetic Ll/n2r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

.field public final synthetic b:Ll/t3r;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Ll/t3r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n2r;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    iput-object p2, p0, Ll/n2r;->b:Ll/t3r;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n2r;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    iget-object p0, p0, Ll/n2r;->b:Ll/t3r;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;->h0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Ll/t3r;Landroid/view/View;)V

    return-void
.end method
