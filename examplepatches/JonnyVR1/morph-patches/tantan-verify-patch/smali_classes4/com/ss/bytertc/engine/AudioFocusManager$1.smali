.class Lcom/ss/bytertc/engine/AudioFocusManager$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/engine/AudioFocusManager;-><init>(Landroid/content/Context;Lcom/ss/bytertc/engine/AudioFocusManager$Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field audioManager:Landroid/media/AudioManager;

.field final synthetic this$0:Lcom/ss/bytertc/engine/AudioFocusManager;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/AudioFocusManager;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/AudioFocusManager$1;->this$0:Lcom/ss/bytertc/engine/AudioFocusManager;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/bytertc/engine/AudioFocusManager$1;->val$context:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string p1, "audio"

    .line 9
    .line 10
    invoke-virtual {p2, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Landroid/media/AudioManager;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/ss/bytertc/engine/AudioFocusManager$1;->audioManager:Landroid/media/AudioManager;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public onAudioFocusChange(I)V
    .locals 2

    .line 1
    const/4 v0, -0x2

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Lcom/ss/bytertc/engine/AudioFocusManager$1;->this$0:Lcom/ss/bytertc/engine/AudioFocusManager;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/ss/bytertc/engine/AudioFocusManager;->access$000(Lcom/ss/bytertc/engine/AudioFocusManager;)Lcom/ss/bytertc/engine/AudioFocusManager$Callback;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-interface {p1}, Lcom/ss/bytertc/engine/AudioFocusManager$Callback;->stopSpeakerphone()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/ss/bytertc/engine/AudioFocusManager$1;->this$0:Lcom/ss/bytertc/engine/AudioFocusManager;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/ss/bytertc/engine/AudioFocusManager;->access$000(Lcom/ss/bytertc/engine/AudioFocusManager;)Lcom/ss/bytertc/engine/AudioFocusManager$Callback;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Lcom/ss/bytertc/engine/AudioFocusManager$Callback;->stopMicrophone()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const/4 v0, 0x1

    .line 24
    if-ne p1, v0, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Lcom/ss/bytertc/engine/AudioFocusManager$1;->this$0:Lcom/ss/bytertc/engine/AudioFocusManager;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/ss/bytertc/engine/AudioFocusManager;->access$000(Lcom/ss/bytertc/engine/AudioFocusManager;)Lcom/ss/bytertc/engine/AudioFocusManager$Callback;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p1}, Lcom/ss/bytertc/engine/AudioFocusManager$Callback;->higherVolume()V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/ss/bytertc/engine/AudioFocusManager$1;->this$0:Lcom/ss/bytertc/engine/AudioFocusManager;

    .line 36
    .line 37
    invoke-static {p1}, Lcom/ss/bytertc/engine/AudioFocusManager;->access$000(Lcom/ss/bytertc/engine/AudioFocusManager;)Lcom/ss/bytertc/engine/AudioFocusManager$Callback;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-interface {p1}, Lcom/ss/bytertc/engine/AudioFocusManager$Callback;->startSpeakerphone()V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/ss/bytertc/engine/AudioFocusManager$1;->this$0:Lcom/ss/bytertc/engine/AudioFocusManager;

    .line 45
    .line 46
    invoke-static {p0}, Lcom/ss/bytertc/engine/AudioFocusManager;->access$000(Lcom/ss/bytertc/engine/AudioFocusManager;)Lcom/ss/bytertc/engine/AudioFocusManager$Callback;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-interface {p0}, Lcom/ss/bytertc/engine/AudioFocusManager$Callback;->startMicrophone()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    const/4 v1, -0x1

    .line 55
    if-ne p1, v1, :cond_2

    .line 56
    .line 57
    iget-object p1, p0, Lcom/ss/bytertc/engine/AudioFocusManager$1;->this$0:Lcom/ss/bytertc/engine/AudioFocusManager;

    .line 58
    .line 59
    invoke-static {p1}, Lcom/ss/bytertc/engine/AudioFocusManager;->access$000(Lcom/ss/bytertc/engine/AudioFocusManager;)Lcom/ss/bytertc/engine/AudioFocusManager$Callback;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-interface {p1}, Lcom/ss/bytertc/engine/AudioFocusManager$Callback;->stopSpeakerphone()V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/ss/bytertc/engine/AudioFocusManager$1;->this$0:Lcom/ss/bytertc/engine/AudioFocusManager;

    .line 67
    .line 68
    invoke-static {p1}, Lcom/ss/bytertc/engine/AudioFocusManager;->access$000(Lcom/ss/bytertc/engine/AudioFocusManager;)Lcom/ss/bytertc/engine/AudioFocusManager$Callback;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-interface {p1}, Lcom/ss/bytertc/engine/AudioFocusManager$Callback;->stopMicrophone()V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Lcom/ss/bytertc/engine/AudioFocusManager$1;->this$0:Lcom/ss/bytertc/engine/AudioFocusManager;

    .line 76
    .line 77
    invoke-static {p0, v0}, Lcom/ss/bytertc/engine/AudioFocusManager;->access$100(Lcom/ss/bytertc/engine/AudioFocusManager;Z)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    const/4 v0, -0x3

    .line 82
    if-ne p1, v0, :cond_3

    .line 83
    .line 84
    iget-object p0, p0, Lcom/ss/bytertc/engine/AudioFocusManager$1;->this$0:Lcom/ss/bytertc/engine/AudioFocusManager;

    .line 85
    .line 86
    invoke-static {p0}, Lcom/ss/bytertc/engine/AudioFocusManager;->access$000(Lcom/ss/bytertc/engine/AudioFocusManager;)Lcom/ss/bytertc/engine/AudioFocusManager$Callback;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-interface {p0}, Lcom/ss/bytertc/engine/AudioFocusManager$Callback;->lowerVolume()V

    .line 91
    .line 92
    .line 93
    :cond_3
    return-void
.end method
