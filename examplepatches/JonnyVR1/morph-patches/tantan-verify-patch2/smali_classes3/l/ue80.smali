.class public final synthetic Ll/ue80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnPreparedListener;


# instance fields
.field public final synthetic a:Ll/ye80;


# direct methods
.method public synthetic constructor <init>(Ll/ye80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ue80;->a:Ll/ye80;

    return-void
.end method


# virtual methods
.method public final onPrepared(Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ue80;->a:Ll/ye80;

    invoke-static {p0, p1}, Ll/ye80;->k(Ll/ye80;Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V

    return-void
.end method
