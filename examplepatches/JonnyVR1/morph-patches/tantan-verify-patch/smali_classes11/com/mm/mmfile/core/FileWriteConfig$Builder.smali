.class public final Lcom/mm/mmfile/core/FileWriteConfig$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mm/mmfile/core/FileWriteConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


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
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->isCompress:Z

    .line 6
    .line 7
    const-wide/32 v1, 0x4b000

    .line 8
    .line 9
    .line 10
    iput-wide v1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->bufferLength:J

    .line 11
    .line 12
    const-wide/32 v1, 0x100000

    .line 13
    .line 14
    .line 15
    iput-wide v1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->logLengthMax:J

    .line 16
    .line 17
    iput-byte v0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->headWrapperStart:B

    .line 18
    .line 19
    const/4 v0, 0x4

    .line 20
    iput-byte v0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->headWrapperEnd:B

    .line 21
    .line 22
    const/4 v1, 0x2

    .line 23
    iput-byte v1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->bodyWrapperStart:B

    .line 24
    .line 25
    const/4 v1, 0x3

    .line 26
    iput-byte v1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->bodyWrapperEnd:B

    .line 27
    .line 28
    const/16 v1, 0x12

    .line 29
    .line 30
    iput-byte v1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->magicCryptNoCompressStart:B

    .line 31
    .line 32
    const/16 v1, 0x13

    .line 33
    .line 34
    iput-byte v1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->magicCryptCompressStart:B

    .line 35
    .line 36
    const/16 v1, 0x14

    .line 37
    .line 38
    iput-byte v1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->magicNoCryptCompressStart:B

    .line 39
    .line 40
    iput-byte v0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->magicNoCryptNoCompressStart:B

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    iput-byte v0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->magicEnd:B

    .line 44
    .line 45
    iput v0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->maxFileCounts:I

    .line 46
    .line 47
    return-void
.end method

.method public static synthetic access$000(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->cacheDir:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->logDir:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1000(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->bodyWrapperStart:B

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1100(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->bodyWrapperEnd:B

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1200(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->magicCryptNoCompressStart:B

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1300(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->magicCryptCompressStart:B

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1400(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->magicNoCryptCompressStart:B

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1500(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->magicNoCryptNoCompressStart:B

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1600(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->magicEnd:B

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1700(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)Lcom/mm/mmfile/core/MMLogInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->commonInfo:Lcom/mm/mmfile/core/MMLogInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1800(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)Lcom/mm/mmfile/core/IMMFileEventListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->eventListener:Lcom/mm/mmfile/core/IMMFileEventListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1900(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->maxFileCounts:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$200(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->isCrypt:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->isCompress:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$400(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->filePrefix:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->bufferLength:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$600(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->logLengthMax:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$700(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->printTipLog2File:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$800(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->headWrapperStart:B

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$900(Lcom/mm/mmfile/core/FileWriteConfig$Builder;)B
    .locals 0

    .line 1
    iget-byte p0, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->headWrapperEnd:B

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public bodyWrapperEnd(B)Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    .locals 0

    .line 1
    iput-byte p1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->bodyWrapperEnd:B

    .line 2
    .line 3
    return-object p0
.end method

.method public bodyWrapperStart(B)Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    .locals 0

    .line 1
    iput-byte p1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->bodyWrapperStart:B

    .line 2
    .line 3
    return-object p0
.end method

.method public bufferLength(J)Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->bufferLength:J

    .line 2
    .line 3
    return-object p0
.end method

.method public build()Lcom/mm/mmfile/core/FileWriteConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/mm/mmfile/core/FileWriteConfig;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/mm/mmfile/core/FileWriteConfig;-><init>(Lcom/mm/mmfile/core/FileWriteConfig$Builder;Lcom/mm/mmfile/core/FileWriteConfig$1;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public cacheDir(Ljava/lang/String;)Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->cacheDir:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public commonInfo(Lcom/mm/mmfile/core/MMLogInfo;)Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->commonInfo:Lcom/mm/mmfile/core/MMLogInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public eventListener(Lcom/mm/mmfile/core/IMMFileEventListener;)Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->eventListener:Lcom/mm/mmfile/core/IMMFileEventListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public filePrefix(Ljava/lang/String;)Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->filePrefix:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public headWrapperEnd(B)Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    .locals 0

    .line 1
    iput-byte p1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->headWrapperEnd:B

    .line 2
    .line 3
    return-object p0
.end method

.method public headWrapperStart(B)Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    .locals 0

    .line 1
    iput-byte p1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->headWrapperStart:B

    .line 2
    .line 3
    return-object p0
.end method

.method public isCompress(Z)Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->isCompress:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public isCrypt(Z)Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->isCrypt:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public logDir(Ljava/lang/String;)Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->logDir:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public logLengthMax(J)Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->logLengthMax:J

    .line 2
    .line 3
    return-object p0
.end method

.method public magicCryptCompressStart(B)Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    .locals 0

    .line 1
    iput-byte p1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->magicCryptCompressStart:B

    .line 2
    .line 3
    return-object p0
.end method

.method public magicCryptNoCompressStart(B)Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    .locals 0

    .line 1
    iput-byte p1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->magicCryptNoCompressStart:B

    .line 2
    .line 3
    return-object p0
.end method

.method public magicEnd(B)Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    .locals 0

    .line 1
    iput-byte p1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->magicEnd:B

    .line 2
    .line 3
    return-object p0
.end method

.method public magicNoCryptCompressStart(B)Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    .locals 0

    .line 1
    iput-byte p1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->magicNoCryptCompressStart:B

    .line 2
    .line 3
    return-object p0
.end method

.method public magicNoCryptNoCompressStart(B)Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    .locals 0

    .line 1
    iput-byte p1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->magicNoCryptNoCompressStart:B

    .line 2
    .line 3
    return-object p0
.end method

.method public printTipLog2File(Z)Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->printTipLog2File:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setMaxFileCounts(I)Lcom/mm/mmfile/core/FileWriteConfig$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/mm/mmfile/core/FileWriteConfig$Builder;->maxFileCounts:I

    .line 2
    .line 3
    return-object p0
.end method
