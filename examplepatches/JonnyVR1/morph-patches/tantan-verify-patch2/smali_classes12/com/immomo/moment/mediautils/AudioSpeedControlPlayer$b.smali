.class Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/moment/mediautils/b$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->initAudioDecoder()Z
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
    iput-object p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(III)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "on AudioFormatAvailable mPlayerState:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$600(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "AudioSpeedControlPlayer"

    .line 22
    .line 23
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$600(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/4 v2, 0x1

    .line 33
    if-eq v0, v2, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$600(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const/4 v2, 0x3

    .line 42
    if-eq v0, v2, :cond_0

    .line 43
    .line 44
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$600(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    const/4 v2, 0x4

    .line 51
    if-eq v0, v2, :cond_0

    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 55
    .line 56
    invoke-static {v0, p3}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$702(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;I)I

    .line 57
    .line 58
    .line 59
    iget-object p3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 60
    .line 61
    invoke-static {p3, p2}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$802(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;I)I

    .line 62
    .line 63
    .line 64
    iget-object p2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 65
    .line 66
    invoke-static {p2, p1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$902(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;I)I

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 70
    .line 71
    invoke-static {p1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$1000(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    const/4 p2, 0x2

    .line 76
    if-nez p1, :cond_2

    .line 77
    .line 78
    iget-object p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 79
    .line 80
    invoke-static {p1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$200(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnErrorListener;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    if-eqz p1, :cond_1

    .line 85
    .line 86
    iget-object p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 87
    .line 88
    invoke-static {p1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$200(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnErrorListener;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iget-object p3, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 93
    .line 94
    invoke-interface {p1, p3, p2}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnErrorListener;->onError(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;I)V

    .line 95
    .line 96
    .line 97
    :cond_1
    const-string p1, "AudioPlayer init failed!!!"

    .line 98
    .line 99
    invoke-static {v1, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :cond_2
    iget-object p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 103
    .line 104
    invoke-static {p1, p2}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$602(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;I)I

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 108
    .line 109
    invoke-static {p1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$1200(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Landroid/os/Handler;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    new-instance p2, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b$a;

    .line 114
    .line 115
    invoke-direct {p2, p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b$a;-><init>(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$b;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 119
    .line 120
    .line 121
    return-void
.end method
