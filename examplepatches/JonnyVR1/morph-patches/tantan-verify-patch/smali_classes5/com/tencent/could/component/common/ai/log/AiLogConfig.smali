.class public Lcom/tencent/could/component/common/ai/log/AiLogConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;
    }
.end annotation


# static fields
.field public static final DEFAULT_STRING:Ljava/lang/String; = "aiLog"


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
.method public constructor <init>(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->isUseExternalFile:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->recordLogContentOnly:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->useOriginFileName:Z

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->access$000(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->defaultTag:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->access$100(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->dirLog:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->access$200(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput-boolean v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->isLogCat:Z

    .line 28
    .line 29
    invoke-static {p1}, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->access$300(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iput-boolean v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->isOpen:Z

    .line 34
    .line 35
    invoke-static {p1}, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->access$400(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    iput-wide v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->fileOutTime:J

    .line 40
    .line 41
    invoke-static {p1}, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->access$500(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iput v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->minLevel:I

    .line 46
    .line 47
    invoke-static {p1}, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->access$600(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->logName:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {p1}, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->access$700(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iput-boolean v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->isUseExternalFile:Z

    .line 58
    .line 59
    invoke-static {p1}, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->access$800(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iput-boolean v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->recordLogContentOnly:Z

    .line 64
    .line 65
    invoke-static {p1}, Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;->access$900(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iput-boolean p1, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->useOriginFileName:Z

    .line 70
    .line 71
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;Lcom/tencent/could/component/common/ai/log/AiLogConfig$a;)V
    .locals 0

    .line 72
    invoke-direct {p0, p1}, Lcom/tencent/could/component/common/ai/log/AiLogConfig;-><init>(Lcom/tencent/could/component/common/ai/log/AiLogConfig$AiLogConfigBuilder;)V

    return-void
.end method


# virtual methods
.method public getDefaultTag()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->defaultTag:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDirLog()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->dirLog:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFileOutTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->fileOutTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getLogName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->logName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMinLevel()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->minLevel:I

    .line 2
    .line 3
    return p0
.end method

.method public isLogCat()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->isLogCat:Z

    .line 2
    .line 3
    return p0
.end method

.method public isOpen()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->isOpen:Z

    .line 2
    .line 3
    return p0
.end method

.method public isRecordLogContentOnly()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->recordLogContentOnly:Z

    .line 2
    .line 3
    return p0
.end method

.method public isUseExternalFile()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->isUseExternalFile:Z

    .line 2
    .line 3
    return p0
.end method

.method public isUseOriginFileName()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->useOriginFileName:Z

    .line 2
    .line 3
    return p0
.end method
