.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimationOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VoiceLiveAuctionAnimation"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimationOrBuilder;"
    }
.end annotation


# static fields
.field public static final DAYSTEXT_FIELD_NUMBER:I = 0x8

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

.field public static final GUESTTAGIMAGE_FIELD_NUMBER:I = 0x6

.field public static final GUESTUSER_FIELD_NUMBER:I = 0x2

.field public static final LEVEL_FIELD_NUMBER:I = 0x4

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;",
            ">;"
        }
    .end annotation
.end field

.field public static final RELATIONNAME_FIELD_NUMBER:I = 0x5

.field public static final TYPE_FIELD_NUMBER:I = 0x1

.field public static final WINNERTAGIMAGE_FIELD_NUMBER:I = 0x7

.field public static final WINNERUSER_FIELD_NUMBER:I = 0x3


# instance fields
.field private daysText_:Ljava/lang/String;

.field private guestTagImage_:Ljava/lang/String;

.field private guestUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

.field private level_:J

.field private relationName_:Ljava/lang/String;

.field private type_:I

.field private winnerTagImage_:Ljava/lang/String;

.field private winnerUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->relationName_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestTagImage_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerTagImage_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->daysText_:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->clearDaysText()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->clearGuestTagImage()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->clearGuestUser()V

    return-void
.end method

.method private clearDaysText()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->getDaysText()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->daysText_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearGuestTagImage()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->getGuestTagImage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestTagImage_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearGuestUser()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 3
    .line 4
    return-void
.end method

