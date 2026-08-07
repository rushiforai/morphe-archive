.class public final synthetic Ll/xe80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnCompletionListener;


# instance fields
.field public final synthetic a:Ll/ye80;


# direct methods
.method public synthetic constructor <init>(Ll/ye80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xe80;->a:Ll/ye80;

    return-void
.end method


# virtual methods
.method public final onCompletion(Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xe80;->a:Ll/ye80;

    invoke-static {p0, p1}, Ll/ye80;->g(Ll/ye80;Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V

    return-void
.end method
