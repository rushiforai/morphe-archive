.class public final synthetic Ll/d4u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d4u;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    return-void
.end method


# virtual methods
.method public final onError(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d4u;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    invoke-static {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->d(Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z

    move-result p0

    return p0
.end method
