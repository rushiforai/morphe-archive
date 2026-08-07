.class Lcom/immomo/mediacore/audio/audio_Indicator$AudioIndicatorHT;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/mediacore/audio/audio_Indicator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioIndicatorHT"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/immomo/mediacore/audio/audio_Indicator;


# direct methods
.method public constructor <init>(Lcom/immomo/mediacore/audio/audio_Indicator;Lcom/immomo/mediacore/audio/audio_Indicator;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediacore/audio/audio_Indicator$AudioIndicatorHT;->this$0:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 2
    .line 3
    invoke-direct {p0, p3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/16 v1, 0x64

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v0, "Unknown message type "

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget p1, p1, Landroid/os/Message;->what:I

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "audio_Indicator"

    .line 24
    .line 25
    invoke-static {p1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p1, p0, Lcom/immomo/mediacore/audio/audio_Indicator$AudioIndicatorHT;->this$0:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 30
    .line 31
    invoke-static {p1}, Lcom/immomo/mediacore/audio/audio_Indicator;->access$000(Lcom/immomo/mediacore/audio/audio_Indicator;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/immomo/mediacore/audio/audio_Indicator$AudioIndicatorHT;->this$0:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 35
    .line 36
    invoke-static {p1}, Lcom/immomo/mediacore/audio/audio_Indicator;->access$100(Lcom/immomo/mediacore/audio/audio_Indicator;)Landroid/os/Handler;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/immomo/mediacore/audio/audio_Indicator$AudioIndicatorHT;->this$0:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 44
    .line 45
    invoke-static {p1}, Lcom/immomo/mediacore/audio/audio_Indicator;->access$100(Lcom/immomo/mediacore/audio/audio_Indicator;)Landroid/os/Handler;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const/4 v0, 0x0

    .line 50
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {p1, v1, v0, v0, v2}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget-object v0, p0, Lcom/immomo/mediacore/audio/audio_Indicator$AudioIndicatorHT;->this$0:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 59
    .line 60
    invoke-static {v0}, Lcom/immomo/mediacore/audio/audio_Indicator;->access$100(Lcom/immomo/mediacore/audio/audio_Indicator;)Landroid/os/Handler;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iget-object p0, p0, Lcom/immomo/mediacore/audio/audio_Indicator$AudioIndicatorHT;->this$0:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 65
    .line 66
    invoke-static {p0}, Lcom/immomo/mediacore/audio/audio_Indicator;->access$200(Lcom/immomo/mediacore/audio/audio_Indicator;)I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    int-to-long v1, p0

    .line 71
    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 72
    .line 73
    .line 74
    return-void
.end method
