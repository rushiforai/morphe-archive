.class public Ll/w020;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

.field public b:Z

.field public c:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/w020;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/w020;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 5
    .line 6
    iget-boolean v1, p0, Ll/w020;->b:Z

    .line 7
    .line 8
    iget-boolean p0, p0, Ll/w020;->c:Z

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1, p0}, Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;->h0(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;ZZ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->v0:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/w020;->H(Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
