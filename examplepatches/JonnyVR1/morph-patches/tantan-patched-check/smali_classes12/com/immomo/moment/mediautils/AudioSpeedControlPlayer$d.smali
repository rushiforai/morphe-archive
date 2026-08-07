.class Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/spw;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->initAudioPlayer()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$d;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFail(ILjava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$d;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$300(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Ll/apw;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$d;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$300(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Ll/apw;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$d;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$400(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    add-int/2addr v1, p1

    .line 22
    invoke-interface {v0, v1, p2}, Ll/apw;->onError(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v1, "["

    .line 28
    .line 29
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$d;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 33
    .line 34
    invoke-static {p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$400(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    add-int/2addr p0, p1

    .line 39
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string p0, "]"

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string p1, "AudioSpeedControlPlayer"

    .line 55
    .line 56
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method
