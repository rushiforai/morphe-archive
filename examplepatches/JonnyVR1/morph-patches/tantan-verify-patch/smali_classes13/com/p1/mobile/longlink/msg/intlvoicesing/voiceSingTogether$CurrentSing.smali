.class public final Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSingOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "CurrentSing"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;",
        "Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSingOrBuilder;"
    }
.end annotation


# static fields
.field public static final ACCOMPANY_FIELD_NUMBER:I = 0x8

.field public static final COVER_FIELD_NUMBER:I = 0x4

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

.field public static final HASSTART_FIELD_NUMBER:I = 0xb

.field public static final LYRICTYPE_FIELD_NUMBER:I = 0x6

.field public static final LYRICURL_FIELD_NUMBER:I = 0x7

.field public static final MASK_FIELD_NUMBER:I = 0x2

.field public static final ORDERID_FIELD_NUMBER:I = 0xa

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROGRESSMILLISECONDS_FIELD_NUMBER:I = 0x9

.field public static final SONGCODE_FIELD_NUMBER:I = 0x5

.field public static final TITLE_FIELD_NUMBER:I = 0x3

.field public static final USERID_FIELD_NUMBER:I = 0x1


# instance fields
.field private accompany_:Ljava/lang/String;

.field private cover_:Ljava/lang/String;

.field private hasStart_:Z

.field private lyricType_:Ljava/lang/String;

.field private lyricUrl_:Ljava/lang/String;

.field private mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

.field private orderId_:J

.field private progressMilliseconds_:I

.field private songCode_:Ljava/lang/String;

.field private title_:Ljava/lang/String;

