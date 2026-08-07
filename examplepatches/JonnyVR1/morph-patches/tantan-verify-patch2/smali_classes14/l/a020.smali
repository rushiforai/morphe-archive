.class public Ll/a020;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

.field public b:Z

.field public c:Z

.field public d:Landroid/view/View$OnClickListener;

.field public e:Landroid/view/View$OnClickListener;

.field public f:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/a020;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;)V
    .locals 7

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget v1, p0, Ll/a020;->f:I

    .line 5
    .line 6
    iget-object v2, p0, Ll/a020;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 7
    .line 8
    iget-boolean v3, p0, Ll/a020;->b:Z

    .line 9
    .line 10
    iget-boolean v4, p0, Ll/a020;->c:Z

    .line 11
    .line 12
    iget-object v5, p0, Ll/a020;->d:Landroid/view/View$OnClickListener;

    .line 13
    .line 14
    iget-object v6, p0, Ll/a020;->e:Landroid/view/View$OnClickListener;

    .line 15
    .line 16
    move-object v0, p1

    .line 17
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;->i0(ILcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;ZZLandroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public I(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a020;->e:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public J(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a020;->d:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->u0:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/a020;->H(Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
