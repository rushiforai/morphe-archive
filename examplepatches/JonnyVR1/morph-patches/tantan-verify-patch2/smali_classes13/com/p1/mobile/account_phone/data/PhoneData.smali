.class public Lcom/p1/mobile/account_phone/data/PhoneData;
.super Lcom/p1/mobile/account_core/request_data/RequestData;
.source "SourceFile"


# instance fields
.field public countryCode:I

.field public mobileNumber:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/account_core/request_data/RequestData;-><init>()V

    .line 2
    .line 3
    .line 4
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
    iget-object v0, p0, Lcom/p1/mobile/account_phone/data/PhoneData;->mobileNumber:Ljava/lang/String;

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
    iget p0, p0, Lcom/p1/mobile/account_phone/data/PhoneData;->countryCode:I

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string p0, "mobileNumber or countryCode should not empty! "

    .line 18
    .line 19
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
