.class public Lcom/mm/mmfile/core/FileWriteConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    }
.end annotation


# static fields
.field private static final DEFAULT_BUFFER_LENGTH:J = 0x4b000L

.field private static final DEFAULT_LOG_LENGTH:J = 0x100000L


# instance fields
.field private bodyWrapperEnd:B

.field private bodyWrapperStart:B

.field private bufferLength:J

.field private cacheDir:Ljava/lang/String;

.field private commonInfo:Lcom/mm/mmfile/core/MMLogInfo;

.field private eventListener:Lcom/mm/mmfile/core/IMMFileEventListener;

.field private filePrefix:Ljava/lang/String;

.field private headWrapperEnd:B

.field private headWrapperStart:B

.field private isCompress:Z

.field private isCrypt:Z

.field private logDir:Ljava/lang/String;

.field private logLengthMax:J

.field private magicCryptCompressStart:B

.field private magicCryptNoCompressStart:B

.field private magicEnd:B

.field private magicNoCryptCompressStart:B

.field private magicNoCryptNoCompressStart:B

.field private maxFileCounts:I

.field private printTipLog2File:Z


# direct methods
.method private constructor <init>(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->access$000(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->cacheDir:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->access$100(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->logDir:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->access$200(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput-boolean v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->isCrypt:Z

    .line 21
    .line 22
    invoke-static {p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->access$300(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput-boolean v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->isCompress:Z

    .line 27
    .line 28
    invoke-static {p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->access$400(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->filePrefix:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->access$500(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)J

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    iput-wide v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->bufferLength:J

    .line 39
    .line 40
    invoke-static {p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->access$600(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    iput-wide v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->logLengthMax:J

    .line 45
    .line 46
    invoke-static {p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->access$700(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput-boolean v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->printTipLog2File:Z

    .line 51
    .line 52
    invoke-static {p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->access$800(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)B

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iput-byte v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->headWrapperStart:B

    .line 57
    .line 58
    invoke-static {p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->access$900(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)B

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput-byte v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->headWrapperEnd:B

    .line 63
    .line 64
    invoke-static {p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->access$1000(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)B

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iput-byte v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->bodyWrapperStart:B

    .line 69
    .line 70
    invoke-static {p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->access$1100(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)B

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iput-byte v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->bodyWrapperEnd:B

    .line 75
    .line 76
    invoke-static {p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->access$1200(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)B

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iput-byte v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->magicCryptNoCompressStart:B

    .line 81
    .line 82
    invoke-static {p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->access$1300(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)B

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    iput-byte v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->magicCryptCompressStart:B

    .line 87
    .line 88
    invoke-static {p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->access$1400(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)B

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iput-byte v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->magicNoCryptCompressStart:B

    .line 93
    .line 94
    invoke-static {p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->access$1500(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)B

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    iput-byte v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->magicNoCryptNoCompressStart:B

    .line 99
    .line 100
    invoke-static {p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->access$1600(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)B

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iput-byte v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->magicEnd:B

    .line 105
    .line 106
    invoke-static {p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->access$1700(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)Lcom/mm/mmfile/core/MMLogInfo;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iput-object v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->commonInfo:Lcom/mm/mmfile/core/MMLogInfo;

    .line 111
    .line 112
    invoke-static {p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->access$1800(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)Lcom/mm/mmfile/core/IMMFileEventListener;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iput-object v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->eventListener:Lcom/mm/mmfile/core/IMMFileEventListener;

    .line 117
    .line 118
    invoke-static {p1}, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->access$1900(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)I

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    iput p1, p0, Lcom/mm/mmfile/core/FileWriteConfig;->maxFileCounts:I

    .line 123
    .line 124
    return-void
.end method

.method public synthetic constructor <init>(Lcom/mm/mmfile/core/FileWriteConfig$Builder;Lcom/mm/mmfile/core/FileWriteConfig$1;)V
    .locals 0

    .line 125
    invoke-direct {p0, p1}, Lcom/mm/mmfile/core/FileWriteConfig;-><init>(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)V

    return-void
.end method


# virtual methods
.method public getBodyWrapperEnd()B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->bodyWrapperEnd:B

    .line 2
    .line 3
    return p0
.end method

.method public getBodyWrapperStart()B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->bodyWrapperStart:B

    .line 2
    .line 3
    return p0
.end method

.method public getBufferLength()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->bufferLength:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getCacheDir()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->cacheDir:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCommonInfo()Lcom/mm/mmfile/core/MMLogInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->commonInfo:Lcom/mm/mmfile/core/MMLogInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEventListener()Lcom/mm/mmfile/core/IMMFileEventListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->eventListener:Lcom/mm/mmfile/core/IMMFileEventListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFilePrefix()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->filePrefix:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHeadWrapperEnd()B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->headWrapperEnd:B

    .line 2
    .line 3
    return p0
.end method

.method public getHeadWrapperStart()B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->headWrapperStart:B

    .line 2
    .line 3
    return p0
.end method

.method public getLogDir()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->logDir:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLogLengthMax()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->logLengthMax:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getMagicCryptCompressStart()B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->magicCryptCompressStart:B

    .line 2
    .line 3
    return p0
.end method

.method public getMagicCryptNoCompressStart()B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->magicCryptNoCompressStart:B

    .line 2
    .line 3
    return p0
.end method

.method public getMagicEnd()B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->magicEnd:B

    .line 2
    .line 3
    return p0
.end method

.method public getMagicNoCryptCompressStart()B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->magicNoCryptCompressStart:B

    .line 2
    .line 3
    return p0
.end method

.method public getMagicNoCryptNoCompressStart()B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->magicNoCryptNoCompressStart:B

    .line 2
    .line 3
    return p0
.end method

.method public getMaxFileCounts()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->maxFileCounts:I

    .line 2
    .line 3
    return p0
.end method

.method public isCompress()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->isCompress:Z

    .line 2
    .line 3
    return p0
.end method

.method public isCrypt()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->isCrypt:Z

    .line 2
    .line 3
    return p0
.end method

.method public isPrintTipLog2File()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/mm/mmfile/core/FileWriteConfig;->printTipLog2File:Z

    .line 2
    .line 3
    return p0
.end method

.method public updateCommonInfo(Lcom/mm/mmfile/core/MMLogInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/mm/mmfile/core/FileWriteConfig;->commonInfo:Lcom/mm/mmfile/core/MMLogInfo;

    .line 2
    .line 3
    return-void
.end method
