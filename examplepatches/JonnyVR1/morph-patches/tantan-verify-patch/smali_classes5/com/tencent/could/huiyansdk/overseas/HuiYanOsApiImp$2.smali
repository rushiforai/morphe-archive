.class public Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/could/huiyansdk/api/f;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->realStartGetAuthConfigData(ZLcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$2;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCompareSuccess(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 1
    sget-object p0, Lcom/tencent/could/huiyansdk/operate/a$b;->a:Lcom/tencent/could/huiyansdk/operate/a;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v5

    .line 11
    const-string v1, "LocalCheck"

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    const-wide/16 v3, 0x1

    .line 15
    .line 16
    invoke-virtual/range {v0 .. v6}, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->updateInfo(Ljava/lang/String;IJJ)V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, p1, p2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->sendResultSuccess(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onFail(ILjava/lang/String;)V
    .locals 6

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/operate/a$b;->a:Lcom/tencent/could/huiyansdk/operate/a;

    .line 2
    .line 3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "code: "

    .line 6
    .line 7
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " msg: "

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    const/4 v2, 0x1

    .line 26
    const-wide/16 v3, 0x0

    .line 27
    .line 28
    const-string v1, "LocalCheck"

    .line 29
    .line 30
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/could/huiyansdk/operate/a;->a(Ljava/lang/String;IJLjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0, p1, p2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->sendFailBackCall(ILjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onSelectSuccess(Ljava/lang/String;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    const-string v1, "on select success!"

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    const-string v3, "HuiYanOsApiImp"

    .line 7
    .line 8
    invoke-virtual {v0, v2, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$2;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 12
    .line 13
    invoke-static {p0, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->access$100(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
