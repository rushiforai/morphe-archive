.class public final synthetic Ll/emw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnPreparedListener;


# instance fields
.field public final synthetic a:Ll/gmw;

.field public final synthetic b:Ll/sxl;


# direct methods
.method public synthetic constructor <init>(Ll/gmw;Ll/sxl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/emw;->a:Ll/gmw;

    iput-object p2, p0, Ll/emw;->b:Ll/sxl;

    return-void
.end method


# virtual methods
.method public final onPrepared(Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/emw;->a:Ll/gmw;

    iget-object p0, p0, Ll/emw;->b:Ll/sxl;

    invoke-static {v0, p0, p1}, Ll/gmw;->e(Ll/gmw;Ll/sxl;Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V

    return-void
.end method
