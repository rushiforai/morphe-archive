.class public Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public huiYanLiveMode:Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;

.field public license:Ljava/lang/String;

.field public licenseStr:Ljava/lang/String;

.field public modelPath:Ljava/lang/String;

.field public openCheckRiskMode:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->license:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->licenseStr:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->modelPath:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->openCheckRiskMode:Z

    .line 14
    .line 15
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;->ACTION_REFLECT_MODE:Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->huiYanLiveMode:Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public getHuiYanLiveMode()Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->huiYanLiveMode:Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLicense()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->license:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLicenseStr()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->licenseStr:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getModelPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->modelPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isOpenCheckRiskMode()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->openCheckRiskMode:Z

    .line 2
    .line 3
    return p0
.end method

.method public setHuiYanLiveMode(Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->huiYanLiveMode:Lcom/tencent/could/huiyansdk/enums/HuiYanLiveMode;

    .line 2
    .line 3
    return-void
.end method

.method public setLicense(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->license:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setLicenseStr(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->licenseStr:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setModelPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->modelPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setOpenCheckRiskMode(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/huiyansdk/entity/HuiYanBaseConfig;->openCheckRiskMode:Z

    .line 2
    .line 3
    return-void
.end method