.field private userId_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->makeImmutable()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->userId_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->title_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->cover_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->songCode_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricType_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricUrl_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->accompany_:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->setSongCodeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->setTitle(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->setTitleBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->setUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->setUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic F()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->clearAccompany()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->clearCover()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->clearHasStart()V

    return-void
.end method

.method private clearAccompany()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getAccompany()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->accompany_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearCover()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getCover()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->cover_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearHasStart()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->hasStart_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearLyricType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getLyricType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLyricUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getLyricUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearMask()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 3
    .line 4
    return-void
.end method

.method private clearOrderId()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->orderId_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearProgressMilliseconds()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->progressMilliseconds_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearSongCode()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getSongCode()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->songCode_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTitle()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getTitle()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->title_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->userId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->clearLyricType()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->clearLyricUrl()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->clearMask()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->clearOrderId()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->clearProgressMilliseconds()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->clearSongCode()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->clearTitle()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->clearUserId()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->mergeMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->setAccompany(Ljava/lang/String;)V

    return-void
.end method

.method private mergeMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->newBuilder(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->setAccompanyBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->setCover(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->setCoverBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->getParserForType()Ll/ng60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->setHasStart(Z)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->setLyricType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->setLyricTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private setAccompany(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->accompany_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAccompanyBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->accompany_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setCover(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->cover_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setCoverBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->cover_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setHasStart(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->hasStart_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setLyricType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setLyricTypeBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricType_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setLyricUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setLyricUrlBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 8
    .line 9
    return-void
.end method

.method private setMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    return-void
.end method

.method private setOrderId(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->orderId_:J

    .line 2
    .line 3
    return-void
.end method

.method private setProgressMilliseconds(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->progressMilliseconds_:I

    .line 2
    .line 3
    return-void
.end method

.method private setSongCode(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->songCode_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setSongCodeBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->songCode_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTitle(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->title_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setTitleBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->title_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->userId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUserIdBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->userId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->setLyricUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->setLyricUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->setMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->setMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->setOrderId(J)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->setProgressMilliseconds(I)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->setSongCode(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v0, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    packed-switch p1, :pswitch_data_0

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/l710;->a()V

    .line 16
    .line 17
    .line 18
    return-object v1

    .line 19
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->PARSER:Ll/ng60;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    move-object p1, v0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    :goto_0
    monitor-exit p0

    .line 44
    goto :goto_2

    .line 45
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    throw p1

    .line 47
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->PARSER:Ll/ng60;

    .line 48
    .line 49
    return-object p0

    .line 50
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 51
    .line 52
    check-cast p3, Lcom/google/protobuf/h;

    .line 53
    .line 54
    :cond_2
    :goto_3
    if-nez v0, :cond_4

    .line 55
    .line 56
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    sparse-switch p1, :sswitch_data_0

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_2

    .line 68
    .line 69
    :sswitch_0
    move v0, v2

    .line 70
    goto :goto_3

    .line 71
    :catch_0
    move-exception v0

    .line 72
    move-object p1, v0

    .line 73
    goto/16 :goto_5

    .line 74
    .line 75
    :catch_1
    move-exception v0

    .line 76
    move-object p1, v0

    .line 77
    goto/16 :goto_6

    .line 78
    .line 79
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->hasStart_:Z

    .line 84
    .line 85
    goto :goto_3

    .line 86
    :sswitch_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 87
    .line 88
    .line 89
    move-result-wide v3

    .line 90
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->orderId_:J

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :sswitch_3
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    iput p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->progressMilliseconds_:I

    .line 98
    .line 99
    goto :goto_3

    .line 100
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->accompany_:Ljava/lang/String;

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricUrl_:Ljava/lang/String;

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricType_:Ljava/lang/String;

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->songCode_:Ljava/lang/String;

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->cover_:Ljava/lang/String;

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->title_:Ljava/lang/String;

    .line 140
    .line 141
    goto :goto_3

    .line 142
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 143
    .line 144
    if-eqz p1, :cond_3

    .line 145
    .line 146
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 151
    .line 152
    goto :goto_4

    .line 153
    :cond_3
    move-object p1, v1

    .line 154
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->parser()Ll/ng60;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    check-cast v3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 163
    .line 164
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 165
    .line 166
    if-eqz p1, :cond_2

    .line 167
    .line 168
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 169
    .line 170
    .line 171
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 176
    .line 177
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 178
    .line 179
    goto :goto_3

    .line 180
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->userId_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 185
    .line 186
    goto/16 :goto_3

    .line 187
    .line 188
    :catchall_1
    move-exception v0

    .line 189
    move-object p0, v0

    .line 190
    throw p0

    .line 191
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 192
    .line 193
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 205
    .line 206
    .line 207
    return-object v1

    .line 208
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 213
    .line 214
    .line 215
    return-object v1

    .line 216
    :cond_4
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 217
    .line 218
    return-object p0

    .line 219
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 220
    .line 221
    check-cast p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 222
    .line 223
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->userId_:Ljava/lang/String;

    .line 224
    .line 225
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    xor-int/2addr p1, v2

    .line 230
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->userId_:Ljava/lang/String;

    .line 231
    .line 232
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->userId_:Ljava/lang/String;

    .line 233
    .line 234
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 235
    .line 236
    .line 237
    move-result v3

    .line 238
    xor-int/2addr v3, v2

    .line 239
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->userId_:Ljava/lang/String;

    .line 240
    .line 241
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->userId_:Ljava/lang/String;

    .line 246
    .line 247
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 248
    .line 249
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 250
    .line 251
    invoke-interface {p2, p1, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 256
    .line 257
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 258
    .line 259
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->title_:Ljava/lang/String;

    .line 260
    .line 261
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 262
    .line 263
    .line 264
    move-result p1

    .line 265
    xor-int/2addr p1, v2

    .line 266
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->title_:Ljava/lang/String;

    .line 267
    .line 268
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->title_:Ljava/lang/String;

    .line 269
    .line 270
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 271
    .line 272
    .line 273
    move-result v3

    .line 274
    xor-int/2addr v3, v2

    .line 275
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->title_:Ljava/lang/String;

    .line 276
    .line 277
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object p1

    .line 281
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->title_:Ljava/lang/String;

    .line 282
    .line 283
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->cover_:Ljava/lang/String;

    .line 284
    .line 285
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 286
    .line 287
    .line 288
    move-result p1

    .line 289
    xor-int/2addr p1, v2

    .line 290
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->cover_:Ljava/lang/String;

    .line 291
    .line 292
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->cover_:Ljava/lang/String;

    .line 293
    .line 294
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 295
    .line 296
    .line 297
    move-result v3

    .line 298
    xor-int/2addr v3, v2

    .line 299
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->cover_:Ljava/lang/String;

    .line 300
    .line 301
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->cover_:Ljava/lang/String;

    .line 306
    .line 307
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->songCode_:Ljava/lang/String;

    .line 308
    .line 309
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 310
    .line 311
    .line 312
    move-result p1

    .line 313
    xor-int/2addr p1, v2

    .line 314
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->songCode_:Ljava/lang/String;

    .line 315
    .line 316
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->songCode_:Ljava/lang/String;

    .line 317
    .line 318
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 319
    .line 320
    .line 321
    move-result v3

    .line 322
    xor-int/2addr v3, v2

    .line 323
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->songCode_:Ljava/lang/String;

    .line 324
    .line 325
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object p1

    .line 329
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->songCode_:Ljava/lang/String;

    .line 330
    .line 331
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricType_:Ljava/lang/String;

    .line 332
    .line 333
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 334
    .line 335
    .line 336
    move-result p1

    .line 337
    xor-int/2addr p1, v2

    .line 338
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricType_:Ljava/lang/String;

    .line 339
    .line 340
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricType_:Ljava/lang/String;

    .line 341
    .line 342
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 343
    .line 344
    .line 345
    move-result v3

    .line 346
    xor-int/2addr v3, v2

    .line 347
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricType_:Ljava/lang/String;

    .line 348
    .line 349
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object p1

    .line 353
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricType_:Ljava/lang/String;

    .line 354
    .line 355
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricUrl_:Ljava/lang/String;

    .line 356
    .line 357
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 358
    .line 359
    .line 360
    move-result p1

    .line 361
    xor-int/2addr p1, v2

    .line 362
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricUrl_:Ljava/lang/String;

    .line 363
    .line 364
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricUrl_:Ljava/lang/String;

    .line 365
    .line 366
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 367
    .line 368
    .line 369
    move-result v3

    .line 370
    xor-int/2addr v3, v2

    .line 371
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricUrl_:Ljava/lang/String;

    .line 372
    .line 373
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object p1

    .line 377
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricUrl_:Ljava/lang/String;

    .line 378
    .line 379
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->accompany_:Ljava/lang/String;

    .line 380
    .line 381
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 382
    .line 383
    .line 384
    move-result p1

    .line 385
    xor-int/2addr p1, v2

    .line 386
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->accompany_:Ljava/lang/String;

    .line 387
    .line 388
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->accompany_:Ljava/lang/String;

    .line 389
    .line 390
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 391
    .line 392
    .line 393
    move-result v3

    .line 394
    xor-int/2addr v3, v2

    .line 395
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->accompany_:Ljava/lang/String;

    .line 396
    .line 397
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object p1

    .line 401
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->accompany_:Ljava/lang/String;

    .line 402
    .line 403
    iget p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->progressMilliseconds_:I

    .line 404
    .line 405
    if-eqz p1, :cond_5

    .line 406
    .line 407
    move v1, v2

    .line 408
    goto :goto_7

    .line 409
    :cond_5
    move v1, v0

    .line 410
    :goto_7
    iget v3, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->progressMilliseconds_:I

    .line 411
    .line 412
    if-eqz v3, :cond_6

    .line 413
    .line 414
    move v4, v2

    .line 415
    goto :goto_8

    .line 416
    :cond_6
    move v4, v0

    .line 417
    :goto_8
    invoke-interface {p2, v1, p1, v4, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 418
    .line 419
    .line 420
    move-result p1

    .line 421
    iput p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->progressMilliseconds_:I

    .line 422
    .line 423
    move p1, v2

    .line 424
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->orderId_:J

    .line 425
    .line 426
    const-wide/16 v4, 0x0

    .line 427
    .line 428
    cmp-long v1, v2, v4

    .line 429
    .line 430
    if-eqz v1, :cond_7

    .line 431
    .line 432
    move v1, p1

    .line 433
    :goto_9
    move-wide v7, v4

    .line 434
    goto :goto_a

    .line 435
    :cond_7
    move v1, v0

    .line 436
    goto :goto_9

    .line 437
    :goto_a
    iget-wide v5, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->orderId_:J

    .line 438
    .line 439
    cmp-long v4, v5, v7

    .line 440
    .line 441
    if-eqz v4, :cond_8

    .line 442
    .line 443
    move v4, p1

    .line 444
    :goto_b
    move-object v0, p2

    .line 445
    goto :goto_c

    .line 446
    :cond_8
    move v4, v0

    .line 447
    goto :goto_b

    .line 448
    :goto_c
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 449
    .line 450
    .line 451
    move-result-wide p1

    .line 452
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->orderId_:J

    .line 453
    .line 454
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->hasStart_:Z

    .line 455
    .line 456
    iget-boolean p2, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->hasStart_:Z

    .line 457
    .line 458
    invoke-interface {v0, p1, p1, p2, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 459
    .line 460
    .line 461
    move-result p1

    .line 462
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->hasStart_:Z

    .line 463
    .line 464
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 465
    .line 466
    return-object p0

    .line 467
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing$Builder;

    .line 468
    .line 469
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing$Builder;-><init>(Ll/h6r0;)V

    .line 470
    .line 471
    .line 472
    return-object p0

    .line 473
    :pswitch_5
    return-object v1

    .line 474
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 475
    .line 476
    return-object p0

    .line 477
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 478
    .line 479
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;-><init>()V

    .line 480
    .line 481
    .line 482
    return-object p0

    .line 483
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch

    .line 484
    .line 485
    .line 486
    .line 487
    .line 488
    .line 489
    .line 490
    .line 491
    .line 492
    .line 493
    .line 494
    .line 495
    .line 496
    .line 497
    .line 498
    .line 499
    .line 500
    .line 501
    .line 502
    .line 503
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_b
        0x12 -> :sswitch_a
        0x1a -> :sswitch_9
        0x22 -> :sswitch_8
        0x2a -> :sswitch_7
        0x32 -> :sswitch_6
        0x3a -> :sswitch_5
        0x42 -> :sswitch_4
        0x48 -> :sswitch_3
        0x50 -> :sswitch_2
        0x58 -> :sswitch_1
    .end sparse-switch
.end method

.method public getAccompany()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->accompany_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAccompanyBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->accompany_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getCover()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->cover_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCoverBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->cover_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getHasStart()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->hasStart_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getLyricType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLyricTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricType_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getLyricUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLyricUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricUrl_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getOrderId()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->orderId_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getProgressMilliseconds()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->progressMilliseconds_:I

    .line 2
    .line 3
    return p0
.end method

.method public getSerializedSize()I
    .locals 5

    .line 1
    iget v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->userId_:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getUserId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v0, v1}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v0, 0x0

    .line 26
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    add-int/2addr v0, v1

    .line 40
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->title_:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x3

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getTitle()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    add-int/2addr v0, v1

    .line 58
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->cover_:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_4

    .line 65
    .line 66
    const/4 v1, 0x4

    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getCover()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    add-int/2addr v0, v1

    .line 76
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->songCode_:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-nez v1, :cond_5

    .line 83
    .line 84
    const/4 v1, 0x5

    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getSongCode()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    add-int/2addr v0, v1

    .line 94
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricType_:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-nez v1, :cond_6

    .line 101
    .line 102
    const/4 v1, 0x6

    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getLyricType()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    add-int/2addr v0, v1

    .line 112
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricUrl_:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-nez v1, :cond_7

    .line 119
    .line 120
    const/4 v1, 0x7

    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getLyricUrl()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    add-int/2addr v0, v1

    .line 130
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->accompany_:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    if-nez v1, :cond_8

    .line 137
    .line 138
    const/16 v1, 0x8

    .line 139
    .line 140
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getAccompany()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    add-int/2addr v0, v1

    .line 149
    :cond_8
    iget v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->progressMilliseconds_:I

    .line 150
    .line 151
    if-eqz v1, :cond_9

    .line 152
    .line 153
    const/16 v2, 0x9

    .line 154
    .line 155
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    add-int/2addr v0, v1

    .line 160
    :cond_9
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->orderId_:J

    .line 161
    .line 162
    const-wide/16 v3, 0x0

    .line 163
    .line 164
    cmp-long v3, v1, v3

    .line 165
    .line 166
    if-eqz v3, :cond_a

    .line 167
    .line 168
    const/16 v3, 0xa

    .line 169
    .line 170
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    add-int/2addr v0, v1

    .line 175
    :cond_a
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->hasStart_:Z

    .line 176
    .line 177
    if-eqz v1, :cond_b

    .line 178
    .line 179
    const/16 v2, 0xb

    .line 180
    .line 181
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    add-int/2addr v0, v1

    .line 186
    :cond_b
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 187
    .line 188
    return v0
.end method

.method public getSongCode()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->songCode_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSongCodeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->songCode_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->title_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTitleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->title_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public hasMask()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getUserId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->title_:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getTitle()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->cover_:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_3

    .line 52
    .line 53
    const/4 v0, 0x4

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getCover()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->songCode_:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_4

    .line 68
    .line 69
    const/4 v0, 0x5

    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getSongCode()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricType_:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_5

    .line 84
    .line 85
    const/4 v0, 0x6

    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getLyricType()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->lyricUrl_:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_6

    .line 100
    .line 101
    const/4 v0, 0x7

    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getLyricUrl()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->accompany_:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-nez v0, :cond_7

    .line 116
    .line 117
    const/16 v0, 0x8

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getAccompany()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 124
    .line 125
    .line 126
    :cond_7
    iget v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->progressMilliseconds_:I

    .line 127
    .line 128
    if-eqz v0, :cond_8

    .line 129
    .line 130
    const/16 v1, 0x9

    .line 131
    .line 132
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 133
    .line 134
    .line 135
    :cond_8
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->orderId_:J

    .line 136
    .line 137
    const-wide/16 v2, 0x0

    .line 138
    .line 139
    cmp-long v2, v0, v2

    .line 140
    .line 141
    if-eqz v2, :cond_9

    .line 142
    .line 143
    const/16 v2, 0xa

    .line 144
    .line 145
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 146
    .line 147
    .line 148
    :cond_9
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->hasStart_:Z

    .line 149
    .line 150
    if-eqz p0, :cond_a

    .line 151
    .line 152
    const/16 v0, 0xb

    .line 153
    .line 154
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 155
    .line 156
    .line 157
    :cond_a
    return-void
.end method
