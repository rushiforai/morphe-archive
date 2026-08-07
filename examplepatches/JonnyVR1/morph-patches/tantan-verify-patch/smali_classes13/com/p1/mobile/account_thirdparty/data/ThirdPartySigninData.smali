.class public Lcom/p1/mobile/account_thirdparty/data/ThirdPartySigninData;
.super Lcom/p1/mobile/account_core/request_data/ThirdPartySigninBaseData;
.source "SourceFile"


# instance fields
.field public thirdPartyType:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/account_core/request_data/ThirdPartySigninBaseData;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "wechat"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/account_thirdparty/data/ThirdPartySigninData;->thirdPartyType:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method
