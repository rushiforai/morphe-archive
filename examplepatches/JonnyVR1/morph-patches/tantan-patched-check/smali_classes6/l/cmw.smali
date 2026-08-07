.class public final synthetic Ll/cmw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnCompletionListener;


# instance fields
.field public final synthetic a:Ll/gmw;

.field public final synthetic b:Ll/qxl;


# direct methods
.method public synthetic constructor <init>(Ll/gmw;Ll/qxl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cmw;->a:Ll/gmw;

    iput-object p2, p0, Ll/cmw;->b:Ll/qxl;

    return-void
.end method


# virtual methods
.method public final onCompletion(Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cmw;->a:Ll/gmw;

    iget-object p0, p0, Ll/cmw;->b:Ll/qxl;

    invoke-static {v0, p0, p1}, Ll/gmw;->f(Ll/gmw;Ll/qxl;Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V

    return-void
.end method
