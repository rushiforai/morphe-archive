.class Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"


# static fields
.field private static DATA_JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;",
            ">;"
        }
    .end annotation
.end field

.field private static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public action:Ljava/lang/String;

.field public code:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;->DATA_JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/zhi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;-><init>()V

    return-void
.end method

.method public static bridge synthetic a()Lcom/tantanapp/common/data/JsonAdapter;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/presenter/FetchVerifyCodeHelper$VerifyCodeResponse;->DATA_JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    return-object v0
.end method
