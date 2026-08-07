.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButtonOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LiveBottomPopupButton"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$LiveBottomPopupButtonJumpType;,
        Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButtonOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

.field public static final ENDAFTERCOLOR_FIELD_NUMBER:I = 0x8

.field public static final ENDCOLOR_FIELD_NUMBER:I = 0x4

.field public static final JUMPSCHEMA_FIELD_NUMBER:I = 0x6

.field public static final JUMPTYPE_FIELD_NUMBER:I = 0x5

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;",
            ">;"
        }
    .end annotation
.end field

.field public static final RICHTEXT_FIELD_NUMBER:I = 0x9

.field public static final STARTAFTERCOLOR_FIELD_NUMBER:I = 0x7

.field public static final STARTCOLOR_FIELD_NUMBER:I = 0x3

.field public static final TEXTCOLOR_FIELD_NUMBER:I = 0x2

.field public static final TEXT_FIELD_NUMBER:I = 0x1


# instance fields
.field private bitField0_:I

.field private endAfterColor_:Ljava/lang/String;

.field private endColor_:Ljava/lang/String;

.field private jumpSchema_:Ljava/lang/String;

.field private jumpType_:I

.field private richText_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;",
            ">;"
        }
    .end annotation
.end field

.field private startAfterColor_:Ljava/lang/String;

.field private startColor_:Ljava/lang/String;

.field private textColor_:Ljava/lang/String;

