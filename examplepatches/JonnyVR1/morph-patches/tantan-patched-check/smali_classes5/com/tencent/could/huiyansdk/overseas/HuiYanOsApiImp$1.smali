.class public Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/could/huiyansdk/api/b;


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
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$1;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onBuriedPointCallBack(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onOperateTimeEvent(Ljava/lang/String;IZLjava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/tencent/could/huiyansdk/operate/a$b;->a:Lcom/tencent/could/huiyansdk/operate/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/tencent/could/huiyansdk/operate/a;->a(Ljava/lang/String;IZLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onPrepare(Lcom/tencent/could/huiyansdk/api/d;)V
    .locals 2

    .line 1
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    const-string p1, "onPrepare!"

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    const-string v1, "HuiYanOsApiImp"

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onStreamRiskDataSuccess(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    const-string p1, "onStreamRiskDataSuccess!"

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    const-string v1, "HuiYanOsApiImp"

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onTuringFaceDataSuccess(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    const-string p1, "onTuringFaceDataSuccess!"

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    const-string v1, "HuiYanOsApiImp"

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public updateOperateInfo(Ljava/lang/String;IJLjava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/tencent/could/huiyansdk/operate/a$b;->a:Lcom/tencent/could/huiyansdk/operate/a;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Lcom/tencent/could/huiyansdk/operate/a;->a(Ljava/lang/String;IJLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
