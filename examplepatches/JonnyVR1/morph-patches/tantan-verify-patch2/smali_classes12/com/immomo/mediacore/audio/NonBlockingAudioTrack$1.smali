.class Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;-><init>(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;


# direct methods
.method public constructor <init>(Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$1;->this$0:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

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
    const/16 v0, -0x13

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 4
    .line 5
    .line 6
    :goto_0
    iget-object v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$1;->this$0:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->access$000(Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack$1;->this$0:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->access$100(Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;)V

    .line 18
    .line 19
    .line 20
    const-wide/16 v0, 0x5

    .line 21
    .line 22
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catch_0
    invoke-static {}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->access$200()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void
.end method
