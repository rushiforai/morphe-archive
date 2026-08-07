.class public final synthetic Ll/fmw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;


# instance fields
.field public final synthetic a:Ll/gmw;

.field public final synthetic b:Ll/uxl;


# direct methods
.method public synthetic constructor <init>(Ll/gmw;Ll/uxl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fmw;->a:Ll/gmw;

    iput-object p2, p0, Ll/fmw;->b:Ll/uxl;

    return-void
.end method


# virtual methods
.method public final onVideoSizeChanged(Lcom/tantanapp/ijk/media/player/IMediaPlayer;IIII)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/fmw;->a:Ll/gmw;

    iget-object v1, p0, Ll/fmw;->b:Ll/uxl;

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-static/range {v0 .. v6}, Ll/gmw;->h(Ll/gmw;Ll/uxl;Lcom/tantanapp/ijk/media/player/IMediaPlayer;IIII)V

    return-void
.end method
