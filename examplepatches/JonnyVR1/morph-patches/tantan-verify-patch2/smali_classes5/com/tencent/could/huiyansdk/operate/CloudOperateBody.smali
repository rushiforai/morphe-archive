.class public abstract Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public actions:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "Actions"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->initData()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public abstract initData()V
.end method

.method public abstract reset()V
.end method

.method public updateInfo(Ljava/lang/String;IJJ)V
    .locals 8

    const-string v7, ""

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-wide v3, p3

    move-wide v5, p5

    .line 43
    invoke-virtual/range {v0 .. v7}, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->updateInfo(Ljava/lang/String;IJJLjava/lang/String;)V

    return-void
.end method

.method public updateInfo(Ljava/lang/String;IJJLjava/lang/String;)V
    .locals 7

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->actions:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    move-object v1, v0

    .line 18
    check-cast v1, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->getAction()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    move v2, p2

    .line 33
    move-wide v3, p3

    .line 34
    move-wide v5, p5

    .line 35
    invoke-virtual/range {v1 .. v6}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->updateInfo(IJJ)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, p7}, Lcom/tencent/could/huiyansdk/operate/CloudOperateItem;->setInfo(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    return-void
.end method
