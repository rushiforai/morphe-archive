.class public Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;
.super Lcom/tantanapp/common/network/ApiExcep$Client$Forbidden;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/api/api/TantanException$Client;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TantanForbidden"
.end annotation


# static fields
.field private static final CANNOT_MODIFY:I = 0x9d76

.field public static final COMMUNICATION_BE_BLACKLIST:I = 0x9d74

.field public static final COMMUNICATION_CONNECT_HIDE:I = 0x9d75

.field private static final ERROR_HAS_REJECTED:I = 0x9d72

.field public static final FOLLOW_SETTING_FORBIDDEN:I = 0xa046

.field private static final ID_CARD_AUTHING:I = 0x9d73

.field public static final LETTER_PRIVILEGE_NOT_ENOUGH:I = 0x9d83

.field private static final LIMITED_NUMBER_OF_MODIFICATIONS:I = 0x9d6e

.field public static final LIVE_ADMISSION_MESSAGE_LEVEL_NOT_ENOUGH_TO_CLOSE:I = 0x9d78

.field public static final LIVE_ADMISSION_MESSAGE_LEVEL_NOT_ENOUGH_TO_CLOSE_NEW:I = 0x9d7b

.field public static final LIVE_ADMISSION_MESSAGE_LEVEL_NOT_ENOUGH_TO_OPEN:I = 0x9d77

.field public static final MESSAGE_CONTENT_VERIFY_ILLEGAL:I = 0x9d85

.field public static final MESSAGE_DEL_CODE:I = 0x9d9a

.field public static final MESSAGE_INTR_RISK_ERROR:I = 0x9d99

.field public static final MESSAGE_LIMIT_BY_NO_SEE_TRIAL_PRIVILEGE:I = 0x9d94

.field public static final MESSAGE_SENSITIVE_VERIFY_CODE:I = 0x9d93

.field private static final OTHERNOT_VERFIED:I = 0x9d71

.field public static final USER_BLOCKED_YOU:I = 0x9d6d


# instance fields
.field public code:I

.field public hasHandle:Z

.field public message:Ljava/lang/String;

.field public subCode:I


# direct methods
.method public constructor <init>(Ll/i5d0;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Lcom/tantanapp/common/network/ApiExcep$Client$Forbidden;-><init>(Ll/i5d0;)V

    const/4 p1, 0x0

    .line 23
    iput-boolean p1, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->hasHandle:Z

    return-void
.end method

.method public constructor <init>(Ll/i5d0;Lcom/p1/mobile/putong/data/Meta;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/common/network/ApiExcep$Client$Forbidden;-><init>(Ll/i5d0;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->hasHandle:Z

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget p1, p2, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 10
    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 12
    .line 13
    iget p1, p2, Lcom/p1/mobile/putong/data/Meta;->subCode:I

    .line 14
    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->subCode:I

    .line 16
    .line 17
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public static isIllegalContent(Ljava/lang/Throwable;)Z
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 8
    .line 9
    const v0, 0x9d85

    .line 10
    .line 11
    .line 12
    if-ne p0, v0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method


# virtual methods
.method public isBlocked()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v0, 0x9d6d

    .line 4
    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public isCannotModify()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v0, 0x9d76

    .line 4
    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public isCannotModifyExceedLimt()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v0, 0x9d6e

    .line 4
    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public isFollowForbidden()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v0, 0xa046

    .line 4
    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public isIdCardAuthing()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v0, 0x9d73

    .line 4
    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public isLetterNotEnough()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v0, 0x9d83

    .line 4
    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public isLevelNotEnoughToClose()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v0, 0x9d78

    .line 4
    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public isLevelNotEnoughToCloseNew()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v0, 0x9d7b

    .line 4
    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public isLevelNotEnoughToOpen()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v0, 0x9d77

    .line 4
    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public isOtherNotVerify()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v0, 0x9d71

    .line 4
    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public isRejectedContact()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v0, 0x9d72

    .line 4
    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method
