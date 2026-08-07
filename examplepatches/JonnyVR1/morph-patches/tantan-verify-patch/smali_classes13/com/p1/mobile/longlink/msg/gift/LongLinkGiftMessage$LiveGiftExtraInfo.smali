.class public final Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfoOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LiveGiftExtraInfo"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfoOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

.field public static final DRAWINFO_FIELD_NUMBER:I = 0x1

.field public static final EFFECTEXT_FIELD_NUMBER:I = 0x6

.field public static final MASKMODE_FIELD_NUMBER:I = 0x2

.field public static final MASK_FIELD_NUMBER:I = 0x3

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final PREVIEWMASK_FIELD_NUMBER:I = 0x7

.field public static final RECEIVERSHOWMASK_FIELD_NUMBER:I = 0x9

.field public static final SENDERSHOWMASK_FIELD_NUMBER:I = 0x8

.field public static final USERMASK_FIELD_NUMBER:I = 0x4

.field public static final VIDEOEFFECTEXTRAS_FIELD_NUMBER:I = 0x5


# instance fields
.field private bitField0_:I

.field private drawInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

.field private effectExt_:Ljava/lang/String;

.field private maskMode_:Z

.field private mask_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

.field private previewMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

.field private receiverShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

.field private senderShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

.field private userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

