.class public Lcom/ss/bytertc/engine/data/RTCLogConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public logFileSize:I

.field public logFilenamePrefix:Ljava/lang/String;

.field public logLevel:Lcom/ss/bytertc/engine/data/LocalLogLevel;

.field public logPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/data/LocalLogLevel;Ljava/lang/String;ILjava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xa

    .line 5
    .line 6
    iput v0, p0, Lcom/ss/bytertc/engine/data/RTCLogConfig;->logFileSize:I

    .line 7
    .line 8
    sget-object v0, Lcom/ss/bytertc/engine/data/LocalLogLevel;->INFO:Lcom/ss/bytertc/engine/data/LocalLogLevel;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/RTCLogConfig;->logLevel:Lcom/ss/bytertc/engine/data/LocalLogLevel;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/ss/bytertc/engine/data/RTCLogConfig;->logPath:Ljava/lang/String;

    .line 13
    .line 14
    iput p3, p0, Lcom/ss/bytertc/engine/data/RTCLogConfig;->logFileSize:I

    .line 15
    .line 16
    iput-object p4, p0, Lcom/ss/bytertc/engine/data/RTCLogConfig;->logFilenamePrefix:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method public static create(Lcom/ss/bytertc/engine/data/LocalLogLevel;Ljava/lang/String;ILjava/lang/String;)Lcom/ss/bytertc/engine/data/RTCLogConfig;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/data/RTCLogConfig;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/ss/bytertc/engine/data/RTCLogConfig;-><init>(Lcom/ss/bytertc/engine/data/LocalLogLevel;Ljava/lang/String;ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "RTCLogConfig{log_level=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/data/RTCLogConfig;->logLevel:Lcom/ss/bytertc/engine/data/LocalLogLevel;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', log_path=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/ss/bytertc/engine/data/RTCLogConfig;->logPath:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', log_file_size=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/ss/bytertc/engine/data/RTCLogConfig;->logFileSize:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', log_filename_prefix=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/RTCLogConfig;->logFilenamePrefix:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p0, "\'}"

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method
