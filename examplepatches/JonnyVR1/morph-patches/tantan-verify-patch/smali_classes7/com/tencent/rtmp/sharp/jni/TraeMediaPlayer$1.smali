.class Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer$1;
.super Ljava/util/TimerTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer;->playRing(IILandroid/net/Uri;Ljava/lang/String;ZIZZI)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer;


# direct methods
.method public constructor <init>(Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer$1;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer$1;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer;->access$000(Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer;)Landroid/media/MediaPlayer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    const-string v1, "TraeMediaPlay | play timeout"

    .line 17
    .line 18
    const-string v2, "TRAE"

    .line 19
    .line 20
    invoke-static {v2, v0, v1}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer$1;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer;->access$100(Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer;)Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer$OnCompletionListener;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer$1;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer;

    .line 32
    .line 33
    invoke-static {p0}, Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer;->access$100(Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer;)Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer$OnCompletionListener;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {p0}, Lcom/tencent/rtmp/sharp/jni/TraeMediaPlayer$OnCompletionListener;->onCompletion()V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method
