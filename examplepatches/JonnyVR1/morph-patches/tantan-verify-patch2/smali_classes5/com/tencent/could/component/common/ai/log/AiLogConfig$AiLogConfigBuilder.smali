.class public Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/could/component/common/ai/log/AiLogConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AiLogConfigBuilder"
.end annotation


# instance fields
.field public defaultTag:Ljava/lang/String;

.field public dirLog:Ljava/lang/String;

.field public fileOutTime:J

.field public isLogCat:Z

.field public isOpen:Z

.field public isUseExternalFile:Z

.field public logName:Ljava/lang/String;

.field public minLevel:I

.field public recordLogContentOnly:Z

.field public useOriginFileName:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "aiLog"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->defaultTag:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->dirLog:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->logName:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->isLogCat:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->isOpen:Z

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    iput v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->minLevel:I

    .line 19
    .line 20
    const-wide/32 v0, 0xf731400

    .line 21
    .line 22
    .line 23
    iput-wide v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->fileOutTime:J

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->isUseExternalFile:Z

    .line 27
    .line 28
    iput-boolean v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->recordLogContentOnly:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->useOriginFileName:Z

    .line 31
    .line 32
    return-void
.end method

.method public static synthetic access$000(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->defaultTag:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->dirLog:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->isLogCat:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->isOpen:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$400(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->fileOutTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$500(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->minLevel:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$600(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->logName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$700(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->isUseExternalFile:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$800(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->recordLogContentOnly:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$900(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->useOriginFileName:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public create()Lcom/tencent/could/component/common/ai/log/AiLogConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/tencent/could/component/common/ai/log/AiLogConfig;-><init>(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;Lcom/tencent/could/component/common/ai/log/AiLogConfig$a;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public setDefaultTag(Ljava/lang/String;)Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->defaultTag:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setDirLog(Ljava/lang/String;)Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->dirLog:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setFileOutTime(J)Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->fileOutTime:J

    .line 2
    .line 3
    return-object p0
.end method

.method public setLogCat(Z)Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->isLogCat:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setLogName(Ljava/lang/String;)Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->logName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setMinLevel(I)Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->minLevel:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setOpen(Z)Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->isOpen:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setRecordLogContentOnly(Z)Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->recordLogContentOnly:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setUseExternalFile(Z)Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->isUseExternalFile:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setUseOriginFileName(Z)Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->useOriginFileName:Z

    .line 2
    .line 3
    return-object p0
.end method
