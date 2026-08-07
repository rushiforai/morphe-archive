.class public Lcom/p1/mobile/account_cosmos/data/CosmosBindPhoneData;
.super Lcom/p1/mobile/account_core/request_data/RequestData;
.source "SourceFile"


# instance fields
.field public accessCode:Ljava/lang/String;

.field public operatorType:Lcom/p1/mobile/account_core/request_data/OperatorType;

.field public providerToken:Ljava/lang/String;

.field final providerType:Lcom/p1/mobile/account_core/request_data/ProviderType;

.field public providerUserId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/account_core/request_data/RequestData;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/account_core/request_data/ProviderType;->cosmos:Lcom/p1/mobile/account_core/request_data/ProviderType;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/account_cosmos/data/CosmosBindPhoneData;->providerType:Lcom/p1/mobile/account_core/request_data/ProviderType;

    .line 7
    .line 8
    return-void
.end method
