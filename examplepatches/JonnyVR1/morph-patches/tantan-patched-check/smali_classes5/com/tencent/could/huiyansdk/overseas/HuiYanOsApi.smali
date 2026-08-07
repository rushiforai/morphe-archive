.class public Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApi;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getVersion()Ljava/lang/String;
    .locals 1

    const-string v0, "v1.0.9.36"

    return-object v0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->init(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static release()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->release()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static setAuthEventCallBack(Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->setAuthEventCallBack(Lcom/tencent/could/huiyansdk/api/HuiYanAuthEventCallBack;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static setResultDataCallBack(Lcom/tencent/could/huiyansdk/api/HuiYanResultDataCallBack;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->setResultDataCallBack(Lcom/tencent/could/huiyansdk/api/HuiYanResultDataCallBack;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static startAuthByLightData(Ljava/lang/String;Lcom/tencent/could/huiyansdk/overseas/HuiYanResultCallBack;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->startAuthByLightData(Ljava/lang/String;Lcom/tencent/could/huiyansdk/overseas/HuiYanResultCallBack;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static startGetAuthConfigData(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->startGetAuthConfigData(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static startHuiYanAuth(Ljava/lang/String;Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0, p1, p2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->startHuiYanAuth(Ljava/lang/String;Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
