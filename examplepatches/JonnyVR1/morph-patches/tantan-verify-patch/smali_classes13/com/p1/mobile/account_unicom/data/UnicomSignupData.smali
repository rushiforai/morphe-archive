.class public Lcom/p1/mobile/account_unicom/data/UnicomSignupData;
.super Lcom/p1/mobile/account_core/request_data/SignupData;
.source "SourceFile"


# instance fields
.field final operatorType:Lcom/p1/mobile/account_core/request_data/OperatorType;

.field private password:Ljava/lang/String;

.field public providerToken:Ljava/lang/String;

.field public providerType:Lcom/p1/mobile/account_core/request_data/ProviderType;

.field public signupType:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/p1/mobile/account_unicom/data/UnicomSignupData;->operatorType:Lcom/p1/mobile/account_core/request_data/OperatorType;

    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/account_core/request_data/ProviderType;->china_unicom:Lcom/p1/mobile/account_core/request_data/ProviderType;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/account_unicom/data/UnicomSignupData;->providerType:Lcom/p1/mobile/account_core/request_data/ProviderType;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public setPassword(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/j;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/account_unicom/data/UnicomSignupData;->password:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method
