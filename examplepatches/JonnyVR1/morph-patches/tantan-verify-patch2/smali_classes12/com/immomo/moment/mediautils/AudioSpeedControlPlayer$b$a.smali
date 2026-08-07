.class Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;->a(III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b$a;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    const-string v0, "AudioSpeedControlPlayer"

    .line 2
    .line 3
    const-string v1, "on prepared"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/lyv;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b$a;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$1100(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPreparedListener;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b$a;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$1100(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPreparedListener;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b$a;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 29
    .line 30
    invoke-interface {v0, p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPreparedListener;->onPrepared(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method
