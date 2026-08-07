.class Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->prepare()V
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
    iput-object p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$a;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

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
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$a;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$000(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$a;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$100(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$a;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 17
    .line 18
    invoke-static {v1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$200(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnErrorListener;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    iget-object v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$a;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$200(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnErrorListener;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$a;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    invoke-interface {v1, v2, v3}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnErrorListener;->onError(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;I)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$a;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 40
    .line 41
    invoke-static {v1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$300(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Ll/apw;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    iget-object v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$a;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 48
    .line 49
    invoke-static {v1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$300(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Ll/apw;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget-object v2, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$a;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 54
    .line 55
    invoke-static {v2}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$400(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    add-int/lit16 v2, v2, 0x1771

    .line 60
    .line 61
    const-string v3, "Audio Decoder init failed!!!"

    .line 62
    .line 63
    invoke-interface {v1, v2, v3}, Ll/apw;->onError(ILjava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_1
    iget-object v1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$a;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 67
    .line 68
    invoke-static {v1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$500(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Lcom/immomo/moment/mediautils/b;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    if-eqz v1, :cond_2

    .line 73
    .line 74
    iget-object p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$a;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 75
    .line 76
    invoke-static {p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$500(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Lcom/immomo/moment/mediautils/b;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/b;->m()V

    .line 81
    .line 82
    .line 83
    :cond_2
    monitor-exit v0

    .line 84
    return-void

    .line 85
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    throw p0
.end method
