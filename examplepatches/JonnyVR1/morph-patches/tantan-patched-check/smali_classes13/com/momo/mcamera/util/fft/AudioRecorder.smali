.class public Lcom/momo/mcamera/util/fft/AudioRecorder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final audioFormat:I = 0x2

.field public static final channelConfig:I = 0x10

.field public static final sampleRate:I = 0xac44


# instance fields
.field private accuracy:I

.field private audioRecorder:Landroid/media/AudioRecord;

.field private buffer:[S

.field private bufferReadResult:I

.field private bufferSize:I


# direct methods
.method public constructor <init>()V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x10

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    const v2, 0xac44

    .line 8
    .line 9
    .line 10
    invoke-static {v2, v0, v1}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Lcom/momo/mcamera/util/fft/AudioRecorder;->bufferSize:I

    .line 15
    .line 16
    new-instance v1, Landroid/media/AudioRecord;

    .line 17
    .line 18
    iget v0, p0, Lcom/momo/mcamera/util/fft/AudioRecorder;->bufferSize:I

    .line 19
    .line 20
    mul-int/lit8 v6, v0, 0xa

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    const v3, 0xac44

    .line 24
    .line 25
    .line 26
    const/16 v4, 0x10

    .line 27
    .line 28
    const/4 v5, 0x2

    .line 29
    invoke-direct/range {v1 .. v6}, Landroid/media/AudioRecord;-><init>(IIIII)V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Lcom/momo/mcamera/util/fft/AudioRecorder;->audioRecorder:Landroid/media/AudioRecord;

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public getBufferReadResult()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/util/fft/AudioRecorder;->bufferReadResult:I

    .line 2
    .line 3
    return p0
.end method

.method public getSamples()[S
    .locals 4

    .line 1
    iget v0, p0, Lcom/momo/mcamera/util/fft/AudioRecorder;->accuracy:I

    .line 2
    .line 3
    new-array v1, v0, [S

    .line 4
    .line 5
    iput-object v1, p0, Lcom/momo/mcamera/util/fft/AudioRecorder;->buffer:[S

    .line 6
    .line 7
    iget-object v2, p0, Lcom/momo/mcamera/util/fft/AudioRecorder;->audioRecorder:Landroid/media/AudioRecord;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    invoke-virtual {v2, v1, v3, v0}, Landroid/media/AudioRecord;->read([SII)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Lcom/momo/mcamera/util/fft/AudioRecorder;->bufferReadResult:I

    .line 15
    .line 16
    iget-object p0, p0, Lcom/momo/mcamera/util/fft/AudioRecorder;->buffer:[S

    .line 17
    .line 18
    return-object p0
.end method

.method public setAccuracy(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/util/fft/AudioRecorder;->accuracy:I

    .line 2
    .line 3
    return-void
.end method

.method public startRecorder()V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/momo/mcamera/util/fft/AudioRecorder;->audioRecorder:Landroid/media/AudioRecord;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/AudioRecord;->startRecording()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    const-string v0, "Recording failed"

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public stopRecorder()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/util/fft/AudioRecorder;->audioRecorder:Landroid/media/AudioRecord;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/momo/mcamera/util/fft/AudioRecorder;->audioRecorder:Landroid/media/AudioRecord;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/media/AudioRecord;->release()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception p0

    .line 13
    const-string v0, "Stop failed"

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
