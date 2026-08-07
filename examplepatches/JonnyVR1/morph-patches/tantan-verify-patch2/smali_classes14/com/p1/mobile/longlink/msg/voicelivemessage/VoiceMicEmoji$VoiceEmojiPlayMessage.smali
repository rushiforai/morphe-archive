.class public final Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VoiceEmojiPlayMessage"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessageOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

.field public static final EMOJITYPE_FIELD_NUMBER:I = 0x4

.field public static final MID_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;",
            ">;"
        }
    .end annotation
.end field

.field public static final RESULT_FIELD_NUMBER:I = 0x5

.field public static final TEMPDATA_FIELD_NUMBER:I = 0x6

.field public static final USERID_FIELD_NUMBER:I = 0x2

.field public static final USERMASK_FIELD_NUMBER:I = 0x3


# instance fields
.field private bitField0_:I

.field private emojiType_:Ljava/lang/String;

.field private mid_:Ljava/lang/String;

.field private result_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;",
            ">;"
        }
    .end annotation
.end field

.field private tempdata_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

.field private userId_:Ljava/lang/String;

.field private userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->mid_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userId_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->emojiType_:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 17
    .line 18
    return-void
.end method

.method public static bridge synthetic A()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->addAllResult(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllResult(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->ensureResultIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addResult(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->ensureResultIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addResult(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->ensureResultIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addResult(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->ensureResultIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addResult(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->ensureResultIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->addResult(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult$Builder;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->addResult(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;)V

    return-void
.end method

.method private clearEmojiType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getEmojiType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->emojiType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearMid()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getMid()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->mid_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearResult()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearTempdata()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 3
    .line 4
    return-void
.end method

.method private clearUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserMask()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->addResult(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult$Builder;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->addResult(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;)V

    return-void
.end method

.method private ensureResultIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/protobuf/l$h;->q()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->clearEmojiType()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->clearMid()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->clearResult()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->clearTempdata()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->clearUserId()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->clearUserMask()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->mergeTempdata(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->mergeUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method private mergeTempdata(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->newBuilder(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 33
    .line 34
    return-void
.end method

.method private mergeUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->removeResult(I)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->setEmojiType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->setEmojiTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->setMid(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->setMidBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private removeResult(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->ensureResultIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->setResult(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult$Builder;)V

    return-void
.end method

.method private setEmojiType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->emojiType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setEmojiTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->emojiType_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setMid(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->mid_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setMidBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->mid_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setResult(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->ensureResultIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setResult(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->ensureResultIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setTempdata(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 8
    .line 9
    return-void
.end method

.method private setTempdata(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    return-void
.end method

.method private setUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 8
    .line 9
    return-void
.end method

.method private setUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->setResult(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->setTempdata(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->setTempdata(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->setUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->setUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->setUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->setUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    const/4 v1, 0x1

    .line 11
    packed-switch p1, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/l710;->a()V

    .line 15
    .line 16
    .line 17
    return-object v0

    .line 18
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->PARSER:Ll/ng60;

    .line 19
    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    const-class p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    .line 23
    .line 24
    monitor-enter p0

    .line 25
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->PARSER:Ll/ng60;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 30
    .line 31
    sget-object p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    .line 32
    .line 33
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 34
    .line 35
    .line 36
    sput-object p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->PARSER:Ll/ng60;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p1

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    :goto_0
    monitor-exit p0

    .line 42
    goto :goto_2

    .line 43
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    throw p1

    .line 45
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->PARSER:Ll/ng60;

    .line 46
    .line 47
    return-object p0

    .line 48
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 49
    .line 50
    check-cast p3, Lcom/google/protobuf/h;

    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    :cond_2
    :goto_3
    if-nez p1, :cond_d

    .line 54
    .line 55
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_3

    .line 60
    .line 61
    const/16 v3, 0xa

    .line 62
    .line 63
    if-eq v2, v3, :cond_c

    .line 64
    .line 65
    const/16 v3, 0x12

    .line 66
    .line 67
    if-eq v2, v3, :cond_b

    .line 68
    .line 69
    const/16 v3, 0x1a

    .line 70
    .line 71
    if-eq v2, v3, :cond_9

    .line 72
    .line 73
    const/16 v3, 0x22

    .line 74
    .line 75
    if-eq v2, v3, :cond_8

    .line 76
    .line 77
    const/16 v3, 0x2a

    .line 78
    .line 79
    if-eq v2, v3, :cond_6

    .line 80
    .line 81
    const/16 v3, 0x32

    .line 82
    .line 83
    if-eq v2, v3, :cond_4

    .line 84
    .line 85
    invoke-virtual {p2, v2}, Lcom/google/protobuf/e;->R(I)Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-nez v2, :cond_2

    .line 90
    .line 91
    :cond_3
    move p1, v1

    .line 92
    goto :goto_3

    .line 93
    :catch_0
    move-exception p1

    .line 94
    goto/16 :goto_6

    .line 95
    .line 96
    :catch_1
    move-exception p1

    .line 97
    goto/16 :goto_7

    .line 98
    .line 99
    :cond_4
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 100
    .line 101
    if-eqz v2, :cond_5

    .line 102
    .line 103
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    check-cast v2, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 108
    .line 109
    goto :goto_4

    .line 110
    :cond_5
    move-object v2, v0

    .line 111
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->parser()Ll/ng60;

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
    check-cast v3, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 120
    .line 121
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 122
    .line 123
    if-eqz v2, :cond_2

    .line 124
    .line 125
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    check-cast v2, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 133
    .line 134
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 135
    .line 136
    goto :goto_3

    .line 137
    :cond_6
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 138
    .line 139
    invoke-interface {v2}, Lcom/google/protobuf/l$h;->q()Z

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    if-nez v2, :cond_7

    .line 144
    .line 145
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 146
    .line 147
    invoke-static {v2}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 152
    .line 153
    :cond_7
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 154
    .line 155
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->parser()Ll/ng60;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    check-cast v3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 164
    .line 165
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    goto :goto_3

    .line 169
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->emojiType_:Ljava/lang/String;

    .line 174
    .line 175
    goto :goto_3

    .line 176
    :cond_9
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 177
    .line 178
    if-eqz v2, :cond_a

    .line 179
    .line 180
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    check-cast v2, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 185
    .line 186
    goto :goto_5

    .line 187
    :cond_a
    move-object v2, v0

    .line 188
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->parser()Ll/ng60;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    check-cast v3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 197
    .line 198
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 199
    .line 200
    if-eqz v2, :cond_2

    .line 201
    .line 202
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    check-cast v2, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 210
    .line 211
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 212
    .line 213
    goto/16 :goto_3

    .line 214
    .line 215
    :cond_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userId_:Ljava/lang/String;

    .line 220
    .line 221
    goto/16 :goto_3

    .line 222
    .line 223
    :cond_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->mid_:Ljava/lang/String;
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
    move-exception p0

    .line 232
    throw p0

    .line 233
    :goto_6
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 234
    .line 235
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 247
    .line 248
    .line 249
    return-object v0

    .line 250
    :goto_7
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 251
    .line 252
    .line 253
    move-result-object p0

    .line 254
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 255
    .line 256
    .line 257
    return-object v0

    .line 258
    :cond_d
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    .line 259
    .line 260
    return-object p0

    .line 261
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 262
    .line 263
    check-cast p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    .line 264
    .line 265
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->mid_:Ljava/lang/String;

    .line 266
    .line 267
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 268
    .line 269
    .line 270
    move-result p1

    .line 271
    xor-int/2addr p1, v1

    .line 272
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->mid_:Ljava/lang/String;

    .line 273
    .line 274
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->mid_:Ljava/lang/String;

    .line 275
    .line 276
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 277
    .line 278
    .line 279
    move-result v2

    .line 280
    xor-int/2addr v2, v1

    .line 281
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->mid_:Ljava/lang/String;

    .line 282
    .line 283
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object p1

    .line 287
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->mid_:Ljava/lang/String;

    .line 288
    .line 289
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userId_:Ljava/lang/String;

    .line 290
    .line 291
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 292
    .line 293
    .line 294
    move-result p1

    .line 295
    xor-int/2addr p1, v1

    .line 296
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userId_:Ljava/lang/String;

    .line 297
    .line 298
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userId_:Ljava/lang/String;

    .line 299
    .line 300
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 301
    .line 302
    .line 303
    move-result v2

    .line 304
    xor-int/2addr v2, v1

    .line 305
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userId_:Ljava/lang/String;

    .line 306
    .line 307
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object p1

    .line 311
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userId_:Ljava/lang/String;

    .line 312
    .line 313
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 314
    .line 315
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 316
    .line 317
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 318
    .line 319
    .line 320
    move-result-object p1

    .line 321
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 322
    .line 323
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 324
    .line 325
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->emojiType_:Ljava/lang/String;

    .line 326
    .line 327
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 328
    .line 329
    .line 330
    move-result p1

    .line 331
    xor-int/2addr p1, v1

    .line 332
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->emojiType_:Ljava/lang/String;

    .line 333
    .line 334
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->emojiType_:Ljava/lang/String;

    .line 335
    .line 336
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 337
    .line 338
    .line 339
    move-result v2

    .line 340
    xor-int/2addr v1, v2

    .line 341
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->emojiType_:Ljava/lang/String;

    .line 342
    .line 343
    invoke-interface {p2, p1, v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object p1

    .line 347
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->emojiType_:Ljava/lang/String;

    .line 348
    .line 349
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 350
    .line 351
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 352
    .line 353
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 354
    .line 355
    .line 356
    move-result-object p1

    .line 357
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 358
    .line 359
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 360
    .line 361
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 362
    .line 363
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 364
    .line 365
    .line 366
    move-result-object p1

    .line 367
    check-cast p1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 368
    .line 369
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 370
    .line 371
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 372
    .line 373
    if-ne p2, p1, :cond_e

    .line 374
    .line 375
    iget p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->bitField0_:I

    .line 376
    .line 377
    iget p2, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->bitField0_:I

    .line 378
    .line 379
    or-int/2addr p1, p2

    .line 380
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->bitField0_:I

    .line 381
    .line 382
    :cond_e
    return-object p0

    .line 383
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage$Builder;

    .line 384
    .line 385
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage$Builder;-><init>(Ll/s9o0;)V

    .line 386
    .line 387
    .line 388
    return-object p0

    .line 389
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 390
    .line 391
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 392
    .line 393
    .line 394
    return-object v0

    .line 395
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    .line 396
    .line 397
    return-object p0

    .line 398
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    .line 399
    .line 400
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;-><init>()V

    .line 401
    .line 402
    .line 403
    return-object p0

    .line 404
    nop

    .line 405
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

.method public getEmojiType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->emojiType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEmojiTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->emojiType_:Ljava/lang/String;

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

.method public getMid()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->mid_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMidBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->mid_:Ljava/lang/String;

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

.method public getResult(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 8
    .line 9
    return-object p0
.end method

.method public getResultCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getResultList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResultOrBuilder(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResultOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResultOrBuilder;

    .line 8
    .line 9
    return-object p0
.end method

.method public getResultOrBuilderList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResultOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSerializedSize()I
    .locals 4

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->mid_:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getMid()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-static {v2, v0}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move v0, v1

    .line 27
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userId_:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_2

    .line 34
    .line 35
    const/4 v2, 0x2

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getUserId()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    add-int/2addr v0, v2

    .line 45
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 46
    .line 47
    if-eqz v2, :cond_3

    .line 48
    .line 49
    const/4 v2, 0x3

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    add-int/2addr v0, v2

    .line 59
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->emojiType_:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-nez v2, :cond_4

    .line 66
    .line 67
    const/4 v2, 0x4

    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getEmojiType()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    add-int/2addr v0, v2

    .line 77
    :cond_4
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 78
    .line 79
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-ge v1, v2, :cond_5

    .line 84
    .line 85
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 86
    .line 87
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    check-cast v2, Lcom/google/protobuf/q;

    .line 92
    .line 93
    const/4 v3, 0x5

    .line 94
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    add-int/2addr v0, v2

    .line 99
    add-int/lit8 v1, v1, 0x1

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 103
    .line 104
    if-eqz v1, :cond_6

    .line 105
    .line 106
    const/4 v1, 0x6

    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getTempdata()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    add-int/2addr v0, v1

    .line 116
    :cond_6
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 117
    .line 118
    return v0
.end method

.method public getTempdata()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userId_:Ljava/lang/String;

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

.method public getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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

.method public hasTempdata()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

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

.method public hasUserMask()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->mid_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getMid()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getUserId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->emojiType_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getEmojiType()Ljava/lang/String;

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
    const/4 v0, 0x0

    .line 62
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 63
    .line 64
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-ge v0, v1, :cond_4

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->result_:Lcom/google/protobuf/l$h;

    .line 71
    .line 72
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Lcom/google/protobuf/q;

    .line 77
    .line 78
    const/4 v2, 0x5

    .line 79
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 80
    .line 81
    .line 82
    add-int/lit8 v0, v0, 0x1

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->tempdata_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 86
    .line 87
    if-eqz v0, :cond_5

    .line 88
    .line 89
    const/4 v0, 0x6

    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getTempdata()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 95
    .line 96
    .line 97
    :cond_5
    return-void
.end method
