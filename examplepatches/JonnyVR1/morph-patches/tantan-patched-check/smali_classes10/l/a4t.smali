.class public final synthetic Ll/a4t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a4t;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;

    return-void
.end method


# virtual methods
.method public final onInfo(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a4t;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;

    invoke-static {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z

    move-result p0

    return p0
.end method
