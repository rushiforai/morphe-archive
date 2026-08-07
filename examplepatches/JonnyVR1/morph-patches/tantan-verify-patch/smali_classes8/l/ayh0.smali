.class public final synthetic Ll/ayh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnCompletionListener;


# instance fields
.field public final synthetic a:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ayh0;->a:Ll/y20;

    return-void
.end method


# virtual methods
.method public final onCompletion(Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ayh0;->a:Ll/y20;

    invoke-static {p0, p1}, Ll/cyh0;->g(Ll/y20;Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V

    return-void
.end method
