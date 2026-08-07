.class public final Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsgOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SystemVoiceLiveCommentsMsg"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsgOrBuilder;"
    }
.end annotation


# static fields
.field public static final ALIGNMENT_FIELD_NUMBER:I = 0xd

.field public static final BACKGROUND_FIELD_NUMBER:I = 0xb

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

.field public static final DISPLAYDURATION_FIELD_NUMBER:I = 0x6

.field public static final ENDCOLOR_FIELD_NUMBER:I = 0x5

.field public static final GOTOSCHEMA_FIELD_NUMBER:I = 0x7

.field public static final ICONURL_FIELD_NUMBER:I = 0x3

.field public static final ID_FIELD_NUMBER:I = 0x9

.field public static final LIVEID_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;",
            ">;"
        }
    .end annotation
.end field

.field public static final PRIORITY_FIELD_NUMBER:I = 0xc

.field public static final ROOMID_FIELD_NUMBER:I = 0x1

.field public static final STARTCOLOR_FIELD_NUMBER:I = 0x4

.field public static final TEMPLATEDATA_FIELD_NUMBER:I = 0x8

.field public static final TYPE_FIELD_NUMBER:I = 0xa


# instance fields
.field private alignment_:I

.field private background_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

.field private displayDuration_:J

.field private endColor_:Ljava/lang/String;

.field private gotoSchema_:Ljava/lang/String;

.field private iconUrl_:Ljava/lang/String;

.field private id_:Ljava/lang/String;

.field private liveID_:Ljava/lang/String;

.field private priority_:J

.field private roomID_:Ljava/lang/String;

.field private startColor_:Ljava/lang/String;

.field private templateData_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

