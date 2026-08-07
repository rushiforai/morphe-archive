.class public Lcom/p1/mobile/account_mobile/data/MobileSignupData;
.super Lcom/p1/mobile/account_core/request_data/SignupData;
.source "SourceFile"


# instance fields
.field public operatorType:Lcom/p1/mobile/account_core/request_data/OperatorType;

.field private password:Ljava/lang/String;

.field public providerToken:Ljava/lang/String;

.field final providerType:Lcom/p1/mobile/account_core/request_data/ProviderType;

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
    sget-object v0, Lcom/p1/mobile/account_core/request_data/ProviderType;->china_mobile:Lcom/p1/mobile/account_core/request_data/ProviderType;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/account_mobile/data/MobileSignupData;->providerType:Lcom/p1/mobile/account_core/request_data/ProviderType;

    .line 7
    .line 8
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
    iput-object p1, p0, Lcom/p1/mobile/account_mobile/data/MobileSignupData;->password:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method
