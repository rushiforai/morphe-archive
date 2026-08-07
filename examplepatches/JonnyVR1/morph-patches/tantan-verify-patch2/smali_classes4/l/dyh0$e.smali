.class public Ll/dyh0$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/dyh0;->setOnVideoSizeChangedListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;

.field public final synthetic b:Ll/dyh0;


# direct methods
.method public constructor <init>(Ll/dyh0;Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dyh0$e;->b:Ll/dyh0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/dyh0$e;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onVideoSizeChanged(Lcom/tantanapp/ijk/media/player/IMediaPlayer;IIII)V
    .locals 0

    .line 1
    move-object p1, p0

    .line 2
    iget-object p0, p1, Ll/dyh0$e;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;

    .line 3
    .line 4
    iget-object p1, p1, Ll/dyh0$e;->b:Ll/dyh0;

    .line 5
    .line 6
    invoke-interface/range {p0 .. p5}, Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;->onVideoSizeChanged(Lcom/tantanapp/ijk/media/player/IMediaPlayer;IIII)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
