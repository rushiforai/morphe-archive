.class public Ll/dyh0$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/dyh0;->setOnInfoListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;

.field public final synthetic b:Ll/dyh0;


# direct methods
.method public constructor <init>(Ll/dyh0;Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dyh0$g;->b:Ll/dyh0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/dyh0$g;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onInfo(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    iget-object p1, p0, Ll/dyh0$g;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dyh0$g;->b:Ll/dyh0;

    .line 4
    .line 5
    invoke-interface {p1, p0, p2, p3}, Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;->onInfo(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
