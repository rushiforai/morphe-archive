.class public Lcom/p1/mobile/account_phone/data/PhoneSignupData;
.super Lcom/p1/mobile/account_core/request_data/SignupData;
.source "SourceFile"


# instance fields
.field public code:I

.field public countryCode:I

.field public mobileNumber:Ljava/lang/String;

.field private password:Ljava/lang/String;

.field public signupType:Ljava/lang/String;

.field public thirdPartyAccount:Lcom/p1/mobile/account_core/request_data/ThirdPartyAccount;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/account_core/request_data/SignupData;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public checkNull()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/account_core/request_data/SignupData;->checkNull()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/j;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/account_phone/data/PhoneSignupData;->password:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method
