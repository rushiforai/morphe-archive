.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$b;
.super Ll/ie80$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->R2(Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/feed/ui/PlayerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$b;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/ie80$c;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(I)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$b;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->y2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$b;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->I2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->C2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)Ll/re80;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ll/re80;->pause()V

    .line 20
    .line 21
    .line 22
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$b;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->F2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$b;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->F2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onStart()V
    .locals 0

    return-void
.end method
