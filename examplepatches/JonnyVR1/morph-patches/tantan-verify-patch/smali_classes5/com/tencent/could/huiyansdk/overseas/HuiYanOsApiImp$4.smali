.class public Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->startHuiYanAuth(Ljava/lang/String;Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;)V
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
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp$4;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFail(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->sendAuthOnFail(ILjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->sendAuthGetLive(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