.field private type_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->roomID_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->liveID_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->iconUrl_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->startColor_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->endColor_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->gotoSchema_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->id_:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->type_:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setLiveID(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setLiveIDBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setPriority(J)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setRoomID(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setRoomIDBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setStartColor(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setStartColorBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setTemplateData(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData$Builder;)V

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setTemplateData(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;)V

    return-void
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic N()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->clearAlignment()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->clearBackground()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->clearDisplayDuration()V

    return-void
.end method

.method private clearAlignment()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->alignment_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearBackground()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->background_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 3
    .line 4
    return-void
.end method

.method private clearDisplayDuration()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->displayDuration_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearEndColor()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getEndColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->endColor_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearGotoSchema()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getGotoSchema()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->gotoSchema_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearIconUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getIconUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->iconUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->id_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLiveID()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getLiveID()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->liveID_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearPriority()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->priority_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearRoomID()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getRoomID()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->roomID_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearStartColor()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getStartColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->startColor_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTemplateData()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->templateData_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 3
    .line 4
    return-void
.end method

.method private clearType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->type_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->clearEndColor()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->clearGotoSchema()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->clearIconUrl()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->clearId()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->clearLiveID()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->clearPriority()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->clearRoomID()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->clearStartColor()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->clearTemplateData()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->clearType()V

    return-void
.end method

.method private mergeBackground(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->background_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->background_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;->newBuilder(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->background_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->background_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 33
    .line 34
    return-void
.end method

.method private mergeTemplateData(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->templateData_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->templateData_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;->newBuilder(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->templateData_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->templateData_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->mergeBackground(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->mergeTemplateData(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$Alignment;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setAlignment(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$Alignment;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setAlignmentValue(I)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setBackground(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground$Builder;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setBackground(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;)V

    return-void
.end method

.method private setAlignment(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$Alignment;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$Alignment;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->alignment_:I

    .line 9
    .line 10
    return-void
.end method

.method private setAlignmentValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->alignment_:I

    .line 2
    .line 3
    return-void
.end method

.method private setBackground(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->background_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 8
    .line 9
    return-void
.end method

.method private setBackground(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->background_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    return-void
.end method

.method private setDisplayDuration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->displayDuration_:J

    .line 2
    .line 3
    return-void
.end method

.method private setEndColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->endColor_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setEndColorBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->endColor_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setGotoSchema(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->gotoSchema_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setGotoSchemaBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->gotoSchema_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setIconUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->iconUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setIconUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->iconUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->id_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->id_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setLiveID(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->liveID_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setLiveIDBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->liveID_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPriority(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->priority_:J

    .line 2
    .line 3
    return-void
.end method

.method private setRoomID(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->roomID_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setRoomIDBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->roomID_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setStartColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->startColor_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setStartColorBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->startColor_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTemplateData(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->templateData_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 8
    .line 9
    return-void
.end method

.method private setTemplateData(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->templateData_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    return-void
.end method

.method private setType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->type_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->type_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setDisplayDuration(J)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setEndColor(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setEndColorBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setGotoSchema(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setGotoSchemaBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setIconUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->setIconUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_5

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
    goto/16 :goto_6

    .line 74
    .line 75
    :catch_1
    move-exception v0

    .line 76
    move-object p1, v0

    .line 77
    goto/16 :goto_7

    .line 78
    .line 79
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->alignment_:I

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
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->priority_:J

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :sswitch_3
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->background_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 94
    .line 95
    if-eqz p1, :cond_3

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground$Builder;

    .line 102
    .line 103
    goto :goto_4

    .line 104
    :cond_3
    move-object p1, v1

    .line 105
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;->parser()Ll/ng60;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    check-cast v3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 114
    .line 115
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->background_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 116
    .line 117
    if-eqz p1, :cond_2

    .line 118
    .line 119
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 127
    .line 128
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->background_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->type_:Ljava/lang/String;

    .line 136
    .line 137
    goto :goto_3

    .line 138
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->id_:Ljava/lang/String;

    .line 143
    .line 144
    goto :goto_3

    .line 145
    :sswitch_6
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->templateData_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 146
    .line 147
    if-eqz p1, :cond_4

    .line 148
    .line 149
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData$Builder;

    .line 154
    .line 155
    goto :goto_5

    .line 156
    :cond_4
    move-object p1, v1

    .line 157
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;->parser()Ll/ng60;

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
    check-cast v3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 166
    .line 167
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->templateData_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 179
    .line 180
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->templateData_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 181
    .line 182
    goto/16 :goto_3

    .line 183
    .line 184
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->gotoSchema_:Ljava/lang/String;

    .line 189
    .line 190
    goto/16 :goto_3

    .line 191
    .line 192
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 193
    .line 194
    .line 195
    move-result-wide v3

    .line 196
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->displayDuration_:J

    .line 197
    .line 198
    goto/16 :goto_3

    .line 199
    .line 200
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->endColor_:Ljava/lang/String;

    .line 205
    .line 206
    goto/16 :goto_3

    .line 207
    .line 208
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->startColor_:Ljava/lang/String;

    .line 213
    .line 214
    goto/16 :goto_3

    .line 215
    .line 216
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->iconUrl_:Ljava/lang/String;

    .line 221
    .line 222
    goto/16 :goto_3

    .line 223
    .line 224
    :sswitch_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->liveID_:Ljava/lang/String;

    .line 229
    .line 230
    goto/16 :goto_3

    .line 231
    .line 232
    :sswitch_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->roomID_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 237
    .line 238
    goto/16 :goto_3

    .line 239
    .line 240
    :catchall_1
    move-exception v0

    .line 241
    move-object p0, v0

    .line 242
    throw p0

    .line 243
    :goto_6
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 244
    .line 245
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 253
    .line 254
    .line 255
    move-result-object p0

    .line 256
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 257
    .line 258
    .line 259
    return-object v1

    .line 260
    :goto_7
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 261
    .line 262
    .line 263
    move-result-object p0

    .line 264
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 265
    .line 266
    .line 267
    return-object v1

    .line 268
    :cond_5
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 269
    .line 270
    return-object p0

    .line 271
    :pswitch_3
    move-object v3, p2

    .line 272
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 273
    .line 274
    check-cast p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 275
    .line 276
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->roomID_:Ljava/lang/String;

    .line 277
    .line 278
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 279
    .line 280
    .line 281
    move-result p1

    .line 282
    xor-int/2addr p1, v2

    .line 283
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->roomID_:Ljava/lang/String;

    .line 284
    .line 285
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->roomID_:Ljava/lang/String;

    .line 286
    .line 287
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 288
    .line 289
    .line 290
    move-result v1

    .line 291
    xor-int/2addr v1, v2

    .line 292
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->roomID_:Ljava/lang/String;

    .line 293
    .line 294
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->roomID_:Ljava/lang/String;

    .line 299
    .line 300
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->liveID_:Ljava/lang/String;

    .line 301
    .line 302
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 303
    .line 304
    .line 305
    move-result p1

    .line 306
    xor-int/2addr p1, v2

    .line 307
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->liveID_:Ljava/lang/String;

    .line 308
    .line 309
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->liveID_:Ljava/lang/String;

    .line 310
    .line 311
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 312
    .line 313
    .line 314
    move-result v1

    .line 315
    xor-int/2addr v1, v2

    .line 316
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->liveID_:Ljava/lang/String;

    .line 317
    .line 318
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object p1

    .line 322
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->liveID_:Ljava/lang/String;

    .line 323
    .line 324
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->iconUrl_:Ljava/lang/String;

    .line 325
    .line 326
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 327
    .line 328
    .line 329
    move-result p1

    .line 330
    xor-int/2addr p1, v2

    .line 331
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->iconUrl_:Ljava/lang/String;

    .line 332
    .line 333
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->iconUrl_:Ljava/lang/String;

    .line 334
    .line 335
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 336
    .line 337
    .line 338
    move-result v1

    .line 339
    xor-int/2addr v1, v2

    .line 340
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->iconUrl_:Ljava/lang/String;

    .line 341
    .line 342
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object p1

    .line 346
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->iconUrl_:Ljava/lang/String;

    .line 347
    .line 348
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->startColor_:Ljava/lang/String;

    .line 349
    .line 350
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 351
    .line 352
    .line 353
    move-result p1

    .line 354
    xor-int/2addr p1, v2

    .line 355
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->startColor_:Ljava/lang/String;

    .line 356
    .line 357
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->startColor_:Ljava/lang/String;

    .line 358
    .line 359
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 360
    .line 361
    .line 362
    move-result v1

    .line 363
    xor-int/2addr v1, v2

    .line 364
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->startColor_:Ljava/lang/String;

    .line 365
    .line 366
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 367
    .line 368
    .line 369
    move-result-object p1

    .line 370
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->startColor_:Ljava/lang/String;

    .line 371
    .line 372
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->endColor_:Ljava/lang/String;

    .line 373
    .line 374
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 375
    .line 376
    .line 377
    move-result p1

    .line 378
    xor-int/2addr p1, v2

    .line 379
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->endColor_:Ljava/lang/String;

    .line 380
    .line 381
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->endColor_:Ljava/lang/String;

    .line 382
    .line 383
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 384
    .line 385
    .line 386
    move-result v1

    .line 387
    xor-int/2addr v1, v2

    .line 388
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->endColor_:Ljava/lang/String;

    .line 389
    .line 390
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object p1

    .line 394
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->endColor_:Ljava/lang/String;

    .line 395
    .line 396
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->displayDuration_:J

    .line 397
    .line 398
    const-wide/16 p1, 0x0

    .line 399
    .line 400
    cmp-long v1, v5, p1

    .line 401
    .line 402
    if-eqz v1, :cond_6

    .line 403
    .line 404
    move v4, v2

    .line 405
    goto :goto_8

    .line 406
    :cond_6
    move v4, v0

    .line 407
    :goto_8
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->displayDuration_:J

    .line 408
    .line 409
    cmp-long v1, v8, p1

    .line 410
    .line 411
    if-eqz v1, :cond_7

    .line 412
    .line 413
    move v7, v2

    .line 414
    goto :goto_9

    .line 415
    :cond_7
    move v7, v0

    .line 416
    :goto_9
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 417
    .line 418
    .line 419
    move-result-wide v4

    .line 420
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->displayDuration_:J

    .line 421
    .line 422
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->gotoSchema_:Ljava/lang/String;

    .line 423
    .line 424
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 425
    .line 426
    .line 427
    move-result v1

    .line 428
    xor-int/2addr v1, v2

    .line 429
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->gotoSchema_:Ljava/lang/String;

    .line 430
    .line 431
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->gotoSchema_:Ljava/lang/String;

    .line 432
    .line 433
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 434
    .line 435
    .line 436
    move-result v5

    .line 437
    xor-int/2addr v5, v2

    .line 438
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->gotoSchema_:Ljava/lang/String;

    .line 439
    .line 440
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 441
    .line 442
    .line 443
    move-result-object v1

    .line 444
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->gotoSchema_:Ljava/lang/String;

    .line 445
    .line 446
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->templateData_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 447
    .line 448
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->templateData_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 449
    .line 450
    invoke-interface {v3, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 451
    .line 452
    .line 453
    move-result-object v1

    .line 454
    check-cast v1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 455
    .line 456
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->templateData_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 457
    .line 458
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->id_:Ljava/lang/String;

    .line 459
    .line 460
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 461
    .line 462
    .line 463
    move-result v1

    .line 464
    xor-int/2addr v1, v2

    .line 465
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->id_:Ljava/lang/String;

    .line 466
    .line 467
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->id_:Ljava/lang/String;

    .line 468
    .line 469
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 470
    .line 471
    .line 472
    move-result v5

    .line 473
    xor-int/2addr v5, v2

    .line 474
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->id_:Ljava/lang/String;

    .line 475
    .line 476
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 477
    .line 478
    .line 479
    move-result-object v1

    .line 480
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->id_:Ljava/lang/String;

    .line 481
    .line 482
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->type_:Ljava/lang/String;

    .line 483
    .line 484
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 485
    .line 486
    .line 487
    move-result v1

    .line 488
    xor-int/2addr v1, v2

    .line 489
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->type_:Ljava/lang/String;

    .line 490
    .line 491
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->type_:Ljava/lang/String;

    .line 492
    .line 493
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 494
    .line 495
    .line 496
    move-result v5

    .line 497
    xor-int/2addr v5, v2

    .line 498
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->type_:Ljava/lang/String;

    .line 499
    .line 500
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 501
    .line 502
    .line 503
    move-result-object v1

    .line 504
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->type_:Ljava/lang/String;

    .line 505
    .line 506
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->background_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 507
    .line 508
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->background_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 509
    .line 510
    invoke-interface {v3, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 511
    .line 512
    .line 513
    move-result-object v1

    .line 514
    check-cast v1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 515
    .line 516
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->background_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 517
    .line 518
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->priority_:J

    .line 519
    .line 520
    cmp-long v1, v5, p1

    .line 521
    .line 522
    if-eqz v1, :cond_8

    .line 523
    .line 524
    move v4, v2

    .line 525
    goto :goto_a

    .line 526
    :cond_8
    move v4, v0

    .line 527
    :goto_a
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->priority_:J

    .line 528
    .line 529
    cmp-long p1, v8, p1

    .line 530
    .line 531
    if-eqz p1, :cond_9

    .line 532
    .line 533
    move v7, v2

    .line 534
    goto :goto_b

    .line 535
    :cond_9
    move v7, v0

    .line 536
    :goto_b
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 537
    .line 538
    .line 539
    move-result-wide p1

    .line 540
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->priority_:J

    .line 541
    .line 542
    iget p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->alignment_:I

    .line 543
    .line 544
    if-eqz p1, :cond_a

    .line 545
    .line 546
    move p2, v2

    .line 547
    goto :goto_c

    .line 548
    :cond_a
    move p2, v0

    .line 549
    :goto_c
    iget p3, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->alignment_:I

    .line 550
    .line 551
    if-eqz p3, :cond_b

    .line 552
    .line 553
    move v0, v2

    .line 554
    :cond_b
    invoke-interface {v3, p2, p1, v0, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 555
    .line 556
    .line 557
    move-result p1

    .line 558
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->alignment_:I

    .line 559
    .line 560
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 561
    .line 562
    return-object p0

    .line 563
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;

    .line 564
    .line 565
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;-><init>(Ll/kun0;)V

    .line 566
    .line 567
    .line 568
    return-object p0

    .line 569
    :pswitch_5
    return-object v1

    .line 570
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 571
    .line 572
    return-object p0

    .line 573
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 574
    .line 575
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;-><init>()V

    .line 576
    .line 577
    .line 578
    return-object p0

    .line 579
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

    .line 580
    .line 581
    .line 582
    .line 583
    .line 584
    .line 585
    .line 586
    .line 587
    .line 588
    .line 589
    .line 590
    .line 591
    .line 592
    .line 593
    .line 594
    .line 595
    .line 596
    .line 597
    .line 598
    .line 599
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_d
        0x12 -> :sswitch_c
        0x1a -> :sswitch_b
        0x22 -> :sswitch_a
        0x2a -> :sswitch_9
        0x30 -> :sswitch_8
        0x3a -> :sswitch_7
        0x42 -> :sswitch_6
        0x4a -> :sswitch_5
        0x52 -> :sswitch_4
        0x5a -> :sswitch_3
        0x60 -> :sswitch_2
        0x68 -> :sswitch_1
    .end sparse-switch
.end method

.method public getAlignment()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$Alignment;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->alignment_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$Alignment;->forNumber(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$Alignment;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$Alignment;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$Alignment;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getAlignmentValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->alignment_:I

    .line 2
    .line 3
    return p0
.end method

.method public getBackground()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->background_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getDisplayDuration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->displayDuration_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getEndColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->endColor_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEndColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->endColor_:Ljava/lang/String;

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

.method public getGotoSchema()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->gotoSchema_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGotoSchemaBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->gotoSchema_:Ljava/lang/String;

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

.method public getIconUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->iconUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIconUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->iconUrl_:Ljava/lang/String;

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

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->id_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->id_:Ljava/lang/String;

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

.method public getLiveID()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->liveID_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveIDBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->liveID_:Ljava/lang/String;

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

.method public getPriority()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->priority_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRoomID()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->roomID_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIDBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->roomID_:Ljava/lang/String;

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
    .locals 6

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->roomID_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getRoomID()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->liveID_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getLiveID()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->iconUrl_:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-nez v1, :cond_3

    .line 51
    .line 52
    const/4 v1, 0x3

    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getIconUrl()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    add-int/2addr v0, v1

    .line 62
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->startColor_:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-nez v1, :cond_4

    .line 69
    .line 70
    const/4 v1, 0x4

    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getStartColor()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    add-int/2addr v0, v1

    .line 80
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->endColor_:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-nez v1, :cond_5

    .line 87
    .line 88
    const/4 v1, 0x5

    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getEndColor()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    add-int/2addr v0, v1

    .line 98
    :cond_5
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->displayDuration_:J

    .line 99
    .line 100
    const-wide/16 v3, 0x0

    .line 101
    .line 102
    cmp-long v5, v1, v3

    .line 103
    .line 104
    if-eqz v5, :cond_6

    .line 105
    .line 106
    const/4 v5, 0x6

    .line 107
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    add-int/2addr v0, v1

    .line 112
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->gotoSchema_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getGotoSchema()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->templateData_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 131
    .line 132
    if-eqz v1, :cond_8

    .line 133
    .line 134
    const/16 v1, 0x8

    .line 135
    .line 136
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getTemplateData()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    add-int/2addr v0, v1

    .line 145
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->id_:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    if-nez v1, :cond_9

    .line 152
    .line 153
    const/16 v1, 0x9

    .line 154
    .line 155
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getId()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    add-int/2addr v0, v1

    .line 164
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->type_:Ljava/lang/String;

    .line 165
    .line 166
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    if-nez v1, :cond_a

    .line 171
    .line 172
    const/16 v1, 0xa

    .line 173
    .line 174
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getType()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    add-int/2addr v0, v1

    .line 183
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->background_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 184
    .line 185
    if-eqz v1, :cond_b

    .line 186
    .line 187
    const/16 v1, 0xb

    .line 188
    .line 189
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getBackground()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    add-int/2addr v0, v1

    .line 198
    :cond_b
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->priority_:J

    .line 199
    .line 200
    cmp-long v3, v1, v3

    .line 201
    .line 202
    if-eqz v3, :cond_c

    .line 203
    .line 204
    const/16 v3, 0xc

    .line 205
    .line 206
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    add-int/2addr v0, v1

    .line 211
    :cond_c
    iget v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->alignment_:I

    .line 212
    .line 213
    sget-object v2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$Alignment;->Center:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$Alignment;

    .line 214
    .line 215
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$Alignment;->getNumber()I

    .line 216
    .line 217
    .line 218
    move-result v2

    .line 219
    if-eq v1, v2, :cond_d

    .line 220
    .line 221
    const/16 v1, 0xd

    .line 222
    .line 223
    iget v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->alignment_:I

    .line 224
    .line 225
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 226
    .line 227
    .line 228
    move-result v1

    .line 229
    add-int/2addr v0, v1

    .line 230
    :cond_d
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 231
    .line 232
    return v0
.end method

.method public getStartColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->startColor_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStartColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->startColor_:Ljava/lang/String;

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

.method public getTemplateData()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->templateData_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->type_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->type_:Ljava/lang/String;

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

.method public hasBackground()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->background_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

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

.method public hasTemplateData()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->templateData_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

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
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->roomID_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getRoomID()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->liveID_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getLiveID()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->iconUrl_:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    const/4 v0, 0x3

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getIconUrl()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->startColor_:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_3

    .line 56
    .line 57
    const/4 v0, 0x4

    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getStartColor()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->endColor_:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_4

    .line 72
    .line 73
    const/4 v0, 0x5

    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getEndColor()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_4
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->displayDuration_:J

    .line 82
    .line 83
    const-wide/16 v2, 0x0

    .line 84
    .line 85
    cmp-long v4, v0, v2

    .line 86
    .line 87
    if-eqz v4, :cond_5

    .line 88
    .line 89
    const/4 v4, 0x6

    .line 90
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 91
    .line 92
    .line 93
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->gotoSchema_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getGotoSchema()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->templateData_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 110
    .line 111
    if-eqz v0, :cond_7

    .line 112
    .line 113
    const/16 v0, 0x8

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getTemplateData()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 120
    .line 121
    .line 122
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->id_:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-nez v0, :cond_8

    .line 129
    .line 130
    const/16 v0, 0x9

    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getId()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 137
    .line 138
    .line 139
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->type_:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-nez v0, :cond_9

    .line 146
    .line 147
    const/16 v0, 0xa

    .line 148
    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getType()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 154
    .line 155
    .line 156
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->background_:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 157
    .line 158
    if-eqz v0, :cond_a

    .line 159
    .line 160
    const/16 v0, 0xb

    .line 161
    .line 162
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->getBackground()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 167
    .line 168
    .line 169
    :cond_a
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->priority_:J

    .line 170
    .line 171
    cmp-long v2, v0, v2

    .line 172
    .line 173
    if-eqz v2, :cond_b

    .line 174
    .line 175
    const/16 v2, 0xc

    .line 176
    .line 177
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 178
    .line 179
    .line 180
    :cond_b
    iget v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->alignment_:I

    .line 181
    .line 182
    sget-object v1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$Alignment;->Center:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$Alignment;

    .line 183
    .line 184
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$Alignment;->getNumber()I

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    if-eq v0, v1, :cond_c

    .line 189
    .line 190
    const/16 v0, 0xd

    .line 191
    .line 192
    iget p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->alignment_:I

    .line 193
    .line 194
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 195
    .line 196
    .line 197
    :cond_c
    return-void
.end method
