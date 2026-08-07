.class public Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;
.super Lcom/tantanapp/common/network/ApiExcep$Client$BadRequest;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/api/api/TantanException$Client;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AccountService"
.end annotation


# static fields
.field public static final ACCOUNT_BIND_PHONE_INTERVAL_TOO_SHORT:I = 0x61b12

.field public static final ACCOUNT_DELETE:I = 0x9c53

.field public static final ACCOUNT_INVALID_ACCESS_TOKEN:I = 0x9c5a

.field public static final ACCOUNT_PASSWORD_FAIL:I = 0x9c4c

.field public static final ACCOUNT_QUESTION_LIMIT:I = 0x9c90

.field public static final ACCOUNT_SPAM_ALREADY_REGISTERED:I = 0x9c7d

.field public static final ACCOUNT_SPAM_NO_REGISTERED:I = 0x9c7e

.field public static final ACCOUNT_VERIFY_CODE_ERROR_LIMIT:I = 0x9c5f

.field public static final BIND_PHONE_ALREADY_REGISTERED:I = 0x9c7c

.field public static final CHINA_MOBILE_NOT_SIGN_UP:I = 0x9c50

.field public static final CONF_CODE_EXPIRED:I = 0x9c4f

.field public static final ERROR_ACCOUNT_CHANGE_PHONE_FORBIDDEN:I = 0x9c7f

.field public static final ERROR_ACCOUNT_PICTURE_VERIFY:I = 0x9c80

.field public static final ERROR_DEVICE_NOT_FOUND:I = 0x9c5c

.field public static final ERROR_DEVICE_NOT_FOUND_OLD_DEVICE:I = 0x9c4b

.field public static final ERROR_JIYAN_VERIFY:I = 0x6263b

.field public static final ERROR_VERIFY_EMAIL_FORMAT:I = 0x9c43

.field public static final ERROR_VERIFY_EMAIL_FREQUENTLY:I = 0x9c9a

.field public static final GENERAL_BAD_REQUEST:I = 0x9c40

.field public static final INACTIVATED:I = 0x9c54

.field public static final INACTIVATED_15DAYS:I = 0x9c9b

.field public static final INVALID_SMS_CODE:I = 0x9c4e

.field public static final INVALID_THIRD_PARTY_INFO:I = 0x9c64

.field public static final INVALID_THIRD_PARTY_TOKEN:I = 0x9c63

.field public static final NEW_DEVICE_SIGN_IN:I = 0x9c56

.field public static final SHORT_PASSWORD:I = 0x9c48

.field public static final SIGN_UP_PHONE_EXIST:I = 0x9c4b

.field public static final THIRD_PARTY_TYPE_INVALID:I = 0x9c61

.field public static final THIRD_PARTY_USER_EXIST:I = 0x9c65

.field public static final VERIFY_CURRENT_PASSWORD:I = 0x9c55


# instance fields
.field public final code:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 15
    invoke-direct {p0, v0, p2}, Lcom/tantanapp/common/network/ApiExcep$Client$BadRequest;-><init>(Ll/i5d0;Ljava/lang/String;)V

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    return-void
.end method

.method public constructor <init>(Ll/i5d0;Lcom/p1/mobile/putong/data/AccountErrorResponse;)V
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/AccountErrorResponse;->message:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "no message"

    .line 6
    .line 7
    :cond_0
    invoke-direct {p0, p1, v0}, Lcom/tantanapp/common/network/ApiExcep$Client$BadRequest;-><init>(Ll/i5d0;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget p1, p2, Lcom/p1/mobile/putong/data/AccountErrorResponse;->code:I

    .line 11
    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 13
    .line 14
    return-void
.end method
