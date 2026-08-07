.class public Lcom/tencent/rtmp/TXPlayerAuthBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field appId:I

.field exper:I

.field fileId:Ljava/lang/String;

.field protected isHttps:Z

.field sign:Ljava/lang/String;

.field timeout:Ljava/lang/String;

.field us:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/tencent/rtmp/TXPlayerAuthBuilder;->exper:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public getAppId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/rtmp/TXPlayerAuthBuilder;->appId:I

    .line 2
    .line 3
    return p0
.end method

.method public getExper()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/rtmp/TXPlayerAuthBuilder;->exper:I

    .line 2
    .line 3
    return p0
.end method

.method public getFileId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXPlayerAuthBuilder;->fileId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSign()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXPlayerAuthBuilder;->sign:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTimeout()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXPlayerAuthBuilder;->timeout:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUs()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/TXPlayerAuthBuilder;->us:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isHttps()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/rtmp/TXPlayerAuthBuilder;->isHttps:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAppId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/rtmp/TXPlayerAuthBuilder;->appId:I

    .line 2
    .line 3
    return-void
.end method

.method public setExper(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/rtmp/TXPlayerAuthBuilder;->exper:I

    .line 2
    .line 3
    return-void
.end method

.method public setFileId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/TXPlayerAuthBuilder;->fileId:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setHttps(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/rtmp/TXPlayerAuthBuilder;->isHttps:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSign(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/TXPlayerAuthBuilder;->sign:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTimeout(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/TXPlayerAuthBuilder;->timeout:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setUs(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/TXPlayerAuthBuilder;->us:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
