.class public Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;
.super Lcom/tantanapp/common/network/ApiExcep$Client$BadRequest;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/api/api/TantanException$Client;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CoreService"
.end annotation


# static fields
.field public static final AUTOPAYCANCEL:I = 0xbea5

.field public static final AUTOPAYLIMIT:I = 0xbea4

.field public static final FACE_NOT_FOUND:I = 0x9c43

.field public static final GIFT_MESSAGE_NOT_IN_GROUP:I = 0xa410

.field public static final HASPRIVILEGE:I = 0xbea3

.field public static final MATCH_HAS_EXISTED:I = 0x9c52

.field public static final NUMLIMIT:I = 0x3d0967

.field public static final OTHER_USER_BANNED:I = 0x9c6c

.field public static final OTHER_USER_INACTIVATED:I = 0x9c6d

.field public static final OTHER_USER_ISJAILED:I = 0x9c6a

.field public static final PRIVILEGE_TAKE_FAIL_OUT_OF_CONDITION:I = 0x3d09c9

.field public static final PRIVILEGE_TAKE_FAIL_REPEATED:I = 0x3d09cb

.field public static final SEND_LETTER_CONTENT_ILLEGAL:I = 0x9ca3

.field public static final USERLEFT:I = 0x3d0966

.field public static final USER_ISJAILED:I = 0x9c69


# instance fields
.field public final code:I

.field public final metaMessage:Ljava/lang/String;

.field public final subCode:I


# direct methods
.method public constructor <init>(Ll/i5d0;Lcom/p1/mobile/putong/data/Meta;)V
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

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
    iget p1, p2, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 11
    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 13
    .line 14
    iget p1, p2, Lcom/p1/mobile/putong/data/Meta;->subCode:I

    .line 15
    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->subCode:I

    .line 17
    .line 18
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method
