.class public final Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoStickerOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VoiceLivePhotoSticker"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoStickerOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

.field public static final FRAMECONFIG_FIELD_NUMBER:I = 0x3

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;",
            ">;"
        }
    .end annotation
.end field

.field public static final PTHOTOTYPE_FIELD_NUMBER:I = 0x2

.field public static final SERVERTIMEINSECONDS_FIELD_NUMBER:I = 0x4

.field public static final USERID_FIELD_NUMBER:I = 0x1


# instance fields
.field private frameConfig_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

.field private pthotoType_:Ljava/lang/String;

.field private serverTimeInSeconds_:J

.field private userId_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->userId_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->pthotoType_:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->clearFrameConfig()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->clearPthotoType()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->clearServerTimeInSeconds()V

    return-void
.end method

.method private clearFrameConfig()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->frameConfig_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 3
    .line 4
    return-void
.end method

.method private clearPthotoType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->getPthotoType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->pthotoType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearServerTimeInSeconds()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->serverTimeInSeconds_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->userId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->clearUserId()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->mergeFrameConfig(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->setFrameConfig(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig$Builder;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->setFrameConfig(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->setPthotoType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->setPthotoTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->setServerTimeInSeconds(J)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->setUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->setUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic m()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    return-object v0
.end method

.method private mergeFrameConfig(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->frameConfig_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->frameConfig_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;->newBuilder(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->frameConfig_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->frameConfig_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 33
    .line 34
    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

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

.method private setFrameConfig(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->frameConfig_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 8
    .line 9
    return-void
.end method

.method private setFrameConfig(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->frameConfig_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    return-void
.end method

.method private setPthotoType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->pthotoType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setPthotoTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->pthotoType_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setServerTimeInSeconds(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->serverTimeInSeconds_:J

    .line 2
    .line 3
    return-void
.end method

.method private setUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->userId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->userId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_9

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
    const/16 v3, 0xa

    .line 63
    .line 64
    if-eq p1, v3, :cond_8

    .line 65
    .line 66
    const/16 v3, 0x12

    .line 67
    .line 68
    if-eq p1, v3, :cond_7

    .line 69
    .line 70
    const/16 v3, 0x1a

    .line 71
    .line 72
    if-eq p1, v3, :cond_5

    .line 73
    .line 74
    const/16 v3, 0x20

    .line 75
    .line 76
    if-eq p1, v3, :cond_4

    .line 77
    .line 78
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-nez p1, :cond_2

    .line 83
    .line 84
    :cond_3
    move v0, v2

    .line 85
    goto :goto_3

    .line 86
    :catch_0
    move-exception v0

    .line 87
    move-object p1, v0

    .line 88
    goto :goto_5

    .line 89
    :catch_1
    move-exception v0

    .line 90
    move-object p1, v0

    .line 91
    goto :goto_6

    .line 92
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 93
    .line 94
    .line 95
    move-result-wide v3

    .line 96
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->serverTimeInSeconds_:J

    .line 97
    .line 98
    goto :goto_3

    .line 99
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->frameConfig_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 100
    .line 101
    if-eqz p1, :cond_6

    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig$Builder;

    .line 108
    .line 109
    goto :goto_4

    .line 110
    :cond_6
    move-object p1, v1

    .line 111
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;->parser()Ll/ng60;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    check-cast v3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 120
    .line 121
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->frameConfig_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 122
    .line 123
    if-eqz p1, :cond_2

    .line 124
    .line 125
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 133
    .line 134
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->frameConfig_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 135
    .line 136
    goto :goto_3

    .line 137
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->pthotoType_:Ljava/lang/String;

    .line 142
    .line 143
    goto :goto_3

    .line 144
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->userId_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 149
    .line 150
    goto :goto_3

    .line 151
    :catchall_1
    move-exception v0

    .line 152
    move-object p0, v0

    .line 153
    throw p0

    .line 154
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 155
    .line 156
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 168
    .line 169
    .line 170
    return-object v1

    .line 171
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 176
    .line 177
    .line 178
    return-object v1

    .line 179
    :cond_9
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    .line 180
    .line 181
    return-object p0

    .line 182
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 183
    .line 184
    check-cast p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    .line 185
    .line 186
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->userId_:Ljava/lang/String;

    .line 187
    .line 188
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 189
    .line 190
    .line 191
    move-result p1

    .line 192
    xor-int/2addr p1, v2

    .line 193
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->userId_:Ljava/lang/String;

    .line 194
    .line 195
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->userId_:Ljava/lang/String;

    .line 196
    .line 197
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 198
    .line 199
    .line 200
    move-result v3

    .line 201
    xor-int/2addr v3, v2

    .line 202
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->userId_:Ljava/lang/String;

    .line 203
    .line 204
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->userId_:Ljava/lang/String;

    .line 209
    .line 210
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->pthotoType_:Ljava/lang/String;

    .line 211
    .line 212
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 213
    .line 214
    .line 215
    move-result p1

    .line 216
    xor-int/2addr p1, v2

    .line 217
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->pthotoType_:Ljava/lang/String;

    .line 218
    .line 219
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->pthotoType_:Ljava/lang/String;

    .line 220
    .line 221
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 222
    .line 223
    .line 224
    move-result v3

    .line 225
    xor-int/2addr v3, v2

    .line 226
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->pthotoType_:Ljava/lang/String;

    .line 227
    .line 228
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->pthotoType_:Ljava/lang/String;

    .line 233
    .line 234
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->frameConfig_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 235
    .line 236
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->frameConfig_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 237
    .line 238
    invoke-interface {p2, p1, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 243
    .line 244
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->frameConfig_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 245
    .line 246
    move p1, v2

    .line 247
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->serverTimeInSeconds_:J

    .line 248
    .line 249
    const-wide/16 v4, 0x0

    .line 250
    .line 251
    cmp-long v1, v2, v4

    .line 252
    .line 253
    if-eqz v1, :cond_a

    .line 254
    .line 255
    move v1, p1

    .line 256
    goto :goto_7

    .line 257
    :cond_a
    move v1, v0

    .line 258
    :goto_7
    iget-wide v6, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->serverTimeInSeconds_:J

    .line 259
    .line 260
    cmp-long p3, v6, v4

    .line 261
    .line 262
    if-eqz p3, :cond_b

    .line 263
    .line 264
    move v4, p1

    .line 265
    move-object v0, p2

    .line 266
    move-wide v5, v6

    .line 267
    goto :goto_8

    .line 268
    :cond_b
    move v4, v0

    .line 269
    move-wide v5, v6

    .line 270
    move-object v0, p2

    .line 271
    :goto_8
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 272
    .line 273
    .line 274
    move-result-wide p1

    .line 275
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->serverTimeInSeconds_:J

    .line 276
    .line 277
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 278
    .line 279
    return-object p0

    .line 280
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker$Builder;

    .line 281
    .line 282
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker$Builder;-><init>(Ll/chn0;)V

    .line 283
    .line 284
    .line 285
    return-object p0

    .line 286
    :pswitch_5
    return-object v1

    .line 287
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    .line 288
    .line 289
    return-object p0

    .line 290
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;

    .line 291
    .line 292
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;-><init>()V

    .line 293
    .line 294
    .line 295
    return-object p0

    .line 296
    nop

    .line 297
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

.method public getFrameConfig()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->frameConfig_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getPthotoType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->pthotoType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPthotoTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->pthotoType_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->getUserId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->pthotoType_:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x2

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->getPthotoType()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    add-int/2addr v0, v1

    .line 44
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->frameConfig_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 45
    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x3

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->getFrameConfig()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    add-int/2addr v0, v1

    .line 58
    :cond_3
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->serverTimeInSeconds_:J

    .line 59
    .line 60
    const-wide/16 v3, 0x0

    .line 61
    .line 62
    cmp-long v3, v1, v3

    .line 63
    .line 64
    if-eqz v3, :cond_4

    .line 65
    .line 66
    const/4 v3, 0x4

    .line 67
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    add-int/2addr v0, v1

    .line 72
    :cond_4
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 73
    .line 74
    return v0
.end method

.method public getServerTimeInSeconds()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->serverTimeInSeconds_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->userId_:Ljava/lang/String;

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

.method public hasFrameConfig()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->frameConfig_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->getUserId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->pthotoType_:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x2

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->getPthotoType()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->frameConfig_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->getFrameConfig()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->serverTimeInSeconds_:J

    .line 46
    .line 47
    const-wide/16 v2, 0x0

    .line 48
    .line 49
    cmp-long p0, v0, v2

    .line 50
    .line 51
    if-eqz p0, :cond_3

    .line 52
    .line 53
    const/4 p0, 0x4

    .line 54
    invoke-virtual {p1, p0, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 55
    .line 56
    .line 57
    :cond_3
    return-void
.end method
