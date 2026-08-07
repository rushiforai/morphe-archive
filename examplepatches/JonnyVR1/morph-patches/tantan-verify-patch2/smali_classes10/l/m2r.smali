.class public final synthetic Ll/m2r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;

.field public final synthetic b:Lcom/tantanapp/media/ttmediautils/download/Action2;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;Lcom/tantanapp/media/ttmediautils/download/Action2;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m2r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;

    iput-object p2, p0, Ll/m2r;->b:Lcom/tantanapp/media/ttmediautils/download/Action2;

    iput-object p3, p0, Ll/m2r;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m2r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;

    iget-object v1, p0, Ll/m2r;->b:Lcom/tantanapp/media/ttmediautils/download/Action2;

    iget-object p0, p0, Ll/m2r;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;->i0(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;Lcom/tantanapp/media/ttmediautils/download/Action2;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Landroid/view/View;)V

    return-void
.end method
