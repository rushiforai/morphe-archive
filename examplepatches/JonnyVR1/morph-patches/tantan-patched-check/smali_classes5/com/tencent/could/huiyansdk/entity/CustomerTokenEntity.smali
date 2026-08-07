.class public Lcom/tencent/could/huiyansdk/entity/CustomerTokenEntity;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public createTime:J

.field public faceIdToken:Ljava/lang/String;

.field public isSuccess:Z


# direct methods
.method public constructor <init>(ZLjava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/tencent/could/huiyansdk/entity/CustomerTokenEntity;->createTime:J

    .line 7
    .line 8
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/CustomerTokenEntity;->isSuccess:Z

    .line 9
    .line 10
    iput-object p2, p0, Lcom/tencent/could/huiyansdk/entity/CustomerTokenEntity;->faceIdToken:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 13
    .line 14
    .line 15
    move-result-wide p1

    .line 16
    iput-wide p1, p0, Lcom/tencent/could/huiyansdk/entity/CustomerTokenEntity;->createTime:J

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public getCreateTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/could/huiyansdk/entity/CustomerTokenEntity;->createTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getFaceIdToken()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/CustomerTokenEntity;->faceIdToken:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isSuccess()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/CustomerTokenEntity;->isSuccess:Z

    .line 2
    .line 3
    return p0
.end method

.method public reset()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/CustomerTokenEntity;->isSuccess:Z

    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/CustomerTokenEntity;->faceIdToken:Ljava/lang/String;

    .line 7
    .line 8
    const-wide/16 v0, -0x1

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/tencent/could/huiyansdk/entity/CustomerTokenEntity;->createTime:J

    .line 11
    .line 12
    return-void
.end method

.method public updateTokenEntity(ZLjava/lang/String;)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/CustomerTokenEntity;->isSuccess:Z

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/could/huiyansdk/entity/CustomerTokenEntity;->faceIdToken:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide p1

    .line 9
    iput-wide p1, p0, Lcom/tencent/could/huiyansdk/entity/CustomerTokenEntity;->createTime:J

    .line 10
    .line 11
    return-void
.end method
