.class public final synthetic Ll/g4t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g4t;->a:Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;

    return-void
.end method


# virtual methods
.method public final onVideoSizeChanged(Lcom/tantanapp/ijk/media/player/IMediaPlayer;IIII)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g4t;->a:Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;

    invoke-static/range {p0 .. p5}, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->c(Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;Lcom/tantanapp/ijk/media/player/IMediaPlayer;IIII)V

    return-void
.end method
