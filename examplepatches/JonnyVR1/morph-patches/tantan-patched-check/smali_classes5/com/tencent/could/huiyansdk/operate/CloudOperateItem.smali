.class public Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public action:Ljava/lang/String;

.field public done:I

.field public info:Ljava/lang/String;

.field public timestamp:J

.field public value:J


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->done:I

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->value:J

    .line 10
    .line 11
    const-string v2, ""

    .line 12
    .line 13
    iput-object v2, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->info:Ljava/lang/String;

    .line 14
    .line 15
    iput-wide v0, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->timestamp:J

    .line 16
    .line 17
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->action:Ljava/lang/String;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public getAction()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->action:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDone()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->done:I

    .line 2
    .line 3
    return p0
.end method

.method public getInfo()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->info:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTimestamp()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->timestamp:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getValue()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->value:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public setAction(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->action:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setDone(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->done:I

    .line 2
    .line 3
    return-void
.end method

.method public setInfo(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->info:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTimestamp(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->timestamp:J

    .line 2
    .line 3
    return-void
.end method

.method public setValue(I)V
    .locals 2

    .line 1
    int-to-long v0, p1

    .line 2
    iput-wide v0, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->value:J

    .line 3
    .line 4
    return-void
.end method

.method public updateInfo(IJJ)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->done:I

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->value:J

    .line 4
    .line 5
    iput-wide p4, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->timestamp:J

    .line 6
    .line 7
    return-void
.end method
