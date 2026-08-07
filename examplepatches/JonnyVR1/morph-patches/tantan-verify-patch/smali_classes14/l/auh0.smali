.class public final synthetic Ll/auh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/auh0;->a:Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;

    return-void
.end method


# virtual methods
.method public final onError(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/auh0;->a:Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;

    invoke-static {p0, p1, p2, p3}, Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;->c(Lcom/p1/mobile/putong/camera/widget/TTCameraMediaView;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z

    move-result p0

    return p0
.end method
