.class public Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView$a;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->i0(ILcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;ZZLandroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView$a;->a:Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onStart()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView$a;->a:Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->h0(Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;)Lcom/tantan/library/svga/SVGAnimationView;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->pauseAnimation()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView$a;->a:Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->h0(Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;)Lcom/tantan/library/svga/SVGAnimationView;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v0, 0x0

    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {p0, v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stepToFrame(FZ)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
