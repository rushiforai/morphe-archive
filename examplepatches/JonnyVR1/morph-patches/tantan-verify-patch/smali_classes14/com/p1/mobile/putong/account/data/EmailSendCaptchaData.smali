.class public Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;
.super Lcom/p1/mobile/putong/account/data/EmailRequestData;
.source "SourceFile"


# instance fields
.field public action:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

.field public captcha:Ll/og4;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "captcha"
    .end annotation
.end field

.field public captchaToken:Ljava/lang/String;

.field public captchaValue:Ljava/lang/String;

.field public category:Lcom/p1/mobile/account_phone/data/CaptchaCategory;

.field public codeLength:I

.field public language:Ljava/lang/String;

.field public mmuid:Ljava/lang/String;

.field public mmuidv2:Ljava/lang/String;

.field public mmuidv3:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/data/EmailRequestData;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;->codeLength:I

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/account_phone/data/CaptchaCategory;->text:Lcom/p1/mobile/account_phone/data/CaptchaCategory;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;->category:Lcom/p1/mobile/account_phone/data/CaptchaCategory;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public checkNull()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/account_core/request_data/RequestData;->checkNull()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;->language:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget v0, p0, Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;->codeLength:I

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;->action:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/account/data/EmailSendCaptchaData;->category:Lcom/p1/mobile/account_phone/data/CaptchaCategory;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const-string p0, "parameter should not empty! "

    .line 26
    .line 27
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
