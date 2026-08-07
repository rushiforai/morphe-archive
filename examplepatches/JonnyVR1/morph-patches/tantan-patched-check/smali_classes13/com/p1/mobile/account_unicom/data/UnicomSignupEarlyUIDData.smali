.class public Lcom/p1/mobile/account_unicom/data/UnicomSignupEarlyUIDData;
.super Lcom/p1/mobile/account_core/request_data/SignupData;
.source "SourceFile"


# instance fields
.field final operatorType:Lcom/p1/mobile/account_core/request_data/OperatorType;

.field public providerToken:Ljava/lang/String;

.field public providerType:Lcom/p1/mobile/account_core/request_data/ProviderType;

.field public providerUserId:Ljava/lang/String;

.field public thirdPartyAccount:Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/account_core/request_data/SignupData;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/account_core/request_data/OperatorType;->china_unicom:Lcom/p1/mobile/account_core/request_data/OperatorType;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/account_unicom/data/UnicomSignupEarlyUIDData;->operatorType:Lcom/p1/mobile/account_core/request_data/OperatorType;

    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/account_core/request_data/ProviderType;->china_unicom:Lcom/p1/mobile/account_core/request_data/ProviderType;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/account_unicom/data/UnicomSignupEarlyUIDData;->providerType:Lcom/p1/mobile/account_core/request_data/ProviderType;

    .line 11
    .line 12
    return-void
.end method
