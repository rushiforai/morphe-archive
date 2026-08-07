.class Lcom/tencent/rtmp/a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/rtmp/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/rtmp/a;

.field private b:I


# direct methods
.method private constructor <init>(Lcom/tencent/rtmp/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/a$a;->a:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 p1, 0x12c

    .line 7
    .line 8
    iput p1, p0, Lcom/tencent/rtmp/a$a;->b:I

    .line 9
    .line 10
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tencent/rtmp/a;Lcom/tencent/rtmp/a$1;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1}, Lcom/tencent/rtmp/a$a;-><init>(Lcom/tencent/rtmp/a;)V

    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/rtmp/a$a;->b:I

    .line 2
    .line 3
    return-void
.end method

.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/a$a;->a:Lcom/tencent/rtmp/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/a;)Lcom/tencent/liteav/n;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/rtmp/a$a;->a:Lcom/tencent/rtmp/a;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/a;)Lcom/tencent/liteav/n;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/tencent/liteav/n;->c()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/tencent/rtmp/a$a;->a:Lcom/tencent/rtmp/a;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tencent/rtmp/a;->a(Lcom/tencent/rtmp/a;)Lcom/tencent/liteav/n;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/tencent/liteav/n;->h()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget-object v1, p0, Lcom/tencent/rtmp/a$a;->a:Lcom/tencent/rtmp/a;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/tencent/rtmp/a;->b(Lcom/tencent/rtmp/a;)Lcom/tencent/rtmp/TXLivePlayer$ITXAudioVolumeEvaluationListener;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    iget-object v1, p0, Lcom/tencent/rtmp/a$a;->a:Lcom/tencent/rtmp/a;

    .line 40
    .line 41
    invoke-static {v1}, Lcom/tencent/rtmp/a;->b(Lcom/tencent/rtmp/a;)Lcom/tencent/rtmp/TXLivePlayer$ITXAudioVolumeEvaluationListener;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-interface {v1, v0}, Lcom/tencent/rtmp/TXLivePlayer$ITXAudioVolumeEvaluationListener;->onAudioVolumeEvaluationNotify(I)V

    .line 46
    .line 47
    .line 48
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/a$a;->a:Lcom/tencent/rtmp/a;

    .line 49
    .line 50
    invoke-static {v0}, Lcom/tencent/rtmp/a;->c(Lcom/tencent/rtmp/a;)Landroid/os/Handler;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    iget v0, p0, Lcom/tencent/rtmp/a$a;->b:I

    .line 57
    .line 58
    if-lez v0, :cond_1

    .line 59
    .line 60
    iget-object v0, p0, Lcom/tencent/rtmp/a$a;->a:Lcom/tencent/rtmp/a;

    .line 61
    .line 62
    invoke-static {v0}, Lcom/tencent/rtmp/a;->c(Lcom/tencent/rtmp/a;)Landroid/os/Handler;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object v1, p0, Lcom/tencent/rtmp/a$a;->a:Lcom/tencent/rtmp/a;

    .line 67
    .line 68
    invoke-static {v1}, Lcom/tencent/rtmp/a;->d(Lcom/tencent/rtmp/a;)Lcom/tencent/rtmp/a$a;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iget p0, p0, Lcom/tencent/rtmp/a$a;->b:I

    .line 73
    .line 74
    int-to-long v2, p0

    .line 75
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 76
    .line 77
    .line 78
    :cond_1
    return-void
.end method
