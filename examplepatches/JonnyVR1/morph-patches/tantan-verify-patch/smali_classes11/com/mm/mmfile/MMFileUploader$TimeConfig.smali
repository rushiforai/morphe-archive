.class Lcom/mm/mmfile/MMFileUploader$TimeConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mm/mmfile/MMFileUploader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TimeConfig"
.end annotation


# instance fields
.field private fileUploadConfig:Lcom/mm/mmfile/FileUploadConfig;

.field private nextClockTime:J

.field final synthetic this$0:Lcom/mm/mmfile/MMFileUploader;


# direct methods
.method public constructor <init>(Lcom/mm/mmfile/MMFileUploader;Lcom/mm/mmfile/FileUploadConfig;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->this$0:Lcom/mm/mmfile/MMFileUploader;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->fileUploadConfig:Lcom/mm/mmfile/FileUploadConfig;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->nextTime()V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public getFileUploadConfig()Lcom/mm/mmfile/FileUploadConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->fileUploadConfig:Lcom/mm/mmfile/FileUploadConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNextClockTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->nextClockTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public nextTime()V
    .locals 6

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->fileUploadConfig:Lcom/mm/mmfile/FileUploadConfig;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/mm/mmfile/FileUploadConfig;->getUploadClockTimeSeconds()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    const-wide/16 v4, 0x3e8

    .line 12
    .line 13
    mul-long/2addr v2, v4

    .line 14
    add-long/2addr v0, v2

    .line 15
    iput-wide v0, p0, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->nextClockTime:J

    .line 16
    .line 17
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "TimeConfig: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "_"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/mm/mmfile/MMFileUploader$TimeConfig;->fileUploadConfig:Lcom/mm/mmfile/FileUploadConfig;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/mm/mmfile/FileUploadConfig;->getUploadClockTimeSeconds()J

    .line 23
    .line 24
    .line 25
    move-result-wide v1

    .line 26
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method
