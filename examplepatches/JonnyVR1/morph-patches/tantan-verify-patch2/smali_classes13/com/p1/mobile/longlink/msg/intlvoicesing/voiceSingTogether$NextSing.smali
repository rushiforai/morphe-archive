.class public final Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSingOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "NextSing"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;",
        "Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSingOrBuilder;"
    }
.end annotation


# static fields
.field public static final ACCOMPANY_FIELD_NUMBER:I = 0x8

.field public static final COUNTDOWNSECONDS_FIELD_NUMBER:I = 0x9

.field public static final COVER_FIELD_NUMBER:I = 0x4

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

.field public static final LYRICTYPE_FIELD_NUMBER:I = 0x6

.field public static final LYRICURL_FIELD_NUMBER:I = 0x7

.field public static final MASK_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;",
            ">;"
        }
    .end annotation
.end field

.field public static final REMAINSECONDS_FIELD_NUMBER:I = 0xa

.field public static final SONGCODE_FIELD_NUMBER:I = 0x5

.field public static final TITLE_FIELD_NUMBER:I = 0x3

.field public static final USERID_FIELD_NUMBER:I = 0x1


# instance fields
.field private accompany_:Ljava/lang/String;

.field private countDownSeconds_:I

.field private cover_:Ljava/lang/String;

.field private lyricType_:Ljava/lang/String;

.field private lyricUrl_:Ljava/lang/String;

.field private mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

.field private remainSeconds_:I

.field private songCode_:Ljava/lang/String;

.field private title_:Ljava/lang/String;

.field private userId_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->userId_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->title_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->cover_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->songCode_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricType_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricUrl_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->accompany_:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->setTitleBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->setUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->setUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic D()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->clearAccompany()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->clearCountDownSeconds()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->clearCover()V

    return-void
.end method

.method private clearAccompany()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getAccompany()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->accompany_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearCountDownSeconds()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->countDownSeconds_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearCover()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getCover()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->cover_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLyricType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getLyricType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLyricUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getLyricUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearMask()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 3
    .line 4
    return-void
.end method

