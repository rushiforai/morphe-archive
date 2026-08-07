.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VoiceAnchorGrowthMessage"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessageOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

.field public static final GIFTS_FIELD_NUMBER:I = 0x4

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;",
            ">;"
        }
    .end annotation
.end field

.field public static final SCHEME_FIELD_NUMBER:I = 0x3

.field public static final SUBTITLE_FIELD_NUMBER:I = 0x2

.field public static final TITLE_FIELD_NUMBER:I = 0x1


# instance fields
.field private bitField0_:I

.field private gifts_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;",
            ">;"
        }
    .end annotation
.end field

.field private scheme_:Ljava/lang/String;

.field private subTitle_:Ljava/lang/String;

.field private title_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->title_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->subTitle_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->scheme_:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 17
    .line 18
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->addAllGifts(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllGifts(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->ensureGiftsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addGifts(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->ensureGiftsIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addGifts(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->ensureGiftsIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addGifts(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->ensureGiftsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addGifts(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->ensureGiftsIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->addGifts(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift$Builder;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->addGifts(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;)V

    return-void
.end method

.method private clearGifts()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearScheme()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getScheme()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->scheme_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearSubTitle()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getSubTitle()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->subTitle_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTitle()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getTitle()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->title_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->addGifts(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift$Builder;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->addGifts(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;)V

    return-void
.end method

.method private ensureGiftsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->clearGifts()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->clearScheme()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->clearSubTitle()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->clearTitle()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->removeGifts(I)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->setGifts(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift$Builder;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->setGifts(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->setScheme(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->setSchemeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->setSubTitle(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->setSubTitleBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->setTitle(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->setTitleBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private removeGifts(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->ensureGiftsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic s()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    return-object v0
.end method

.method private setGifts(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->ensureGiftsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setGifts(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->ensureGiftsIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setScheme(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->scheme_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setSchemeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->scheme_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setSubTitle(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->subTitle_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setSubTitleBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->subTitle_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->title_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->title_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->PARSER:Ll/ng60;

    .line 19
    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 23
    .line 24
    monitor-enter p0

    .line 25
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->PARSER:Ll/ng60;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 30
    .line 31
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 32
    .line 33
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 34
    .line 35
    .line 36
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->PARSER:Ll/ng60;

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
    if-nez p1, :cond_9

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
    if-eq v2, v3, :cond_8

    .line 64
    .line 65
    const/16 v3, 0x12

    .line 66
    .line 67
    if-eq v2, v3, :cond_7

    .line 68
    .line 69
    const/16 v3, 0x1a

    .line 70
    .line 71
    if-eq v2, v3, :cond_6

    .line 72
    .line 73
    const/16 v3, 0x22

    .line 74
    .line 75
    if-eq v2, v3, :cond_4

    .line 76
    .line 77
    invoke-virtual {p2, v2}, Lcom/google/protobuf/e;->R(I)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-nez v2, :cond_2

    .line 82
    .line 83
    :cond_3
    move p1, v1

    .line 84
    goto :goto_3

    .line 85
    :catch_0
    move-exception p1

    .line 86
    goto :goto_4

    .line 87
    :catch_1
    move-exception p1

    .line 88
    goto :goto_5

    .line 89
    :cond_4
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 90
    .line 91
    invoke-interface {v2}, Lcom/google/protobuf/l$h;->q()Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-nez v2, :cond_5

    .line 96
    .line 97
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 98
    .line 99
    invoke-static {v2}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 104
    .line 105
    :cond_5
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 106
    .line 107
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;->parser()Ll/ng60;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;

    .line 116
    .line 117
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->scheme_:Ljava/lang/String;

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->subTitle_:Ljava/lang/String;

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->title_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 140
    .line 141
    goto :goto_3

    .line 142
    :catchall_1
    move-exception p0

    .line 143
    throw p0

    .line 144
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 145
    .line 146
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 158
    .line 159
    .line 160
    return-object v0

    .line 161
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 166
    .line 167
    .line 168
    return-object v0

    .line 169
    :cond_9
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 170
    .line 171
    return-object p0

    .line 172
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 173
    .line 174
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 175
    .line 176
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->title_:Ljava/lang/String;

    .line 177
    .line 178
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    xor-int/2addr p1, v1

    .line 183
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->title_:Ljava/lang/String;

    .line 184
    .line 185
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->title_:Ljava/lang/String;

    .line 186
    .line 187
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 188
    .line 189
    .line 190
    move-result v2

    .line 191
    xor-int/2addr v2, v1

    .line 192
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->title_:Ljava/lang/String;

    .line 193
    .line 194
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->title_:Ljava/lang/String;

    .line 199
    .line 200
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->subTitle_:Ljava/lang/String;

    .line 201
    .line 202
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 203
    .line 204
    .line 205
    move-result p1

    .line 206
    xor-int/2addr p1, v1

    .line 207
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->subTitle_:Ljava/lang/String;

    .line 208
    .line 209
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->subTitle_:Ljava/lang/String;

    .line 210
    .line 211
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 212
    .line 213
    .line 214
    move-result v2

    .line 215
    xor-int/2addr v2, v1

    .line 216
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->subTitle_:Ljava/lang/String;

    .line 217
    .line 218
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->subTitle_:Ljava/lang/String;

    .line 223
    .line 224
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->scheme_:Ljava/lang/String;

    .line 225
    .line 226
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 227
    .line 228
    .line 229
    move-result p1

    .line 230
    xor-int/2addr p1, v1

    .line 231
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->scheme_:Ljava/lang/String;

    .line 232
    .line 233
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->scheme_:Ljava/lang/String;

    .line 234
    .line 235
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 236
    .line 237
    .line 238
    move-result v2

    .line 239
    xor-int/2addr v1, v2

    .line 240
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->scheme_:Ljava/lang/String;

    .line 241
    .line 242
    invoke-interface {p2, p1, v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object p1

    .line 246
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->scheme_:Ljava/lang/String;

    .line 247
    .line 248
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 249
    .line 250
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 251
    .line 252
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 257
    .line 258
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 259
    .line 260
    if-ne p2, p1, :cond_a

    .line 261
    .line 262
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->bitField0_:I

    .line 263
    .line 264
    iget p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->bitField0_:I

    .line 265
    .line 266
    or-int/2addr p1, p2

    .line 267
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->bitField0_:I

    .line 268
    .line 269
    :cond_a
    return-object p0

    .line 270
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;

    .line 271
    .line 272
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage$Builder;-><init>(Ll/s1w;)V

    .line 273
    .line 274
    .line 275
    return-object p0

    .line 276
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 277
    .line 278
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 279
    .line 280
    .line 281
    return-object v0

    .line 282
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 283
    .line 284
    return-object p0

    .line 285
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 286
    .line 287
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;-><init>()V

    .line 288
    .line 289
    .line 290
    return-object p0

    .line 291
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

.method public getGifts(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;

    .line 8
    .line 9
    return-object p0
.end method

.method public getGiftsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

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

.method public getGiftsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGiftsOrBuilder(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGiftOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGiftOrBuilder;

    .line 8
    .line 9
    return-object p0
.end method

.method public getGiftsOrBuilderList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGiftOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScheme()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->scheme_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSchemeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->scheme_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->title_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getTitle()Ljava/lang/String;

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
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->subTitle_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getSubTitle()Ljava/lang/String;

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
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->scheme_:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-nez v2, :cond_3

    .line 52
    .line 53
    const/4 v2, 0x3

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getScheme()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    add-int/2addr v0, v2

    .line 63
    :cond_3
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 64
    .line 65
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-ge v1, v2, :cond_4

    .line 70
    .line 71
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 72
    .line 73
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    check-cast v2, Lcom/google/protobuf/q;

    .line 78
    .line 79
    const/4 v3, 0x4

    .line 80
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    add-int/2addr v0, v2

    .line 85
    add-int/lit8 v1, v1, 0x1

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_4
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 89
    .line 90
    return v0
.end method

.method public getSubTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->subTitle_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSubTitleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->subTitle_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->title_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTitleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->title_:Ljava/lang/String;

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

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->title_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getTitle()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->subTitle_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getSubTitle()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->scheme_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getScheme()Ljava/lang/String;

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
    const/4 v0, 0x0

    .line 50
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 51
    .line 52
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-ge v0, v1, :cond_3

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->gifts_:Lcom/google/protobuf/l$h;

    .line 59
    .line 60
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    check-cast v1, Lcom/google/protobuf/q;

    .line 65
    .line 66
    const/4 v2, 0x4

    .line 67
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 68
    .line 69
    .line 70
    add-int/lit8 v0, v0, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    return-void
.end method
