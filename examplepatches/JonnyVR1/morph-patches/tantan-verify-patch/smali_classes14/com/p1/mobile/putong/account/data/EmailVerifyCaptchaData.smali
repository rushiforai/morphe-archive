.class public Lcom/p1/mobile/putong/account/data/EmailVerifyCaptchaData;
.super Lcom/p1/mobile/putong/account/data/EmailRequestData;
.source "SourceFile"


# instance fields
.field public action:Lcom/p1/mobile/account_phone/data/CaptchaAction;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/data/EmailRequestData;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public checkNull()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/account_core/request_data/RequestData;->checkNull()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/EmailVerifyCaptchaData;->action:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "parameter should not empty! "

    .line 10
    .line 11
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
