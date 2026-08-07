.class public final synthetic Ll/we80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;


# instance fields
.field public final synthetic a:Ll/ye80;


# direct methods
.method public synthetic constructor <init>(Ll/ye80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/we80;->a:Ll/ye80;

    return-void
.end method


# virtual methods
.method public final onError(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/we80;->a:Ll/ye80;

    invoke-static {p0, p1, p2, p3}, Ll/ye80;->l(Ll/ye80;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z

    move-result p0

    return p0
.end method
