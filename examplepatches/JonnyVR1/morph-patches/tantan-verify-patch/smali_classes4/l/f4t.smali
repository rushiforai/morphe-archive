.class public final synthetic Ll/f4t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f4t;->a:Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;

    return-void
.end method


# virtual methods
.method public final onInfo(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f4t;->a:Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;

    invoke-static {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->d(Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z

    move-result p0

    return p0
.end method