.field private text_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->text_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->textColor_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startColor_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endColor_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpSchema_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startAfterColor_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endAfterColor_:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 25
    .line 26
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->setStartAfterColorBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->setStartColor(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->setStartColorBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->setText(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->setTextBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->setTextColor(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->setTextColorBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic H()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->addAllRichText(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllRichText(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->ensureRichTextIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addRichText(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->ensureRichTextIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addRichText(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->ensureRichTextIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addRichText(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->ensureRichTextIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addRichText(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->ensureRichTextIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->addRichText(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->addRichText(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)V

    return-void
.end method

.method private clearEndAfterColor()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getEndAfterColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endAfterColor_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearEndColor()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getEndColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endColor_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearJumpSchema()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getJumpSchema()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpSchema_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearJumpType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpType_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearRichText()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearStartAfterColor()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getStartAfterColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startAfterColor_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearStartColor()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getStartColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startColor_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearText()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getText()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->text_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTextColor()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getTextColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->textColor_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->addRichText(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->addRichText(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)V

    return-void
.end method

.method private ensureRichTextIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->clearEndAfterColor()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->clearEndColor()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->clearJumpSchema()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->clearJumpType()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->clearRichText()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->clearStartAfterColor()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->clearStartColor()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->clearText()V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->clearTextColor()V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->removeRichText(I)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->setEndAfterColor(Ljava/lang/String;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->setEndAfterColorBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->setEndColor(Ljava/lang/String;)V

    return-void
.end method

.method private removeRichText(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->ensureRichTextIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->setEndColorBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private setEndAfterColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endAfterColor_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setEndAfterColorBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endAfterColor_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setEndColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endColor_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endColor_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setJumpSchema(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpSchema_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setJumpSchemaBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpSchema_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setJumpType(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$LiveBottomPopupButtonJumpType;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$LiveBottomPopupButtonJumpType;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpType_:I

    .line 9
    .line 10
    return-void
.end method

.method private setJumpTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpType_:I

    .line 2
    .line 3
    return-void
.end method

.method private setRichText(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->ensureRichTextIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setRichText(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->ensureRichTextIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setStartAfterColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startAfterColor_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setStartAfterColorBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startAfterColor_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startColor_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startColor_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setText(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->text_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setTextBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->text_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTextColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->textColor_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setTextColorBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->textColor_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->setJumpSchema(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->setJumpSchemaBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$LiveBottomPopupButtonJumpType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->setJumpType(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$LiveBottomPopupButtonJumpType;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->setJumpTypeValue(I)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->setRichText(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent$Builder;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->setRichText(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->setStartAfterColor(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->PARSER:Ll/ng60;

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
    if-nez v1, :cond_e

    .line 54
    .line 55
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_3

    .line 60
    .line 61
    const/16 v3, 0xa

    .line 62
    .line 63
    if-eq p1, v3, :cond_d

    .line 64
    .line 65
    const/16 v3, 0x12

    .line 66
    .line 67
    if-eq p1, v3, :cond_c

    .line 68
    .line 69
    const/16 v3, 0x1a

    .line 70
    .line 71
    if-eq p1, v3, :cond_b

    .line 72
    .line 73
    const/16 v3, 0x22

    .line 74
    .line 75
    if-eq p1, v3, :cond_a

    .line 76
    .line 77
    const/16 v3, 0x28

    .line 78
    .line 79
    if-eq p1, v3, :cond_9

    .line 80
    .line 81
    const/16 v3, 0x32

    .line 82
    .line 83
    if-eq p1, v3, :cond_8

    .line 84
    .line 85
    const/16 v3, 0x3a

    .line 86
    .line 87
    if-eq p1, v3, :cond_7

    .line 88
    .line 89
    const/16 v3, 0x42

    .line 90
    .line 91
    if-eq p1, v3, :cond_6

    .line 92
    .line 93
    const/16 v3, 0x4a

    .line 94
    .line 95
    if-eq p1, v3, :cond_4

    .line 96
    .line 97
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-nez p1, :cond_2

    .line 102
    .line 103
    :cond_3
    move v1, v2

    .line 104
    goto :goto_3

    .line 105
    :catch_0
    move-exception p1

    .line 106
    goto :goto_4

    .line 107
    :catch_1
    move-exception p1

    .line 108
    goto/16 :goto_5

    .line 109
    .line 110
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

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
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 119
    .line 120
    invoke-static {p1}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 125
    .line 126
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 127
    .line 128
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;->parser()Ll/ng60;

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
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endAfterColor_:Ljava/lang/String;

    .line 147
    .line 148
    goto :goto_3

    .line 149
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startAfterColor_:Ljava/lang/String;

    .line 154
    .line 155
    goto :goto_3

    .line 156
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpSchema_:Ljava/lang/String;

    .line 161
    .line 162
    goto :goto_3

    .line 163
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpType_:I

    .line 168
    .line 169
    goto :goto_3

    .line 170
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endColor_:Ljava/lang/String;

    .line 175
    .line 176
    goto :goto_3

    .line 177
    :cond_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startColor_:Ljava/lang/String;

    .line 182
    .line 183
    goto/16 :goto_3

    .line 184
    .line 185
    :cond_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->textColor_:Ljava/lang/String;

    .line 190
    .line 191
    goto/16 :goto_3

    .line 192
    .line 193
    :cond_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->text_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 198
    .line 199
    goto/16 :goto_3

    .line 200
    .line 201
    :catchall_1
    move-exception p0

    .line 202
    throw p0

    .line 203
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 204
    .line 205
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 217
    .line 218
    .line 219
    return-object v0

    .line 220
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 225
    .line 226
    .line 227
    return-object v0

    .line 228
    :cond_e
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 229
    .line 230
    return-object p0

    .line 231
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 232
    .line 233
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 234
    .line 235
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->text_:Ljava/lang/String;

    .line 236
    .line 237
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 238
    .line 239
    .line 240
    move-result p1

    .line 241
    xor-int/2addr p1, v2

    .line 242
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->text_:Ljava/lang/String;

    .line 243
    .line 244
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->text_:Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 247
    .line 248
    .line 249
    move-result v3

    .line 250
    xor-int/2addr v3, v2

    .line 251
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->text_:Ljava/lang/String;

    .line 252
    .line 253
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->text_:Ljava/lang/String;

    .line 258
    .line 259
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->textColor_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->textColor_:Ljava/lang/String;

    .line 267
    .line 268
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->textColor_:Ljava/lang/String;

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
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->textColor_:Ljava/lang/String;

    .line 276
    .line 277
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object p1

    .line 281
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->textColor_:Ljava/lang/String;

    .line 282
    .line 283
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startColor_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startColor_:Ljava/lang/String;

    .line 291
    .line 292
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startColor_:Ljava/lang/String;

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
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startColor_:Ljava/lang/String;

    .line 300
    .line 301
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startColor_:Ljava/lang/String;

    .line 306
    .line 307
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endColor_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endColor_:Ljava/lang/String;

    .line 315
    .line 316
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endColor_:Ljava/lang/String;

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
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endColor_:Ljava/lang/String;

    .line 324
    .line 325
    invoke-interface {p2, p1, v0, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object p1

    .line 329
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endColor_:Ljava/lang/String;

    .line 330
    .line 331
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpType_:I

    .line 332
    .line 333
    if-eqz p1, :cond_f

    .line 334
    .line 335
    move v0, v2

    .line 336
    goto :goto_6

    .line 337
    :cond_f
    move v0, v1

    .line 338
    :goto_6
    iget v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpType_:I

    .line 339
    .line 340
    if-eqz v3, :cond_10

    .line 341
    .line 342
    move v1, v2

    .line 343
    :cond_10
    invoke-interface {p2, v0, p1, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 344
    .line 345
    .line 346
    move-result p1

    .line 347
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpType_:I

    .line 348
    .line 349
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpSchema_:Ljava/lang/String;

    .line 350
    .line 351
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 352
    .line 353
    .line 354
    move-result p1

    .line 355
    xor-int/2addr p1, v2

    .line 356
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpSchema_:Ljava/lang/String;

    .line 357
    .line 358
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpSchema_:Ljava/lang/String;

    .line 359
    .line 360
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 361
    .line 362
    .line 363
    move-result v1

    .line 364
    xor-int/2addr v1, v2

    .line 365
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpSchema_:Ljava/lang/String;

    .line 366
    .line 367
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object p1

    .line 371
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpSchema_:Ljava/lang/String;

    .line 372
    .line 373
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startAfterColor_:Ljava/lang/String;

    .line 374
    .line 375
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 376
    .line 377
    .line 378
    move-result p1

    .line 379
    xor-int/2addr p1, v2

    .line 380
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startAfterColor_:Ljava/lang/String;

    .line 381
    .line 382
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startAfterColor_:Ljava/lang/String;

    .line 383
    .line 384
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 385
    .line 386
    .line 387
    move-result v1

    .line 388
    xor-int/2addr v1, v2

    .line 389
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startAfterColor_:Ljava/lang/String;

    .line 390
    .line 391
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object p1

    .line 395
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startAfterColor_:Ljava/lang/String;

    .line 396
    .line 397
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endAfterColor_:Ljava/lang/String;

    .line 398
    .line 399
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 400
    .line 401
    .line 402
    move-result p1

    .line 403
    xor-int/2addr p1, v2

    .line 404
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endAfterColor_:Ljava/lang/String;

    .line 405
    .line 406
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endAfterColor_:Ljava/lang/String;

    .line 407
    .line 408
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 409
    .line 410
    .line 411
    move-result v1

    .line 412
    xor-int/2addr v1, v2

    .line 413
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endAfterColor_:Ljava/lang/String;

    .line 414
    .line 415
    invoke-interface {p2, p1, v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 416
    .line 417
    .line 418
    move-result-object p1

    .line 419
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endAfterColor_:Ljava/lang/String;

    .line 420
    .line 421
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 422
    .line 423
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 424
    .line 425
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 426
    .line 427
    .line 428
    move-result-object p1

    .line 429
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 430
    .line 431
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 432
    .line 433
    if-ne p2, p1, :cond_11

    .line 434
    .line 435
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->bitField0_:I

    .line 436
    .line 437
    iget p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->bitField0_:I

    .line 438
    .line 439
    or-int/2addr p1, p2

    .line 440
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->bitField0_:I

    .line 441
    .line 442
    :cond_11
    return-object p0

    .line 443
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;

    .line 444
    .line 445
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$Builder;-><init>(Ll/u2w;)V

    .line 446
    .line 447
    .line 448
    return-object p0

    .line 449
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 450
    .line 451
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 452
    .line 453
    .line 454
    return-object v0

    .line 455
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 456
    .line 457
    return-object p0

    .line 458
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;

    .line 459
    .line 460
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;-><init>()V

    .line 461
    .line 462
    .line 463
    return-object p0

    .line 464
    nop

    .line 465
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

.method public getEndAfterColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endAfterColor_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEndAfterColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endAfterColor_:Ljava/lang/String;

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

.method public getEndColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endColor_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEndColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endColor_:Ljava/lang/String;

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

.method public getJumpSchema()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpSchema_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getJumpSchemaBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpSchema_:Ljava/lang/String;

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

.method public getJumpType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$LiveBottomPopupButtonJumpType;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpType_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$LiveBottomPopupButtonJumpType;->forNumber(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$LiveBottomPopupButtonJumpType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$LiveBottomPopupButtonJumpType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$LiveBottomPopupButtonJumpType;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getJumpTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpType_:I

    .line 2
    .line 3
    return p0
.end method

.method public getRichText(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;

    .line 8
    .line 9
    return-object p0
.end method

.method public getRichTextCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

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

.method public getRichTextList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContent;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRichTextOrBuilder(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContentOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContentOrBuilder;

    .line 8
    .line 9
    return-object p0
.end method

.method public getRichTextOrBuilderList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomContentOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->text_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getText()Ljava/lang/String;

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
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->textColor_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getTextColor()Ljava/lang/String;

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
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startColor_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getStartColor()Ljava/lang/String;

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
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endColor_:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-nez v2, :cond_4

    .line 70
    .line 71
    const/4 v2, 0x4

    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getEndColor()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    add-int/2addr v0, v2

    .line 81
    :cond_4
    iget v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpType_:I

    .line 82
    .line 83
    sget-object v3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$LiveBottomPopupButtonJumpType;->url:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$LiveBottomPopupButtonJumpType;

    .line 84
    .line 85
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$LiveBottomPopupButtonJumpType;->getNumber()I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    if-eq v2, v3, :cond_5

    .line 90
    .line 91
    const/4 v2, 0x5

    .line 92
    iget v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpType_:I

    .line 93
    .line 94
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    add-int/2addr v0, v2

    .line 99
    :cond_5
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpSchema_:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    if-nez v2, :cond_6

    .line 106
    .line 107
    const/4 v2, 0x6

    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getJumpSchema()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    add-int/2addr v0, v2

    .line 117
    :cond_6
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startAfterColor_:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-nez v2, :cond_7

    .line 124
    .line 125
    const/4 v2, 0x7

    .line 126
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getStartAfterColor()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    add-int/2addr v0, v2

    .line 135
    :cond_7
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endAfterColor_:Ljava/lang/String;

    .line 136
    .line 137
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    if-nez v2, :cond_8

    .line 142
    .line 143
    const/16 v2, 0x8

    .line 144
    .line 145
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getEndAfterColor()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    add-int/2addr v0, v2

    .line 154
    :cond_8
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 155
    .line 156
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    if-ge v1, v2, :cond_9

    .line 161
    .line 162
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 163
    .line 164
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    check-cast v2, Lcom/google/protobuf/q;

    .line 169
    .line 170
    const/16 v3, 0x9

    .line 171
    .line 172
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    add-int/2addr v0, v2

    .line 177
    add-int/lit8 v1, v1, 0x1

    .line 178
    .line 179
    goto :goto_1

    .line 180
    :cond_9
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 181
    .line 182
    return v0
.end method

.method public getStartAfterColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startAfterColor_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStartAfterColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startAfterColor_:Ljava/lang/String;

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

.method public getStartColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startColor_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStartColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startColor_:Ljava/lang/String;

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

.method public getText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->text_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->text_:Ljava/lang/String;

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

.method public getTextColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->textColor_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->textColor_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->text_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getText()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->textColor_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getTextColor()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startColor_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getStartColor()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endColor_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getEndColor()Ljava/lang/String;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpType_:I

    .line 66
    .line 67
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$LiveBottomPopupButtonJumpType;->url:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$LiveBottomPopupButtonJumpType;

    .line 68
    .line 69
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton$LiveBottomPopupButtonJumpType;->getNumber()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eq v0, v1, :cond_4

    .line 74
    .line 75
    const/4 v0, 0x5

    .line 76
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpType_:I

    .line 77
    .line 78
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 79
    .line 80
    .line 81
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->jumpSchema_:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_5

    .line 88
    .line 89
    const/4 v0, 0x6

    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getJumpSchema()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->startAfterColor_:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_6

    .line 104
    .line 105
    const/4 v0, 0x7

    .line 106
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getStartAfterColor()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 111
    .line 112
    .line 113
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->endAfterColor_:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_7

    .line 120
    .line 121
    const/16 v0, 0x8

    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->getEndAfterColor()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :cond_7
    const/4 v0, 0x0

    .line 131
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 132
    .line 133
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-ge v0, v1, :cond_8

    .line 138
    .line 139
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveBottomPopup$LiveBottomPopupButton;->richText_:Lcom/google/protobuf/l$h;

    .line 140
    .line 141
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    check-cast v1, Lcom/google/protobuf/q;

    .line 146
    .line 147
    const/16 v2, 0x9

    .line 148
    .line 149
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 150
    .line 151
    .line 152
    add-int/lit8 v0, v0, 0x1

    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_8
    return-void
.end method
