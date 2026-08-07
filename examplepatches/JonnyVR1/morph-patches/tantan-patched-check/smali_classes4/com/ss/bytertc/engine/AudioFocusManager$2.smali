.class Lcom/ss/bytertc/engine/AudioFocusManager$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/engine/AudioFocusManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/engine/AudioFocusManager;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/AudioFocusManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/AudioFocusManager$2;->this$0:Lcom/ss/bytertc/engine/AudioFocusManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 0
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 3
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/ss/bytertc/engine/AudioFocusManager$2;->this$0:Lcom/ss/bytertc/engine/AudioFocusManager;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/ss/bytertc/engine/AudioFocusManager;->access$200(Lcom/ss/bytertc/engine/AudioFocusManager;)Landroid/media/AudioManager;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/ss/bytertc/engine/AudioFocusManager$2;->this$0:Lcom/ss/bytertc/engine/AudioFocusManager;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/ss/bytertc/engine/AudioFocusManager;->access$300(Lcom/ss/bytertc/engine/AudioFocusManager;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 18
    .line 19
    const/16 v1, 0x1a

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    if-ge v0, v1, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/ss/bytertc/engine/AudioFocusManager$2;->this$0:Lcom/ss/bytertc/engine/AudioFocusManager;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/ss/bytertc/engine/AudioFocusManager;->access$400(Lcom/ss/bytertc/engine/AudioFocusManager;)Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const/4 v1, 0x3

    .line 31
    invoke-virtual {p1, v0, v1, v2}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-static {v2}, Ll/ta1;->a(I)Landroid/media/AudioFocusRequest$Builder;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v1, p0, Lcom/ss/bytertc/engine/AudioFocusManager$2;->this$0:Lcom/ss/bytertc/engine/AudioFocusManager;

    .line 41
    .line 42
    invoke-static {v1}, Lcom/ss/bytertc/engine/AudioFocusManager;->access$400(Lcom/ss/bytertc/engine/AudioFocusManager;)Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-static {v0, v1}, Ll/ab1;->a(Landroid/media/AudioFocusRequest$Builder;Landroid/media/AudioManager$OnAudioFocusChangeListener;)Landroid/media/AudioFocusRequest$Builder;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v0}, Ll/bb1;->a(Landroid/media/AudioFocusRequest$Builder;)Landroid/media/AudioFocusRequest;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {p1, v0}, Ll/cb1;->a(Landroid/media/AudioManager;Landroid/media/AudioFocusRequest;)I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    :goto_0
    if-ne p1, v2, :cond_1

    .line 59
    .line 60
    iget-object p1, p0, Lcom/ss/bytertc/engine/AudioFocusManager$2;->this$0:Lcom/ss/bytertc/engine/AudioFocusManager;

    .line 61
    .line 62
    invoke-static {p1}, Lcom/ss/bytertc/engine/AudioFocusManager;->access$000(Lcom/ss/bytertc/engine/AudioFocusManager;)Lcom/ss/bytertc/engine/AudioFocusManager$Callback;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-interface {p1}, Lcom/ss/bytertc/engine/AudioFocusManager$Callback;->startMicrophone()V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lcom/ss/bytertc/engine/AudioFocusManager$2;->this$0:Lcom/ss/bytertc/engine/AudioFocusManager;

    .line 70
    .line 71
    invoke-static {p1}, Lcom/ss/bytertc/engine/AudioFocusManager;->access$000(Lcom/ss/bytertc/engine/AudioFocusManager;)Lcom/ss/bytertc/engine/AudioFocusManager$Callback;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-interface {p1}, Lcom/ss/bytertc/engine/AudioFocusManager$Callback;->startSpeakerphone()V

    .line 76
    .line 77
    .line 78
    :cond_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/AudioFocusManager$2;->this$0:Lcom/ss/bytertc/engine/AudioFocusManager;

    .line 79
    .line 80
    const/4 p1, 0x0

    .line 81
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/AudioFocusManager;->access$302(Lcom/ss/bytertc/engine/AudioFocusManager;Z)Z

    .line 82
    .line 83
    .line 84
    :cond_2
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 0
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 0
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method
