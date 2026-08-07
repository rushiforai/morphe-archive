.class public Ll/fyh0$c;
.super Ll/dyh0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fyh0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public b:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/dyh0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/fyh0$c;->b:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public release()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/dyh0;->release()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/fyh0;->d()Ll/fyh0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0, p0}, Ll/fyh0;->g(Ll/dyh0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public stop()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ll/dyh0;->stop()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/dyh0;->b()Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    instance-of v0, v0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/dyh0;->b()Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->resetListeners()V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-static {}, Ll/fyh0;->d()Ll/fyh0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, p0}, Ll/fyh0;->h(Ll/dyh0;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