.method private clearRemainSeconds()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->remainSeconds_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearSongCode()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getSongCode()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->songCode_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTitle()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getTitle()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->title_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->userId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->clearLyricType()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->clearLyricUrl()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->clearMask()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->clearRemainSeconds()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->clearSongCode()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->clearTitle()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->clearUserId()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->mergeMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->setAccompany(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->setAccompanyBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private mergeMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->setCountDownSeconds(I)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->setCover(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->setCoverBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->setLyricType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->setLyricTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->setLyricUrl(Ljava/lang/String;)V

    return-void
.end method

.method private setAccompany(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->accompany_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->accompany_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setCountDownSeconds(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->countDownSeconds_:I

    .line 2
    .line 3
    return-void
.end method

.method private setCover(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->cover_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->cover_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setLyricType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricType_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricType_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricUrl_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricUrl_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 8
    .line 9
    return-void
.end method

.method private setMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    return-void
.end method

.method private setRemainSeconds(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->remainSeconds_:I

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->songCode_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->songCode_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->title_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->title_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->userId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->userId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->setLyricUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->setMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->setMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->setRemainSeconds(I)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->setSongCode(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->setSongCodeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->setTitle(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

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
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x0

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
    return-object v0

    .line 19
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->PARSER:Ll/ng60;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    :goto_0
    monitor-exit p0

    .line 43
    goto :goto_2

    .line 44
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    throw p1

    .line 46
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->PARSER:Ll/ng60;

    .line 47
    .line 48
    return-object p0

    .line 49
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 50
    .line 51
    check-cast p3, Lcom/google/protobuf/h;

    .line 52
    .line 53
    :cond_2
    :goto_3
    if-nez v1, :cond_4

    .line 54
    .line 55
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    sparse-switch p1, :sswitch_data_0

    .line 60
    .line 61
    .line 62
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-nez p1, :cond_2

    .line 67
    .line 68
    :sswitch_0
    move v1, v2

    .line 69
    goto :goto_3

    .line 70
    :catch_0
    move-exception p1

    .line 71
    goto/16 :goto_5

    .line 72
    .line 73
    :catch_1
    move-exception p1

    .line 74
    goto/16 :goto_6

    .line 75
    .line 76
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    iput p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->remainSeconds_:I

    .line 81
    .line 82
    goto :goto_3

    .line 83
    :sswitch_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    iput p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->countDownSeconds_:I

    .line 88
    .line 89
    goto :goto_3

    .line 90
    :sswitch_3
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->accompany_:Ljava/lang/String;

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricUrl_:Ljava/lang/String;

    .line 102
    .line 103
    goto :goto_3

    .line 104
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricType_:Ljava/lang/String;

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->songCode_:Ljava/lang/String;

    .line 116
    .line 117
    goto :goto_3

    .line 118
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->cover_:Ljava/lang/String;

    .line 123
    .line 124
    goto :goto_3

    .line 125
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->title_:Ljava/lang/String;

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :sswitch_9
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 133
    .line 134
    if-eqz p1, :cond_3

    .line 135
    .line 136
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 141
    .line 142
    goto :goto_4

    .line 143
    :cond_3
    move-object p1, v0

    .line 144
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->parser()Ll/ng60;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 149
    .line 150
    .line 151
    move-result-object v3

    .line 152
    check-cast v3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 153
    .line 154
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 155
    .line 156
    if-eqz p1, :cond_2

    .line 157
    .line 158
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 159
    .line 160
    .line 161
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 166
    .line 167
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 168
    .line 169
    goto :goto_3

    .line 170
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->userId_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 175
    .line 176
    goto :goto_3

    .line 177
    :catchall_1
    move-exception p0

    .line 178
    throw p0

    .line 179
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 180
    .line 181
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 193
    .line 194
    .line 195
    return-object v0

    .line 196
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 201
    .line 202
    .line 203
    return-object v0

    .line 204
    :cond_4
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 205
    .line 206
    return-object p0

    .line 207
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 208
    .line 209
    check-cast p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 210
    .line 211
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->userId_:Ljava/lang/String;

    .line 212
    .line 213
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 214
    .line 215
    .line 216
    move-result p1

    .line 217
    xor-int/2addr p1, v2

    .line 218
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->userId_:Ljava/lang/String;

    .line 219
    .line 220
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->userId_:Ljava/lang/String;

    .line 221
    .line 222
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 223
    .line 224
    .line 225
    move-result v3

    .line 226
    xor-int/2addr v3, v2

    .line 227
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->userId_:Ljava/lang/String;

    .line 228
    .line 229
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->userId_:Ljava/lang/String;

    .line 234
    .line 235
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 236
    .line 237
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 238
    .line 239
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 244
    .line 245
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 246
    .line 247
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->title_:Ljava/lang/String;

    .line 248
    .line 249
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 250
    .line 251
    .line 252
    move-result p1

    .line 253
    xor-int/2addr p1, v2

    .line 254
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->title_:Ljava/lang/String;

    .line 255
    .line 256
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->title_:Ljava/lang/String;

    .line 257
    .line 258
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 259
    .line 260
    .line 261
    move-result v3

    .line 262
    xor-int/2addr v3, v2

    .line 263
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->title_:Ljava/lang/String;

    .line 264
    .line 265
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->title_:Ljava/lang/String;

    .line 270
    .line 271
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->cover_:Ljava/lang/String;

    .line 272
    .line 273
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 274
    .line 275
    .line 276
    move-result p1

    .line 277
    xor-int/2addr p1, v2

    .line 278
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->cover_:Ljava/lang/String;

    .line 279
    .line 280
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->cover_:Ljava/lang/String;

    .line 281
    .line 282
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 283
    .line 284
    .line 285
    move-result v3

    .line 286
    xor-int/2addr v3, v2

    .line 287
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->cover_:Ljava/lang/String;

    .line 288
    .line 289
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object p1

    .line 293
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->cover_:Ljava/lang/String;

    .line 294
    .line 295
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->songCode_:Ljava/lang/String;

    .line 296
    .line 297
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 298
    .line 299
    .line 300
    move-result p1

    .line 301
    xor-int/2addr p1, v2

    .line 302
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->songCode_:Ljava/lang/String;

    .line 303
    .line 304
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->songCode_:Ljava/lang/String;

    .line 305
    .line 306
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 307
    .line 308
    .line 309
    move-result v3

    .line 310
    xor-int/2addr v3, v2

    .line 311
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->songCode_:Ljava/lang/String;

    .line 312
    .line 313
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object p1

    .line 317
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->songCode_:Ljava/lang/String;

    .line 318
    .line 319
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricType_:Ljava/lang/String;

    .line 320
    .line 321
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 322
    .line 323
    .line 324
    move-result p1

    .line 325
    xor-int/2addr p1, v2

    .line 326
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricType_:Ljava/lang/String;

    .line 327
    .line 328
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricType_:Ljava/lang/String;

    .line 329
    .line 330
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 331
    .line 332
    .line 333
    move-result v3

    .line 334
    xor-int/2addr v3, v2

    .line 335
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricType_:Ljava/lang/String;

    .line 336
    .line 337
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object p1

    .line 341
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricType_:Ljava/lang/String;

    .line 342
    .line 343
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricUrl_:Ljava/lang/String;

    .line 344
    .line 345
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 346
    .line 347
    .line 348
    move-result p1

    .line 349
    xor-int/2addr p1, v2

    .line 350
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricUrl_:Ljava/lang/String;

    .line 351
    .line 352
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricUrl_:Ljava/lang/String;

    .line 353
    .line 354
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 355
    .line 356
    .line 357
    move-result v3

    .line 358
    xor-int/2addr v3, v2

    .line 359
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricUrl_:Ljava/lang/String;

    .line 360
    .line 361
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object p1

    .line 365
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricUrl_:Ljava/lang/String;

    .line 366
    .line 367
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->accompany_:Ljava/lang/String;

    .line 368
    .line 369
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 370
    .line 371
    .line 372
    move-result p1

    .line 373
    xor-int/2addr p1, v2

    .line 374
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->accompany_:Ljava/lang/String;

    .line 375
    .line 376
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->accompany_:Ljava/lang/String;

    .line 377
    .line 378
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 379
    .line 380
    .line 381
    move-result v3

    .line 382
    xor-int/2addr v3, v2

    .line 383
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->accompany_:Ljava/lang/String;

    .line 384
    .line 385
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object p1

    .line 389
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->accompany_:Ljava/lang/String;

    .line 390
    .line 391
    iget p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->countDownSeconds_:I

    .line 392
    .line 393
    if-eqz p1, :cond_5

    .line 394
    .line 395
    move v0, v2

    .line 396
    goto :goto_7

    .line 397
    :cond_5
    move v0, v1

    .line 398
    :goto_7
    iget v3, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->countDownSeconds_:I

    .line 399
    .line 400
    if-eqz v3, :cond_6

    .line 401
    .line 402
    move v4, v2

    .line 403
    goto :goto_8

    .line 404
    :cond_6
    move v4, v1

    .line 405
    :goto_8
    invoke-interface {p2, v0, p1, v4, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 406
    .line 407
    .line 408
    move-result p1

    .line 409
    iput p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->countDownSeconds_:I

    .line 410
    .line 411
    iget p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->remainSeconds_:I

    .line 412
    .line 413
    if-eqz p1, :cond_7

    .line 414
    .line 415
    move v0, v2

    .line 416
    goto :goto_9

    .line 417
    :cond_7
    move v0, v1

    .line 418
    :goto_9
    iget p3, p3, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->remainSeconds_:I

    .line 419
    .line 420
    if-eqz p3, :cond_8

    .line 421
    .line 422
    move v1, v2

    .line 423
    :cond_8
    invoke-interface {p2, v0, p1, v1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 424
    .line 425
    .line 426
    move-result p1

    .line 427
    iput p1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->remainSeconds_:I

    .line 428
    .line 429
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 430
    .line 431
    return-object p0

    .line 432
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing$Builder;

    .line 433
    .line 434
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing$Builder;-><init>(Ll/h6r0;)V

    .line 435
    .line 436
    .line 437
    return-object p0

    .line 438
    :pswitch_5
    return-object v0

    .line 439
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 440
    .line 441
    return-object p0

    .line 442
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 443
    .line 444
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;-><init>()V

    .line 445
    .line 446
    .line 447
    return-object p0

    .line 448
    nop

    .line 449
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

    .line 450
    .line 451
    .line 452
    .line 453
    .line 454
    .line 455
    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
    .line 462
    .line 463
    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_a
        0x12 -> :sswitch_9
        0x1a -> :sswitch_8
        0x22 -> :sswitch_7
        0x2a -> :sswitch_6
        0x32 -> :sswitch_5
        0x3a -> :sswitch_4
        0x42 -> :sswitch_3
        0x48 -> :sswitch_2
        0x50 -> :sswitch_1
    .end sparse-switch
.end method

.method public getAccompany()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->accompany_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAccompanyBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->accompany_:Ljava/lang/String;

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

.method public getCountDownSeconds()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->countDownSeconds_:I

    .line 2
    .line 3
    return p0
.end method

.method public getCover()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->cover_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCoverBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->cover_:Ljava/lang/String;

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

.method public getLyricType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLyricTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricType_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLyricUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricUrl_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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

.method public getRemainSeconds()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->remainSeconds_:I

    .line 2
    .line 3
    return p0
.end method

.method public getSerializedSize()I
    .locals 3

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getUserId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->title_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getTitle()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->cover_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getCover()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->songCode_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getSongCode()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricType_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getLyricType()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getLyricUrl()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->accompany_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getAccompany()Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->countDownSeconds_:I

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->remainSeconds_:I

    .line 161
    .line 162
    if-eqz v1, :cond_a

    .line 163
    .line 164
    const/16 v2, 0xa

    .line 165
    .line 166
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    add-int/2addr v0, v1

    .line 171
    :cond_a
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 172
    .line 173
    return v0
.end method

.method public getSongCode()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->songCode_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSongCodeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->songCode_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->title_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTitleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->title_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->userId_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getUserId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->mask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->title_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getTitle()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->cover_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getCover()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->songCode_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getSongCode()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricType_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getLyricType()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->lyricUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getLyricUrl()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->accompany_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getAccompany()Ljava/lang/String;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->countDownSeconds_:I

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
    iget p0, p0, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->remainSeconds_:I

    .line 136
    .line 137
    if-eqz p0, :cond_9

    .line 138
    .line 139
    const/16 v0, 0xa

    .line 140
    .line 141
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 142
    .line 143
    .line 144
    :cond_9
    return-void
.end method