.field private videoEffectExtras_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

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
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->effectExt_:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->setMask(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->setMaskMode(Z)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->setPreviewMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->setPreviewMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->setReceiverShowMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->setReceiverShowMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->setSenderShowMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->setSenderShowMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->setUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->setUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->setVideoEffectExtras(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra$Builder;)V

    return-void
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->setVideoEffectExtras(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;)V

    return-void
.end method

.method public static bridge synthetic M()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->addAllVideoEffectExtras(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllVideoEffectExtras(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->ensureVideoEffectExtrasIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addVideoEffectExtras(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->ensureVideoEffectExtrasIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addVideoEffectExtras(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->ensureVideoEffectExtrasIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addVideoEffectExtras(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->ensureVideoEffectExtrasIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addVideoEffectExtras(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->ensureVideoEffectExtrasIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->addVideoEffectExtras(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra$Builder;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->addVideoEffectExtras(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;)V

    return-void
.end method

.method private clearDrawInfo()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->drawInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 3
    .line 4
    return-void
.end method

.method private clearEffectExt()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getEffectExt()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->effectExt_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearMask()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mask_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 3
    .line 4
    return-void
.end method

.method private clearMaskMode()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->maskMode_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearPreviewMask()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->previewMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 3
    .line 4
    return-void
.end method

.method private clearReceiverShowMask()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->receiverShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 3
    .line 4
    return-void
.end method

.method private clearSenderShowMask()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->senderShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 3
    .line 4
    return-void
.end method

.method private clearUserMask()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->addVideoEffectExtras(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra$Builder;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->addVideoEffectExtras(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;)V

    return-void
.end method

.method private ensureVideoEffectExtrasIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->clearDrawInfo()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->clearEffectExt()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->clearMask()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->clearMaskMode()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->clearPreviewMask()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->clearReceiverShowMask()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->clearSenderShowMask()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->clearUserMask()V

    return-void
.end method

.method private mergeDrawInfo(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->drawInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->drawInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->drawInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->drawInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 33
    .line 34
    return-void
.end method

.method private mergeMask(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mask_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mask_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;->newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mask_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mask_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 33
    .line 34
    return-void
.end method

.method private mergePreviewMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->previewMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->previewMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->previewMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->previewMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 33
    .line 34
    return-void
.end method

.method private mergeReceiverShowMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->receiverShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->receiverShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->receiverShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->receiverShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 33
    .line 34
    return-void
.end method

.method private mergeSenderShowMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->senderShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->senderShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->senderShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->senderShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 33
    .line 34
    return-void
.end method

.method private mergeUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->clearVideoEffectExtras()V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mergeDrawInfo(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mergeMask(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mergePreviewMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mergeReceiverShowMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method private removeVideoEffectExtras(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->ensureVideoEffectExtrasIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mergeSenderShowMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method private setDrawInfo(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->drawInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 8
    .line 9
    return-void
.end method

.method private setDrawInfo(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->drawInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    return-void
.end method

.method private setEffectExt(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->effectExt_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setEffectExtBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->effectExt_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setMask(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mask_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 8
    .line 9
    return-void
.end method

.method private setMask(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mask_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    return-void
.end method

.method private setMaskMode(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->maskMode_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setPreviewMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->previewMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 8
    .line 9
    return-void
.end method

.method private setPreviewMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->previewMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    return-void
.end method

.method private setReceiverShowMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->receiverShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 8
    .line 9
    return-void
.end method

.method private setReceiverShowMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->receiverShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    return-void
.end method

.method private setSenderShowMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->senderShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 8
    .line 9
    return-void
.end method

.method private setSenderShowMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->senderShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 8
    .line 9
    return-void
.end method

.method private setUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    return-void
.end method

.method private setVideoEffectExtras(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->ensureVideoEffectExtrasIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setVideoEffectExtras(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->ensureVideoEffectExtrasIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mergeUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->removeVideoEffectExtras(I)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->setDrawInfo(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->setDrawInfo(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->setEffectExt(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->setEffectExtBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->setMask(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask$Builder;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    const/4 v0, 0x1

    .line 10
    const/4 v1, 0x0

    .line 11
    packed-switch p1, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/l710;->a()V

    .line 15
    .line 16
    .line 17
    return-object v1

    .line 18
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->PARSER:Ll/ng60;

    .line 19
    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    const-class p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 23
    .line 24
    monitor-enter p0

    .line 25
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->PARSER:Ll/ng60;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 30
    .line 31
    sget-object p2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 32
    .line 33
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 34
    .line 35
    .line 36
    sput-object p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->PARSER:Ll/ng60;

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
    if-nez p1, :cond_14

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
    if-eq v2, v3, :cond_12

    .line 64
    .line 65
    const/16 v3, 0x10

    .line 66
    .line 67
    if-eq v2, v3, :cond_11

    .line 68
    .line 69
    const/16 v3, 0x1a

    .line 70
    .line 71
    if-eq v2, v3, :cond_f

    .line 72
    .line 73
    const/16 v3, 0x22

    .line 74
    .line 75
    if-eq v2, v3, :cond_d

    .line 76
    .line 77
    const/16 v3, 0x2a

    .line 78
    .line 79
    if-eq v2, v3, :cond_b

    .line 80
    .line 81
    const/16 v3, 0x32

    .line 82
    .line 83
    if-eq v2, v3, :cond_a

    .line 84
    .line 85
    const/16 v3, 0x3a

    .line 86
    .line 87
    if-eq v2, v3, :cond_8

    .line 88
    .line 89
    const/16 v3, 0x42

    .line 90
    .line 91
    if-eq v2, v3, :cond_6

    .line 92
    .line 93
    const/16 v3, 0x4a

    .line 94
    .line 95
    if-eq v2, v3, :cond_4

    .line 96
    .line 97
    invoke-virtual {p2, v2}, Lcom/google/protobuf/e;->R(I)Z

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    if-nez v2, :cond_2

    .line 102
    .line 103
    :cond_3
    move p1, v0

    .line 104
    goto :goto_3

    .line 105
    :catch_0
    move-exception p1

    .line 106
    goto/16 :goto_a

    .line 107
    .line 108
    :catch_1
    move-exception p1

    .line 109
    goto/16 :goto_b

    .line 110
    .line 111
    :cond_4
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->receiverShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 112
    .line 113
    if-eqz v2, :cond_5

    .line 114
    .line 115
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    check-cast v2, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 120
    .line 121
    goto :goto_4

    .line 122
    :cond_5
    move-object v2, v1

    .line 123
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->parser()Ll/ng60;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    check-cast v3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 132
    .line 133
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->receiverShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 134
    .line 135
    if-eqz v2, :cond_2

    .line 136
    .line 137
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    check-cast v2, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 145
    .line 146
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->receiverShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 147
    .line 148
    goto :goto_3

    .line 149
    :cond_6
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->senderShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 150
    .line 151
    if-eqz v2, :cond_7

    .line 152
    .line 153
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    check-cast v2, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 158
    .line 159
    goto :goto_5

    .line 160
    :cond_7
    move-object v2, v1

    .line 161
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->parser()Ll/ng60;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    check-cast v3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 170
    .line 171
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->senderShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 172
    .line 173
    if-eqz v2, :cond_2

    .line 174
    .line 175
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    check-cast v2, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 183
    .line 184
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->senderShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 185
    .line 186
    goto/16 :goto_3

    .line 187
    .line 188
    :cond_8
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->previewMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 189
    .line 190
    if-eqz v2, :cond_9

    .line 191
    .line 192
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    check-cast v2, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 197
    .line 198
    goto :goto_6

    .line 199
    :cond_9
    move-object v2, v1

    .line 200
    :goto_6
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->parser()Ll/ng60;

    .line 201
    .line 202
    .line 203
    move-result-object v3

    .line 204
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    check-cast v3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 209
    .line 210
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->previewMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 211
    .line 212
    if-eqz v2, :cond_2

    .line 213
    .line 214
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    check-cast v2, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 222
    .line 223
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->previewMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 224
    .line 225
    goto/16 :goto_3

    .line 226
    .line 227
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->effectExt_:Ljava/lang/String;

    .line 232
    .line 233
    goto/16 :goto_3

    .line 234
    .line 235
    :cond_b
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 236
    .line 237
    invoke-interface {v2}, Lcom/google/protobuf/l$h;->q()Z

    .line 238
    .line 239
    .line 240
    move-result v2

    .line 241
    if-nez v2, :cond_c

    .line 242
    .line 243
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 244
    .line 245
    invoke-static {v2}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 246
    .line 247
    .line 248
    move-result-object v2

    .line 249
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 250
    .line 251
    :cond_c
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 252
    .line 253
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;->parser()Ll/ng60;

    .line 254
    .line 255
    .line 256
    move-result-object v3

    .line 257
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 258
    .line 259
    .line 260
    move-result-object v3

    .line 261
    check-cast v3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;

    .line 262
    .line 263
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    goto/16 :goto_3

    .line 267
    .line 268
    :cond_d
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 269
    .line 270
    if-eqz v2, :cond_e

    .line 271
    .line 272
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 273
    .line 274
    .line 275
    move-result-object v2

    .line 276
    check-cast v2, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 277
    .line 278
    goto :goto_7

    .line 279
    :cond_e
    move-object v2, v1

    .line 280
    :goto_7
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->parser()Ll/ng60;

    .line 281
    .line 282
    .line 283
    move-result-object v3

    .line 284
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 285
    .line 286
    .line 287
    move-result-object v3

    .line 288
    check-cast v3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 289
    .line 290
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 291
    .line 292
    if-eqz v2, :cond_2

    .line 293
    .line 294
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 295
    .line 296
    .line 297
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 298
    .line 299
    .line 300
    move-result-object v2

    .line 301
    check-cast v2, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 302
    .line 303
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 304
    .line 305
    goto/16 :goto_3

    .line 306
    .line 307
    :cond_f
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mask_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 308
    .line 309
    if-eqz v2, :cond_10

    .line 310
    .line 311
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 312
    .line 313
    .line 314
    move-result-object v2

    .line 315
    check-cast v2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask$Builder;

    .line 316
    .line 317
    goto :goto_8

    .line 318
    :cond_10
    move-object v2, v1

    .line 319
    :goto_8
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;->parser()Ll/ng60;

    .line 320
    .line 321
    .line 322
    move-result-object v3

    .line 323
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 324
    .line 325
    .line 326
    move-result-object v3

    .line 327
    check-cast v3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 328
    .line 329
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mask_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 330
    .line 331
    if-eqz v2, :cond_2

    .line 332
    .line 333
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 334
    .line 335
    .line 336
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 337
    .line 338
    .line 339
    move-result-object v2

    .line 340
    check-cast v2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 341
    .line 342
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mask_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 343
    .line 344
    goto/16 :goto_3

    .line 345
    .line 346
    :cond_11
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 347
    .line 348
    .line 349
    move-result v2

    .line 350
    iput-boolean v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->maskMode_:Z

    .line 351
    .line 352
    goto/16 :goto_3

    .line 353
    .line 354
    :cond_12
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->drawInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 355
    .line 356
    if-eqz v2, :cond_13

    .line 357
    .line 358
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 359
    .line 360
    .line 361
    move-result-object v2

    .line 362
    check-cast v2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo$Builder;

    .line 363
    .line 364
    goto :goto_9

    .line 365
    :cond_13
    move-object v2, v1

    .line 366
    :goto_9
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->parser()Ll/ng60;

    .line 367
    .line 368
    .line 369
    move-result-object v3

    .line 370
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 371
    .line 372
    .line 373
    move-result-object v3

    .line 374
    check-cast v3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 375
    .line 376
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->drawInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 377
    .line 378
    if-eqz v2, :cond_2

    .line 379
    .line 380
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 381
    .line 382
    .line 383
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 384
    .line 385
    .line 386
    move-result-object v2

    .line 387
    check-cast v2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 388
    .line 389
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->drawInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 390
    .line 391
    goto/16 :goto_3

    .line 392
    .line 393
    :catchall_1
    move-exception p0

    .line 394
    throw p0

    .line 395
    :goto_a
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 396
    .line 397
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object p1

    .line 401
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 402
    .line 403
    .line 404
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 405
    .line 406
    .line 407
    move-result-object p0

    .line 408
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 409
    .line 410
    .line 411
    return-object v1

    .line 412
    :goto_b
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 413
    .line 414
    .line 415
    move-result-object p0

    .line 416
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 417
    .line 418
    .line 419
    return-object v1

    .line 420
    :cond_14
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 421
    .line 422
    return-object p0

    .line 423
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 424
    .line 425
    check-cast p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 426
    .line 427
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->drawInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 428
    .line 429
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->drawInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 430
    .line 431
    invoke-interface {p2, p1, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 432
    .line 433
    .line 434
    move-result-object p1

    .line 435
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 436
    .line 437
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->drawInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 438
    .line 439
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->maskMode_:Z

    .line 440
    .line 441
    iget-boolean v1, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->maskMode_:Z

    .line 442
    .line 443
    invoke-interface {p2, p1, p1, v1, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 444
    .line 445
    .line 446
    move-result p1

    .line 447
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->maskMode_:Z

    .line 448
    .line 449
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mask_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 450
    .line 451
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mask_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 452
    .line 453
    invoke-interface {p2, p1, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 454
    .line 455
    .line 456
    move-result-object p1

    .line 457
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 458
    .line 459
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mask_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 460
    .line 461
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 462
    .line 463
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 464
    .line 465
    invoke-interface {p2, p1, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 466
    .line 467
    .line 468
    move-result-object p1

    .line 469
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 470
    .line 471
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 472
    .line 473
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 474
    .line 475
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 476
    .line 477
    invoke-interface {p2, p1, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 478
    .line 479
    .line 480
    move-result-object p1

    .line 481
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 482
    .line 483
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->effectExt_:Ljava/lang/String;

    .line 484
    .line 485
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 486
    .line 487
    .line 488
    move-result p1

    .line 489
    xor-int/2addr p1, v0

    .line 490
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->effectExt_:Ljava/lang/String;

    .line 491
    .line 492
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->effectExt_:Ljava/lang/String;

    .line 493
    .line 494
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 495
    .line 496
    .line 497
    move-result v2

    .line 498
    xor-int/2addr v0, v2

    .line 499
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->effectExt_:Ljava/lang/String;

    .line 500
    .line 501
    invoke-interface {p2, p1, v1, v0, v2}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 502
    .line 503
    .line 504
    move-result-object p1

    .line 505
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->effectExt_:Ljava/lang/String;

    .line 506
    .line 507
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->previewMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 508
    .line 509
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->previewMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 510
    .line 511
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 512
    .line 513
    .line 514
    move-result-object p1

    .line 515
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 516
    .line 517
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->previewMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 518
    .line 519
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->senderShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 520
    .line 521
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->senderShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 522
    .line 523
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 524
    .line 525
    .line 526
    move-result-object p1

    .line 527
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 528
    .line 529
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->senderShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 530
    .line 531
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->receiverShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 532
    .line 533
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->receiverShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 534
    .line 535
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 536
    .line 537
    .line 538
    move-result-object p1

    .line 539
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 540
    .line 541
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->receiverShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 542
    .line 543
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 544
    .line 545
    if-ne p2, p1, :cond_15

    .line 546
    .line 547
    iget p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->bitField0_:I

    .line 548
    .line 549
    iget p2, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->bitField0_:I

    .line 550
    .line 551
    or-int/2addr p1, p2

    .line 552
    iput p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->bitField0_:I

    .line 553
    .line 554
    :cond_15
    return-object p0

    .line 555
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo$Builder;

    .line 556
    .line 557
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo$Builder;-><init>(Ll/o2w;)V

    .line 558
    .line 559
    .line 560
    return-object p0

    .line 561
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 562
    .line 563
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 564
    .line 565
    .line 566
    return-object v1

    .line 567
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 568
    .line 569
    return-object p0

    .line 570
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 571
    .line 572
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;-><init>()V

    .line 573
    .line 574
    .line 575
    return-object p0

    .line 576
    nop

    .line 577
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

.method public getDrawInfo()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->drawInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getEffectExt()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->effectExt_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEffectExtBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->effectExt_:Ljava/lang/String;

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

.method public getMask()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mask_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getMaskMode()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->maskMode_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getPreviewMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->previewMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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

.method public getReceiverShowMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->receiverShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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

.method public getSenderShowMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->senderShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->drawInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getDrawInfo()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-static {v2, v0}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move v0, v1

    .line 23
    :goto_0
    iget-boolean v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->maskMode_:Z

    .line 24
    .line 25
    if-eqz v2, :cond_2

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    add-int/2addr v0, v2

    .line 33
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mask_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 34
    .line 35
    if-eqz v2, :cond_3

    .line 36
    .line 37
    const/4 v2, 0x3

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getMask()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    add-int/2addr v0, v2

    .line 47
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 48
    .line 49
    if-eqz v2, :cond_4

    .line 50
    .line 51
    const/4 v2, 0x4

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    add-int/2addr v0, v2

    .line 61
    :cond_4
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 62
    .line 63
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-ge v1, v2, :cond_5

    .line 68
    .line 69
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 70
    .line 71
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    check-cast v2, Lcom/google/protobuf/q;

    .line 76
    .line 77
    const/4 v3, 0x5

    .line 78
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    add-int/2addr v0, v2

    .line 83
    add-int/lit8 v1, v1, 0x1

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->effectExt_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getEffectExt()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->previewMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 105
    .line 106
    if-eqz v1, :cond_7

    .line 107
    .line 108
    const/4 v1, 0x7

    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getPreviewMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    add-int/2addr v0, v1

    .line 118
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->senderShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 119
    .line 120
    if-eqz v1, :cond_8

    .line 121
    .line 122
    const/16 v1, 0x8

    .line 123
    .line 124
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getSenderShowMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    add-int/2addr v0, v1

    .line 133
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->receiverShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 134
    .line 135
    if-eqz v1, :cond_9

    .line 136
    .line 137
    const/16 v1, 0x9

    .line 138
    .line 139
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getReceiverShowMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    add-int/2addr v0, v1

    .line 148
    :cond_9
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 149
    .line 150
    return v0
.end method

.method public getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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

.method public getVideoEffectExtras(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;

    .line 8
    .line 9
    return-object p0
.end method

.method public getVideoEffectExtrasCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

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
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoEffectExtrasOrBuilder(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtraOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtraOrBuilder;

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
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtraOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public hasDrawInfo()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->drawInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

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

.method public hasMask()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mask_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

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

.method public hasPreviewMask()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->previewMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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

.method public hasReceiverShowMask()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->receiverShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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

.method public hasSenderShowMask()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->senderShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->drawInfo_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getDrawInfo()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->maskMode_:Z

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->mask_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getMask()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->userMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 34
    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    const/4 v0, 0x4

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    const/4 v0, 0x0

    .line 46
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 47
    .line 48
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-ge v0, v1, :cond_4

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->videoEffectExtras_:Lcom/google/protobuf/l$h;

    .line 55
    .line 56
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    check-cast v1, Lcom/google/protobuf/q;

    .line 61
    .line 62
    const/4 v2, 0x5

    .line 63
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 64
    .line 65
    .line 66
    add-int/lit8 v0, v0, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->effectExt_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getEffectExt()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->previewMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 86
    .line 87
    if-eqz v0, :cond_6

    .line 88
    .line 89
    const/4 v0, 0x7

    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getPreviewMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 95
    .line 96
    .line 97
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->senderShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 98
    .line 99
    if-eqz v0, :cond_7

    .line 100
    .line 101
    const/16 v0, 0x8

    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getSenderShowMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 108
    .line 109
    .line 110
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->receiverShowMask_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 111
    .line 112
    if-eqz v0, :cond_8

    .line 113
    .line 114
    const/16 v0, 0x9

    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getReceiverShowMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 121
    .line 122
    .line 123
    :cond_8
    return-void
.end method
