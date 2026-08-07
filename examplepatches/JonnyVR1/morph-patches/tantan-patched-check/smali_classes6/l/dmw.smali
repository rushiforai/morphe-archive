.class public final synthetic Ll/dmw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;


# instance fields
.field public final synthetic a:Ll/gmw;

.field public final synthetic b:Ll/rxl;


# direct methods
.method public synthetic constructor <init>(Ll/gmw;Ll/rxl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dmw;->a:Ll/gmw;

    iput-object p2, p0, Ll/dmw;->b:Ll/rxl;

    return-void
.end method


# virtual methods
.method public final onError(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dmw;->a:Ll/gmw;

    iget-object p0, p0, Ll/dmw;->b:Ll/rxl;

    invoke-static {v0, p0, p1, p2, p3}, Ll/gmw;->g(Ll/gmw;Ll/rxl;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z

    move-result p0

    return p0
.end method