.method private clearLevel()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->level_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearRelationName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->getRelationName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->relationName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->type_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearWinnerTagImage()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->getWinnerTagImage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerTagImage_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearWinnerUser()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->clearLevel()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->clearRelationName()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->clearType()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->clearWinnerTagImage()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->clearWinnerUser()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->mergeGuestUser(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->mergeWinnerUser(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->setDaysText(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->setDaysTextBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->setGuestTagImage(Ljava/lang/String;)V

    return-void
.end method

.method private mergeGuestUser(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 33
    .line 34
    return-void
.end method

.method private mergeWinnerUser(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->setGuestTagImageBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->setGuestUser(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->setGuestUser(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->setLevel(J)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->setRelationName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->setRelationNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private setDaysText(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->daysText_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setDaysTextBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->daysText_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setGuestTagImage(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestTagImage_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setGuestTagImageBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestTagImage_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setGuestUser(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 8
    .line 9
    return-void
.end method

.method private setGuestUser(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    return-void
.end method

.method private setLevel(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->level_:J

    .line 2
    .line 3
    return-void
.end method

.method private setRelationName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->relationName_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setRelationNameBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->relationName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setType(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->type_:I

    .line 9
    .line 10
    return-void
.end method

.method private setTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->type_:I

    .line 2
    .line 3
    return-void
.end method

.method private setWinnerTagImage(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerTagImage_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setWinnerTagImageBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerTagImage_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setWinnerUser(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 8
    .line 9
    return-void
.end method

.method private setWinnerUser(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->setType(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->setTypeValue(I)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->setWinnerTagImage(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->setWinnerTagImageBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->setWinnerUser(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->setWinnerUser(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method public static bridge synthetic z()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    return-object v0
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_e

    .line 55
    .line 56
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_3

    .line 61
    .line 62
    const/16 v3, 0x8

    .line 63
    .line 64
    if-eq p1, v3, :cond_d

    .line 65
    .line 66
    const/16 v3, 0x12

    .line 67
    .line 68
    if-eq p1, v3, :cond_b

    .line 69
    .line 70
    const/16 v3, 0x1a

    .line 71
    .line 72
    if-eq p1, v3, :cond_9

    .line 73
    .line 74
    const/16 v3, 0x20

    .line 75
    .line 76
    if-eq p1, v3, :cond_8

    .line 77
    .line 78
    const/16 v3, 0x2a

    .line 79
    .line 80
    if-eq p1, v3, :cond_7

    .line 81
    .line 82
    const/16 v3, 0x32

    .line 83
    .line 84
    if-eq p1, v3, :cond_6

    .line 85
    .line 86
    const/16 v3, 0x3a

    .line 87
    .line 88
    if-eq p1, v3, :cond_5

    .line 89
    .line 90
    const/16 v3, 0x42

    .line 91
    .line 92
    if-eq p1, v3, :cond_4

    .line 93
    .line 94
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-nez p1, :cond_2

    .line 99
    .line 100
    :cond_3
    move v0, v2

    .line 101
    goto :goto_3

    .line 102
    :catch_0
    move-exception v0

    .line 103
    move-object p1, v0

    .line 104
    goto/16 :goto_6

    .line 105
    .line 106
    :catch_1
    move-exception v0

    .line 107
    move-object p1, v0

    .line 108
    goto/16 :goto_7

    .line 109
    .line 110
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->daysText_:Ljava/lang/String;

    .line 115
    .line 116
    goto :goto_3

    .line 117
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerTagImage_:Ljava/lang/String;

    .line 122
    .line 123
    goto :goto_3

    .line 124
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestTagImage_:Ljava/lang/String;

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->relationName_:Ljava/lang/String;

    .line 136
    .line 137
    goto :goto_3

    .line 138
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 139
    .line 140
    .line 141
    move-result-wide v3

    .line 142
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->level_:J

    .line 143
    .line 144
    goto :goto_3

    .line 145
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 146
    .line 147
    if-eqz p1, :cond_a

    .line 148
    .line 149
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 154
    .line 155
    goto :goto_4

    .line 156
    :cond_a
    move-object p1, v1

    .line 157
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->parser()Ll/ng60;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    check-cast v3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 166
    .line 167
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 168
    .line 169
    if-eqz p1, :cond_2

    .line 170
    .line 171
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 172
    .line 173
    .line 174
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 179
    .line 180
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 181
    .line 182
    goto/16 :goto_3

    .line 183
    .line 184
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 185
    .line 186
    if-eqz p1, :cond_c

    .line 187
    .line 188
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 193
    .line 194
    goto :goto_5

    .line 195
    :cond_c
    move-object p1, v1

    .line 196
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->parser()Ll/ng60;

    .line 197
    .line 198
    .line 199
    move-result-object v3

    .line 200
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 201
    .line 202
    .line 203
    move-result-object v3

    .line 204
    check-cast v3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 205
    .line 206
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 207
    .line 208
    if-eqz p1, :cond_2

    .line 209
    .line 210
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 211
    .line 212
    .line 213
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 218
    .line 219
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 220
    .line 221
    goto/16 :goto_3

    .line 222
    .line 223
    :cond_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 224
    .line 225
    .line 226
    move-result p1

    .line 227
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->type_:I
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 228
    .line 229
    goto/16 :goto_3

    .line 230
    .line 231
    :catchall_1
    move-exception v0

    .line 232
    move-object p0, v0

    .line 233
    throw p0

    .line 234
    :goto_6
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 235
    .line 236
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 244
    .line 245
    .line 246
    move-result-object p0

    .line 247
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 248
    .line 249
    .line 250
    return-object v1

    .line 251
    :goto_7
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 252
    .line 253
    .line 254
    move-result-object p0

    .line 255
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 256
    .line 257
    .line 258
    return-object v1

    .line 259
    :cond_e
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    .line 260
    .line 261
    return-object p0

    .line 262
    :pswitch_3
    move-object v3, p2

    .line 263
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 264
    .line 265
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    .line 266
    .line 267
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->type_:I

    .line 268
    .line 269
    if-eqz p1, :cond_f

    .line 270
    .line 271
    move p2, v2

    .line 272
    goto :goto_8

    .line 273
    :cond_f
    move p2, v0

    .line 274
    :goto_8
    iget v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->type_:I

    .line 275
    .line 276
    if-eqz v1, :cond_10

    .line 277
    .line 278
    move v4, v2

    .line 279
    goto :goto_9

    .line 280
    :cond_10
    move v4, v0

    .line 281
    :goto_9
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 282
    .line 283
    .line 284
    move-result p1

    .line 285
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->type_:I

    .line 286
    .line 287
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 288
    .line 289
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 290
    .line 291
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 292
    .line 293
    .line 294
    move-result-object p1

    .line 295
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 296
    .line 297
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 298
    .line 299
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 300
    .line 301
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 302
    .line 303
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 304
    .line 305
    .line 306
    move-result-object p1

    .line 307
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 308
    .line 309
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 310
    .line 311
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->level_:J

    .line 312
    .line 313
    const-wide/16 p1, 0x0

    .line 314
    .line 315
    cmp-long v1, v5, p1

    .line 316
    .line 317
    if-eqz v1, :cond_11

    .line 318
    .line 319
    move v4, v2

    .line 320
    goto :goto_a

    .line 321
    :cond_11
    move v4, v0

    .line 322
    :goto_a
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->level_:J

    .line 323
    .line 324
    cmp-long p1, v8, p1

    .line 325
    .line 326
    if-eqz p1, :cond_12

    .line 327
    .line 328
    move v7, v2

    .line 329
    goto :goto_b

    .line 330
    :cond_12
    move v7, v0

    .line 331
    :goto_b
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 332
    .line 333
    .line 334
    move-result-wide p1

    .line 335
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->level_:J

    .line 336
    .line 337
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->relationName_:Ljava/lang/String;

    .line 338
    .line 339
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 340
    .line 341
    .line 342
    move-result p1

    .line 343
    xor-int/2addr p1, v2

    .line 344
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->relationName_:Ljava/lang/String;

    .line 345
    .line 346
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->relationName_:Ljava/lang/String;

    .line 347
    .line 348
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 349
    .line 350
    .line 351
    move-result v0

    .line 352
    xor-int/2addr v0, v2

    .line 353
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->relationName_:Ljava/lang/String;

    .line 354
    .line 355
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object p1

    .line 359
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->relationName_:Ljava/lang/String;

    .line 360
    .line 361
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestTagImage_:Ljava/lang/String;

    .line 362
    .line 363
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 364
    .line 365
    .line 366
    move-result p1

    .line 367
    xor-int/2addr p1, v2

    .line 368
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestTagImage_:Ljava/lang/String;

    .line 369
    .line 370
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestTagImage_:Ljava/lang/String;

    .line 371
    .line 372
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 373
    .line 374
    .line 375
    move-result v0

    .line 376
    xor-int/2addr v0, v2

    .line 377
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestTagImage_:Ljava/lang/String;

    .line 378
    .line 379
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object p1

    .line 383
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestTagImage_:Ljava/lang/String;

    .line 384
    .line 385
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerTagImage_:Ljava/lang/String;

    .line 386
    .line 387
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 388
    .line 389
    .line 390
    move-result p1

    .line 391
    xor-int/2addr p1, v2

    .line 392
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerTagImage_:Ljava/lang/String;

    .line 393
    .line 394
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerTagImage_:Ljava/lang/String;

    .line 395
    .line 396
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 397
    .line 398
    .line 399
    move-result v0

    .line 400
    xor-int/2addr v0, v2

    .line 401
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerTagImage_:Ljava/lang/String;

    .line 402
    .line 403
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 404
    .line 405
    .line 406
    move-result-object p1

    .line 407
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerTagImage_:Ljava/lang/String;

    .line 408
    .line 409
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->daysText_:Ljava/lang/String;

    .line 410
    .line 411
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 412
    .line 413
    .line 414
    move-result p1

    .line 415
    xor-int/2addr p1, v2

    .line 416
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->daysText_:Ljava/lang/String;

    .line 417
    .line 418
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->daysText_:Ljava/lang/String;

    .line 419
    .line 420
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 421
    .line 422
    .line 423
    move-result v0

    .line 424
    xor-int/2addr v0, v2

    .line 425
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->daysText_:Ljava/lang/String;

    .line 426
    .line 427
    invoke-interface {v3, p1, p2, v0, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 428
    .line 429
    .line 430
    move-result-object p1

    .line 431
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->daysText_:Ljava/lang/String;

    .line 432
    .line 433
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 434
    .line 435
    return-object p0

    .line 436
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation$Builder;

    .line 437
    .line 438
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation$Builder;-><init>(Ll/e4w;)V

    .line 439
    .line 440
    .line 441
    return-object p0

    .line 442
    :pswitch_5
    return-object v1

    .line 443
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    .line 444
    .line 445
    return-object p0

    .line 446
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;

    .line 447
    .line 448
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;-><init>()V

    .line 449
    .line 450
    .line 451
    return-object p0

    .line 452
    nop

    .line 453
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
.end method

.method public getDaysText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->daysText_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDaysTextBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->daysText_:Ljava/lang/String;

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

.method public getGuestTagImage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestTagImage_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGuestTagImageBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestTagImage_:Ljava/lang/String;

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

.method public getGuestUser()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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

.method public getLevel()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->level_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRelationName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->relationName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRelationNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->relationName_:Ljava/lang/String;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->type_:I

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;->settleAuction:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;->getNumber()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->type_:I

    .line 19
    .line 20
    invoke-static {v0, v1}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->getGuestUser()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 41
    .line 42
    if-eqz v1, :cond_3

    .line 43
    .line 44
    const/4 v1, 0x3

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->getWinnerUser()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    add-int/2addr v0, v1

    .line 54
    :cond_3
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->level_:J

    .line 55
    .line 56
    const-wide/16 v3, 0x0

    .line 57
    .line 58
    cmp-long v3, v1, v3

    .line 59
    .line 60
    if-eqz v3, :cond_4

    .line 61
    .line 62
    const/4 v3, 0x4

    .line 63
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    add-int/2addr v0, v1

    .line 68
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->relationName_:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-nez v1, :cond_5

    .line 75
    .line 76
    const/4 v1, 0x5

    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->getRelationName()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    add-int/2addr v0, v1

    .line 86
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestTagImage_:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-nez v1, :cond_6

    .line 93
    .line 94
    const/4 v1, 0x6

    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->getGuestTagImage()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    add-int/2addr v0, v1

    .line 104
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerTagImage_:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-nez v1, :cond_7

    .line 111
    .line 112
    const/4 v1, 0x7

    .line 113
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->getWinnerTagImage()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    add-int/2addr v0, v1

    .line 122
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->daysText_:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    if-nez v1, :cond_8

    .line 129
    .line 130
    const/16 v1, 0x8

    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->getDaysText()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    add-int/2addr v0, v1

    .line 141
    :cond_8
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 142
    .line 143
    return v0
.end method

.method public getType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->type_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;->forNumber(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->type_:I

    .line 2
    .line 3
    return p0
.end method

.method public getWinnerTagImage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerTagImage_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWinnerTagImageBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerTagImage_:Ljava/lang/String;

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

.method public getWinnerUser()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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

.method public hasGuestUser()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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

.method public hasWinnerUser()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->type_:I

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;->settleAuction:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$AnimType;->getNumber()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->type_:I

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->getGuestUser()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerUser_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    const/4 v0, 0x3

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->getWinnerUser()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 39
    .line 40
    .line 41
    :cond_2
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->level_:J

    .line 42
    .line 43
    const-wide/16 v2, 0x0

    .line 44
    .line 45
    cmp-long v2, v0, v2

    .line 46
    .line 47
    if-eqz v2, :cond_3

    .line 48
    .line 49
    const/4 v2, 0x4

    .line 50
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 51
    .line 52
    .line 53
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->relationName_:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_4

    .line 60
    .line 61
    const/4 v0, 0x5

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->getRelationName()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->guestTagImage_:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_5

    .line 76
    .line 77
    const/4 v0, 0x6

    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->getGuestTagImage()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 83
    .line 84
    .line 85
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->winnerTagImage_:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_6

    .line 92
    .line 93
    const/4 v0, 0x7

    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->getWinnerTagImage()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->daysText_:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-nez v0, :cond_7

    .line 108
    .line 109
    const/16 v0, 0x8

    .line 110
    .line 111
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionAnimationMsg$VoiceLiveAuctionAnimation;->getDaysText()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 116
    .line 117
    .line 118
    :cond_7
    return-void
.end method
