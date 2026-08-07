.class public final Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsgOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LiveAnimationPlayMsg"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsgOrBuilder;"
    }
.end annotation


# static fields
.field public static final ANIMATIONTYPE_FIELD_NUMBER:I = 0xd

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

.field public static final DURATION_FIELD_NUMBER:I = 0x3

.field public static final LIVERESOURCEID_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;",
            ">;"
        }
    .end annotation
.end field

.field public static final PRIORITY_FIELD_NUMBER:I = 0x4

.field public static final ROOMID_FIELD_NUMBER:I = 0x1

.field public static final SVGAEFFECTEXTRAS_FIELD_NUMBER:I = 0xe

.field public static final TOMYQUEUE_FIELD_NUMBER:I = 0x7

.field public static final VIDEOEFFECTEXTRAS_FIELD_NUMBER:I = 0x6


# instance fields
.field private animationType_:Ljava/lang/String;

.field private bitField0_:I

.field private duration_:J

.field private liveResourceId_:Ljava/lang/String;

.field private priority_:J

.field private roomId_:Ljava/lang/String;

.field private svgaEffectExtras_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;",
            ">;"
        }
    .end annotation
.end field

.field private toMyQueue_:Z

.field private videoEffectExtras_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->makeImmutable()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->roomId_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->liveResourceId_:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->animationType_:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 23
    .line 24
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->setRoomId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->setRoomIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->setSvgaEffectExtras(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra$Builder;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->setSvgaEffectExtras(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->setToMyQueue(Z)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->setVideoEffectExtras(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra$Builder;)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->setVideoEffectExtras(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;)V

    return-void
.end method

.method public static bridge synthetic H()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->addAllSvgaEffectExtras(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllSvgaEffectExtras(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->ensureSvgaEffectExtrasIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addAllVideoEffectExtras(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->ensureVideoEffectExtrasIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addSvgaEffectExtras(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->ensureSvgaEffectExtrasIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addSvgaEffectExtras(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->ensureSvgaEffectExtrasIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addSvgaEffectExtras(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->ensureSvgaEffectExtrasIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addSvgaEffectExtras(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->ensureSvgaEffectExtrasIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addVideoEffectExtras(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->ensureVideoEffectExtrasIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addVideoEffectExtras(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->ensureVideoEffectExtrasIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addVideoEffectExtras(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->ensureVideoEffectExtrasIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addVideoEffectExtras(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->ensureVideoEffectExtrasIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->addAllVideoEffectExtras(Ljava/lang/Iterable;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->addSvgaEffectExtras(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra$Builder;)V

    return-void
.end method

.method private clearAnimationType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->getAnimationType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->animationType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearDuration()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->duration_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearLiveResourceId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->getLiveResourceId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->liveResourceId_:Ljava/lang/String;

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
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->priority_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearRoomId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->roomId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearSvgaEffectExtras()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearToMyQueue()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->toMyQueue_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearVideoEffectExtras()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->addSvgaEffectExtras(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->addSvgaEffectExtras(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra$Builder;)V

    return-void
.end method

.method private ensureSvgaEffectExtrasIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private ensureVideoEffectExtrasIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->addSvgaEffectExtras(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->addVideoEffectExtras(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra$Builder;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->addVideoEffectExtras(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->addVideoEffectExtras(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra$Builder;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->addVideoEffectExtras(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->clearAnimationType()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->clearDuration()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->clearLiveResourceId()V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->clearPriority()V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->clearRoomId()V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->clearSvgaEffectExtras()V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->clearToMyQueue()V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->clearVideoEffectExtras()V

    return-void
.end method

.method private removeSvgaEffectExtras(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->ensureSvgaEffectExtrasIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private removeVideoEffectExtras(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->ensureVideoEffectExtrasIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->removeSvgaEffectExtras(I)V

    return-void
.end method

.method private setAnimationType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->animationType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAnimationTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->animationType_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setDuration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->duration_:J

    .line 2
    .line 3
    return-void
.end method

.method private setLiveResourceId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->liveResourceId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setLiveResourceIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->liveResourceId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPriority(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->priority_:J

    .line 2
    .line 3
    return-void
.end method

.method private setRoomId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->roomId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setRoomIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->roomId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setSvgaEffectExtras(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->ensureSvgaEffectExtrasIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setSvgaEffectExtras(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->ensureSvgaEffectExtrasIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setToMyQueue(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->toMyQueue_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setVideoEffectExtras(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->ensureVideoEffectExtrasIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setVideoEffectExtras(ILcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->ensureVideoEffectExtrasIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->removeVideoEffectExtras(I)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->setAnimationType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->setAnimationTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->setDuration(J)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->setLiveResourceId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->setLiveResourceIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->setPriority(J)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->PARSER:Ll/ng60;

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
    const/16 v3, 0xa

    .line 63
    .line 64
    if-eq p1, v3, :cond_d

    .line 65
    .line 66
    const/16 v3, 0x12

    .line 67
    .line 68
    if-eq p1, v3, :cond_c

    .line 69
    .line 70
    const/16 v3, 0x18

    .line 71
    .line 72
    if-eq p1, v3, :cond_b

    .line 73
    .line 74
    const/16 v3, 0x20

    .line 75
    .line 76
    if-eq p1, v3, :cond_a

    .line 77
    .line 78
    const/16 v3, 0x32

    .line 79
    .line 80
    if-eq p1, v3, :cond_8

    .line 81
    .line 82
    const/16 v3, 0x38

    .line 83
    .line 84
    if-eq p1, v3, :cond_7

    .line 85
    .line 86
    const/16 v3, 0x6a

    .line 87
    .line 88
    if-eq p1, v3, :cond_6

    .line 89
    .line 90
    const/16 v3, 0x72

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
    goto/16 :goto_4

    .line 105
    .line 106
    :catch_1
    move-exception v0

    .line 107
    move-object p1, v0

    .line 108
    goto/16 :goto_5

    .line 109
    .line 110
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 111
    .line 112
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->q()Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-nez p1, :cond_5

    .line 117
    .line 118
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 119
    .line 120
    invoke-static {p1}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 125
    .line 126
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 127
    .line 128
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;->parser()Ll/ng60;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    check-cast v3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;

    .line 137
    .line 138
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    goto :goto_3

    .line 142
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->animationType_:Ljava/lang/String;

    .line 147
    .line 148
    goto :goto_3

    .line 149
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->toMyQueue_:Z

    .line 154
    .line 155
    goto :goto_3

    .line 156
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 157
    .line 158
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->q()Z

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    if-nez p1, :cond_9

    .line 163
    .line 164
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 165
    .line 166
    invoke-static {p1}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 171
    .line 172
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 173
    .line 174
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;->parser()Ll/ng60;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    check-cast v3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;

    .line 183
    .line 184
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    goto/16 :goto_3

    .line 188
    .line 189
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 190
    .line 191
    .line 192
    move-result-wide v3

    .line 193
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->priority_:J

    .line 194
    .line 195
    goto/16 :goto_3

    .line 196
    .line 197
    :cond_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 198
    .line 199
    .line 200
    move-result-wide v3

    .line 201
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->duration_:J

    .line 202
    .line 203
    goto/16 :goto_3

    .line 204
    .line 205
    :cond_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->liveResourceId_:Ljava/lang/String;

    .line 210
    .line 211
    goto/16 :goto_3

    .line 212
    .line 213
    :cond_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->roomId_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 218
    .line 219
    goto/16 :goto_3

    .line 220
    .line 221
    :catchall_1
    move-exception v0

    .line 222
    move-object p0, v0

    .line 223
    throw p0

    .line 224
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 225
    .line 226
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 238
    .line 239
    .line 240
    return-object v1

    .line 241
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 242
    .line 243
    .line 244
    move-result-object p0

    .line 245
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 246
    .line 247
    .line 248
    return-object v1

    .line 249
    :cond_e
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    .line 250
    .line 251
    return-object p0

    .line 252
    :pswitch_3
    move-object v3, p2

    .line 253
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 254
    .line 255
    check-cast p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    .line 256
    .line 257
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->roomId_:Ljava/lang/String;

    .line 258
    .line 259
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 260
    .line 261
    .line 262
    move-result p1

    .line 263
    xor-int/2addr p1, v2

    .line 264
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->roomId_:Ljava/lang/String;

    .line 265
    .line 266
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->roomId_:Ljava/lang/String;

    .line 267
    .line 268
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 269
    .line 270
    .line 271
    move-result v1

    .line 272
    xor-int/2addr v1, v2

    .line 273
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->roomId_:Ljava/lang/String;

    .line 274
    .line 275
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->roomId_:Ljava/lang/String;

    .line 280
    .line 281
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->liveResourceId_:Ljava/lang/String;

    .line 282
    .line 283
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 284
    .line 285
    .line 286
    move-result p1

    .line 287
    xor-int/2addr p1, v2

    .line 288
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->liveResourceId_:Ljava/lang/String;

    .line 289
    .line 290
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->liveResourceId_:Ljava/lang/String;

    .line 291
    .line 292
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 293
    .line 294
    .line 295
    move-result v1

    .line 296
    xor-int/2addr v1, v2

    .line 297
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->liveResourceId_:Ljava/lang/String;

    .line 298
    .line 299
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->liveResourceId_:Ljava/lang/String;

    .line 304
    .line 305
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->duration_:J

    .line 306
    .line 307
    const-wide/16 p1, 0x0

    .line 308
    .line 309
    cmp-long v1, v5, p1

    .line 310
    .line 311
    if-eqz v1, :cond_f

    .line 312
    .line 313
    move v4, v2

    .line 314
    goto :goto_6

    .line 315
    :cond_f
    move v4, v0

    .line 316
    :goto_6
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->duration_:J

    .line 317
    .line 318
    cmp-long v1, v8, p1

    .line 319
    .line 320
    if-eqz v1, :cond_10

    .line 321
    .line 322
    move v7, v2

    .line 323
    goto :goto_7

    .line 324
    :cond_10
    move v7, v0

    .line 325
    :goto_7
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 326
    .line 327
    .line 328
    move-result-wide v4

    .line 329
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->duration_:J

    .line 330
    .line 331
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->priority_:J

    .line 332
    .line 333
    cmp-long v1, v5, p1

    .line 334
    .line 335
    if-eqz v1, :cond_11

    .line 336
    .line 337
    move v4, v2

    .line 338
    goto :goto_8

    .line 339
    :cond_11
    move v4, v0

    .line 340
    :goto_8
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->priority_:J

    .line 341
    .line 342
    cmp-long p1, v8, p1

    .line 343
    .line 344
    if-eqz p1, :cond_12

    .line 345
    .line 346
    move v7, v2

    .line 347
    goto :goto_9

    .line 348
    :cond_12
    move v7, v0

    .line 349
    :goto_9
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 350
    .line 351
    .line 352
    move-result-wide p1

    .line 353
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->priority_:J

    .line 354
    .line 355
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 356
    .line 357
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 358
    .line 359
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 360
    .line 361
    .line 362
    move-result-object p1

    .line 363
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 364
    .line 365
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->toMyQueue_:Z

    .line 366
    .line 367
    iget-boolean p2, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->toMyQueue_:Z

    .line 368
    .line 369
    invoke-interface {v3, p1, p1, p2, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 370
    .line 371
    .line 372
    move-result p1

    .line 373
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->toMyQueue_:Z

    .line 374
    .line 375
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->animationType_:Ljava/lang/String;

    .line 376
    .line 377
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 378
    .line 379
    .line 380
    move-result p1

    .line 381
    xor-int/2addr p1, v2

    .line 382
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->animationType_:Ljava/lang/String;

    .line 383
    .line 384
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->animationType_:Ljava/lang/String;

    .line 385
    .line 386
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 387
    .line 388
    .line 389
    move-result v0

    .line 390
    xor-int/2addr v0, v2

    .line 391
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->animationType_:Ljava/lang/String;

    .line 392
    .line 393
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 394
    .line 395
    .line 396
    move-result-object p1

    .line 397
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->animationType_:Ljava/lang/String;

    .line 398
    .line 399
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 400
    .line 401
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 402
    .line 403
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 404
    .line 405
    .line 406
    move-result-object p1

    .line 407
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 408
    .line 409
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 410
    .line 411
    if-ne v3, p1, :cond_13

    .line 412
    .line 413
    iget p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->bitField0_:I

    .line 414
    .line 415
    iget p2, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->bitField0_:I

    .line 416
    .line 417
    or-int/2addr p1, p2

    .line 418
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->bitField0_:I

    .line 419
    .line 420
    :cond_13
    return-object p0

    .line 421
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg$Builder;

    .line 422
    .line 423
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg$Builder;-><init>(Ll/v3w;)V

    .line 424
    .line 425
    .line 426
    return-object p0

    .line 427
    :pswitch_5
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 428
    .line 429
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->n()V

    .line 430
    .line 431
    .line 432
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 433
    .line 434
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 435
    .line 436
    .line 437
    return-object v1

    .line 438
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    .line 439
    .line 440
    return-object p0

    .line 441
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;

    .line 442
    .line 443
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;-><init>()V

    .line 444
    .line 445
    .line 446
    return-object p0

    .line 447
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

.method public getAnimationType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->animationType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAnimationTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->animationType_:Ljava/lang/String;

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

.method public getDuration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->duration_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getLiveResourceId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->liveResourceId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveResourceIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->liveResourceId_:Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->priority_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->roomId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->roomId_:Ljava/lang/String;

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
    .locals 7

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->getRoomId()Ljava/lang/String;

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
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->liveResourceId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->getLiveResourceId()Ljava/lang/String;

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
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->duration_:J

    .line 46
    .line 47
    const-wide/16 v4, 0x0

    .line 48
    .line 49
    cmp-long v6, v2, v4

    .line 50
    .line 51
    if-eqz v6, :cond_3

    .line 52
    .line 53
    const/4 v6, 0x3

    .line 54
    invoke-static {v6, v2, v3}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    add-int/2addr v0, v2

    .line 59
    :cond_3
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->priority_:J

    .line 60
    .line 61
    cmp-long v4, v2, v4

    .line 62
    .line 63
    if-eqz v4, :cond_4

    .line 64
    .line 65
    const/4 v4, 0x4

    .line 66
    invoke-static {v4, v2, v3}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    add-int/2addr v0, v2

    .line 71
    :cond_4
    move v2, v1

    .line 72
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 73
    .line 74
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    if-ge v2, v3, :cond_5

    .line 79
    .line 80
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 81
    .line 82
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    check-cast v3, Lcom/google/protobuf/q;

    .line 87
    .line 88
    const/4 v4, 0x6

    .line 89
    invoke-static {v4, v3}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    add-int/2addr v0, v3

    .line 94
    add-int/lit8 v2, v2, 0x1

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_5
    iget-boolean v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->toMyQueue_:Z

    .line 98
    .line 99
    if-eqz v2, :cond_6

    .line 100
    .line 101
    const/4 v3, 0x7

    .line 102
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    add-int/2addr v0, v2

    .line 107
    :cond_6
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->animationType_:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-nez v2, :cond_7

    .line 114
    .line 115
    const/16 v2, 0xd

    .line 116
    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->getAnimationType()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    add-int/2addr v0, v2

    .line 126
    :cond_7
    :goto_2
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 127
    .line 128
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    if-ge v1, v2, :cond_8

    .line 133
    .line 134
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 135
    .line 136
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    check-cast v2, Lcom/google/protobuf/q;

    .line 141
    .line 142
    const/16 v3, 0xe

    .line 143
    .line 144
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    add-int/2addr v0, v2

    .line 149
    add-int/lit8 v1, v1, 0x1

    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_8
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 153
    .line 154
    return v0
.end method

.method public getSvgaEffectExtras(I)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;

    .line 8
    .line 9
    return-object p0
.end method

.method public getSvgaEffectExtrasCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

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

.method public getSvgaEffectExtrasList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSvgaEffectExtrasOrBuilder(I)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtraOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtraOrBuilder;

    .line 8
    .line 9
    return-object p0
.end method

.method public getSvgaEffectExtrasOrBuilderList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtraOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getToMyQueue()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->toMyQueue_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getVideoEffectExtras(I)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;

    .line 8
    .line 9
    return-object p0
.end method

.method public getVideoEffectExtrasCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

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

.method public getVideoEffectExtrasList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoEffectExtrasOrBuilder(I)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtraOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtraOrBuilder;

    .line 8
    .line 9
    return-object p0
.end method

.method public getVideoEffectExtrasOrBuilderList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtraOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->getRoomId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->liveResourceId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->getLiveResourceId()Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->duration_:J

    .line 34
    .line 35
    const-wide/16 v2, 0x0

    .line 36
    .line 37
    cmp-long v4, v0, v2

    .line 38
    .line 39
    if-eqz v4, :cond_2

    .line 40
    .line 41
    const/4 v4, 0x3

    .line 42
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->priority_:J

    .line 46
    .line 47
    cmp-long v2, v0, v2

    .line 48
    .line 49
    if-eqz v2, :cond_3

    .line 50
    .line 51
    const/4 v2, 0x4

    .line 52
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 53
    .line 54
    .line 55
    :cond_3
    const/4 v0, 0x0

    .line 56
    move v1, v0

    .line 57
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 58
    .line 59
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-ge v1, v2, :cond_4

    .line 64
    .line 65
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 66
    .line 67
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    check-cast v2, Lcom/google/protobuf/q;

    .line 72
    .line 73
    const/4 v3, 0x6

    .line 74
    invoke-virtual {p1, v3, v2}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 75
    .line 76
    .line 77
    add-int/lit8 v1, v1, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_4
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->toMyQueue_:Z

    .line 81
    .line 82
    if-eqz v1, :cond_5

    .line 83
    .line 84
    const/4 v2, 0x7

    .line 85
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 86
    .line 87
    .line 88
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->animationType_:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-nez v1, :cond_6

    .line 95
    .line 96
    const/16 v1, 0xd

    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->getAnimationType()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-virtual {p1, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 103
    .line 104
    .line 105
    :cond_6
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 106
    .line 107
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-ge v0, v1, :cond_7

    .line 112
    .line 113
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->svgaEffectExtras_:Lcom/google/protobuf/l$h;

    .line 114
    .line 115
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    check-cast v1, Lcom/google/protobuf/q;

    .line 120
    .line 121
    const/16 v2, 0xe

    .line 122
    .line 123
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 124
    .line 125
    .line 126
    add-int/lit8 v0, v0, 0x1

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_7
    return-void
.end method
