.class public final Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyleOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "BulletCommentStyle"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;",
        "Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyleOrBuilder;"
    }
.end annotation


# static fields
.field public static final BACKGROUNDCOLORS_FIELD_NUMBER:I = 0x1

.field public static final BACKGROUNDURL_FIELD_NUMBER:I = 0x4

.field public static final BORDERCOLORS_FIELD_NUMBER:I = 0x5

.field public static final BORDERCOLOR_FIELD_NUMBER:I = 0x3

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

.field public static final OPACITY_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Ll/ng60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private backgroundColors_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private backgroundUrl_:Ljava/lang/String;

.field private bitField0_:I

.field private borderColor_:Ljava/lang/String;

.field private borderColors_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private opacity_:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColor_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundUrl_:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 21
    .line 22
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->addAllBackgroundColors(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllBackgroundColors(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->ensureBackgroundColorsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addAllBorderColors(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->ensureBorderColorsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addBackgroundColors(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->ensureBackgroundColorsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private addBackgroundColorsBytes(Lcom/google/protobuf/ByteString;)V
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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->ensureBackgroundColorsIsMutable()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private addBorderColors(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->ensureBorderColorsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private addBorderColorsBytes(Lcom/google/protobuf/ByteString;)V
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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->ensureBorderColorsIsMutable()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->addAllBorderColors(Ljava/lang/Iterable;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->addBackgroundColors(Ljava/lang/String;)V

    return-void
.end method

.method private clearBackgroundColors()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearBackgroundUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->getBackgroundUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearBorderColor()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->getBorderColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColor_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearBorderColors()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearOpacity()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->opacity_:J

    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->addBackgroundColorsBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->addBorderColors(Ljava/lang/String;)V

    return-void
.end method

.method private ensureBackgroundColorsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private ensureBorderColorsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->addBorderColorsBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->clearBackgroundColors()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->clearBackgroundUrl()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->clearBorderColor()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->clearBorderColors()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->clearOpacity()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->setBackgroundColors(ILjava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->setBackgroundUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->setBackgroundUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->setBorderColor(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->setBorderColorBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->setBorderColors(ILjava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->setOpacity(J)V

    return-void
.end method

.method public static bridge synthetic s()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    return-object v0
.end method

.method private setBackgroundColors(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->ensureBackgroundColorsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private setBackgroundUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setBackgroundUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setBorderColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColor_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setBorderColorBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColor_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setBorderColors(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->ensureBorderColorsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private setOpacity(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->opacity_:J

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_b

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
    const/16 p3, 0xa

    .line 63
    .line 64
    if-eq p1, p3, :cond_9

    .line 65
    .line 66
    const/16 p3, 0x10

    .line 67
    .line 68
    if-eq p1, p3, :cond_8

    .line 69
    .line 70
    const/16 p3, 0x1a

    .line 71
    .line 72
    if-eq p1, p3, :cond_7

    .line 73
    .line 74
    const/16 p3, 0x22

    .line 75
    .line 76
    if-eq p1, p3, :cond_6

    .line 77
    .line 78
    const/16 p3, 0x2a

    .line 79
    .line 80
    if-eq p1, p3, :cond_4

    .line 81
    .line 82
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-nez p1, :cond_2

    .line 87
    .line 88
    :cond_3
    move v0, v2

    .line 89
    goto :goto_3

    .line 90
    :catch_0
    move-exception v0

    .line 91
    move-object p1, v0

    .line 92
    goto :goto_4

    .line 93
    :catch_1
    move-exception v0

    .line 94
    move-object p1, v0

    .line 95
    goto :goto_5

    .line 96
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 101
    .line 102
    invoke-interface {p3}, Lcom/google/protobuf/l$h;->q()Z

    .line 103
    .line 104
    .line 105
    move-result p3

    .line 106
    if-nez p3, :cond_5

    .line 107
    .line 108
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 109
    .line 110
    invoke-static {p3}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 111
    .line 112
    .line 113
    move-result-object p3

    .line 114
    iput-object p3, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 115
    .line 116
    :cond_5
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 117
    .line 118
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    goto :goto_3

    .line 122
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundUrl_:Ljava/lang/String;

    .line 127
    .line 128
    goto :goto_3

    .line 129
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColor_:Ljava/lang/String;

    .line 134
    .line 135
    goto :goto_3

    .line 136
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 137
    .line 138
    .line 139
    move-result-wide v3

    .line 140
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->opacity_:J

    .line 141
    .line 142
    goto :goto_3

    .line 143
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 148
    .line 149
    invoke-interface {p3}, Lcom/google/protobuf/l$h;->q()Z

    .line 150
    .line 151
    .line 152
    move-result p3

    .line 153
    if-nez p3, :cond_a

    .line 154
    .line 155
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 156
    .line 157
    invoke-static {p3}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 158
    .line 159
    .line 160
    move-result-object p3

    .line 161
    iput-object p3, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 162
    .line 163
    :cond_a
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 164
    .line 165
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 166
    .line 167
    .line 168
    goto :goto_3

    .line 169
    :catchall_1
    move-exception v0

    .line 170
    move-object p0, v0

    .line 171
    throw p0

    .line 172
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 173
    .line 174
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 186
    .line 187
    .line 188
    return-object v1

    .line 189
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 194
    .line 195
    .line 196
    return-object v1

    .line 197
    :cond_b
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 198
    .line 199
    return-object p0

    .line 200
    :pswitch_3
    move-object v3, p2

    .line 201
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 202
    .line 203
    check-cast p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 204
    .line 205
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 206
    .line 207
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 208
    .line 209
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 214
    .line 215
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->opacity_:J

    .line 216
    .line 217
    const-wide/16 p1, 0x0

    .line 218
    .line 219
    cmp-long v1, v5, p1

    .line 220
    .line 221
    if-eqz v1, :cond_c

    .line 222
    .line 223
    move v4, v2

    .line 224
    goto :goto_6

    .line 225
    :cond_c
    move v4, v0

    .line 226
    :goto_6
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->opacity_:J

    .line 227
    .line 228
    cmp-long p1, v8, p1

    .line 229
    .line 230
    if-eqz p1, :cond_d

    .line 231
    .line 232
    move v7, v2

    .line 233
    goto :goto_7

    .line 234
    :cond_d
    move v7, v0

    .line 235
    :goto_7
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 236
    .line 237
    .line 238
    move-result-wide p1

    .line 239
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->opacity_:J

    .line 240
    .line 241
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColor_:Ljava/lang/String;

    .line 242
    .line 243
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 244
    .line 245
    .line 246
    move-result p1

    .line 247
    xor-int/2addr p1, v2

    .line 248
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColor_:Ljava/lang/String;

    .line 249
    .line 250
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColor_:Ljava/lang/String;

    .line 251
    .line 252
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    xor-int/2addr v0, v2

    .line 257
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColor_:Ljava/lang/String;

    .line 258
    .line 259
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColor_:Ljava/lang/String;

    .line 264
    .line 265
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundUrl_:Ljava/lang/String;

    .line 266
    .line 267
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 268
    .line 269
    .line 270
    move-result p1

    .line 271
    xor-int/2addr p1, v2

    .line 272
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundUrl_:Ljava/lang/String;

    .line 273
    .line 274
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundUrl_:Ljava/lang/String;

    .line 275
    .line 276
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 277
    .line 278
    .line 279
    move-result v0

    .line 280
    xor-int/2addr v0, v2

    .line 281
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundUrl_:Ljava/lang/String;

    .line 282
    .line 283
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object p1

    .line 287
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundUrl_:Ljava/lang/String;

    .line 288
    .line 289
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 290
    .line 291
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 292
    .line 293
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 294
    .line 295
    .line 296
    move-result-object p1

    .line 297
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 298
    .line 299
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 300
    .line 301
    if-ne v3, p1, :cond_e

    .line 302
    .line 303
    iget p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->bitField0_:I

    .line 304
    .line 305
    iget p2, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->bitField0_:I

    .line 306
    .line 307
    or-int/2addr p1, p2

    .line 308
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->bitField0_:I

    .line 309
    .line 310
    :cond_e
    return-object p0

    .line 311
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;

    .line 312
    .line 313
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;-><init>(Ll/x2w;)V

    .line 314
    .line 315
    .line 316
    return-object p0

    .line 317
    :pswitch_5
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 318
    .line 319
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->n()V

    .line 320
    .line 321
    .line 322
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 323
    .line 324
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 325
    .line 326
    .line 327
    return-object v1

    .line 328
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 329
    .line 330
    return-object p0

    .line 331
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 332
    .line 333
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;-><init>()V

    .line 334
    .line 335
    .line 336
    return-object p0

    .line 337
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

.method public getBackgroundColors(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public getBackgroundColorsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getBackgroundColorsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

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

.method public getBackgroundColorsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBackgroundUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBackgroundUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundUrl_:Ljava/lang/String;

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

.method public getBorderColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColor_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBorderColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColor_:Ljava/lang/String;

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

.method public getBorderColors(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public getBorderColorsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getBorderColorsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

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

.method public getBorderColorsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOpacity()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->opacity_:J

    .line 2
    .line 3
    return-wide v0
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
    const/4 v0, 0x0

    .line 8
    move v1, v0

    .line 9
    move v2, v1

    .line 10
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 11
    .line 12
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-ge v1, v3, :cond_1

    .line 17
    .line 18
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 19
    .line 20
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast v3, Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v3}, Lcom/google/protobuf/CodedOutputStream;->L(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    add-int/2addr v2, v3

    .line 31
    add-int/lit8 v1, v1, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->getBackgroundColorsList()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    add-int/2addr v2, v1

    .line 43
    iget-wide v3, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->opacity_:J

    .line 44
    .line 45
    const-wide/16 v5, 0x0

    .line 46
    .line 47
    cmp-long v1, v3, v5

    .line 48
    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    const/4 v1, 0x2

    .line 52
    invoke-static {v1, v3, v4}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    add-int/2addr v2, v1

    .line 57
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColor_:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-nez v1, :cond_3

    .line 64
    .line 65
    const/4 v1, 0x3

    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->getBorderColor()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-static {v1, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    add-int/2addr v2, v1

    .line 75
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundUrl_:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-nez v1, :cond_4

    .line 82
    .line 83
    const/4 v1, 0x4

    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->getBackgroundUrl()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-static {v1, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    add-int/2addr v2, v1

    .line 93
    :cond_4
    move v1, v0

    .line 94
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 95
    .line 96
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    if-ge v0, v3, :cond_5

    .line 101
    .line 102
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 103
    .line 104
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    check-cast v3, Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {v3}, Lcom/google/protobuf/CodedOutputStream;->L(Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    add-int/2addr v1, v3

    .line 115
    add-int/lit8 v0, v0, 0x1

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_5
    add-int/2addr v2, v1

    .line 119
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->getBorderColorsList()Ljava/util/List;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    add-int/2addr v2, v0

    .line 128
    iput v2, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 129
    .line 130
    return v2
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 4
    .line 5
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundColors_:Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Ljava/lang/String;

    .line 18
    .line 19
    const/4 v3, 0x1

    .line 20
    invoke-virtual {p1, v3, v2}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->opacity_:J

    .line 27
    .line 28
    const-wide/16 v3, 0x0

    .line 29
    .line 30
    cmp-long v3, v1, v3

    .line 31
    .line 32
    if-eqz v3, :cond_1

    .line 33
    .line 34
    const/4 v3, 0x2

    .line 35
    invoke-virtual {p1, v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 36
    .line 37
    .line 38
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColor_:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-nez v1, :cond_2

    .line 45
    .line 46
    const/4 v1, 0x3

    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->getBorderColor()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {p1, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->backgroundUrl_:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-nez v1, :cond_3

    .line 61
    .line 62
    const/4 v1, 0x4

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->getBackgroundUrl()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {p1, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_3
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 71
    .line 72
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-ge v0, v1, :cond_4

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->borderColors_:Lcom/google/protobuf/l$h;

    .line 79
    .line 80
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    check-cast v1, Ljava/lang/String;

    .line 85
    .line 86
    const/4 v2, 0x5

    .line 87
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 88
    .line 89
    .line 90
    add-int/lit8 v0, v0, 0x1

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_4
    return-void
.end method
