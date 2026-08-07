.class public Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistPageFrag;
.super Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/q020;

.field public z:Ll/c020;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static M4()Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistPageFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistPageFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/c020;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/c020;-><init>(Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistPageFrag;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistPageFrag;->z:Ll/c020;

    .line 10
    .line 11
    new-instance v0, Ll/q020;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Ll/q020;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistPageFrag;->A:Ll/q020;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistPageFrag;->z:Ll/c020;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/cyr;->C(Ll/iam;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistPageFrag;->z:Ll/c020;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/c020;->s2()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistPageFrag;->A:Ll/q020;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/q020;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public onDestroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onDestroy()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistPageFrag;->z:Ll/c020;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/c020;->w2()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_intl_local_music_play_main"

    .line 2
    .line 3
    return-object p0
.end method
