.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtraOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VoiceLiveSGVAAnimationExtra"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtraOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

.field public static final KEY_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;",
            ">;"
        }
    .end annotation
.end field

.field public static final TEXTCOLOR_FIELD_NUMBER:I = 0x4

.field public static final TEXTFONT_FIELD_NUMBER:I = 0x6

.field public static final TEXTSIZE_FIELD_NUMBER:I = 0x5

.field public static final TYPE_FIELD_NUMBER:I = 0x2

.field public static final VALUE_FIELD_NUMBER:I = 0x3


# instance fields
.field private key_:Ljava/lang/String;

.field private textColor_:Ljava/lang/String;

.field private textFont_:J

.field private textSize_:J

.field private type_:J

.field private value_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->key_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->value_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textColor_:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->clearKey()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->clearTextColor()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->clearTextFont()V

    return-void
.end method

.method private clearKey()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->getKey()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->key_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTextColor()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->getTextColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textColor_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTextFont()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textFont_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearTextSize()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textSize_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearType()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->type_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearValue()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->getValue()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->value_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->clearTextSize()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->clearType()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->clearValue()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->setKey(Ljava/lang/String;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->setKeyBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->setTextColor(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->setTextColorBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->setTextFont(J)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->setTextSize(J)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->setType(J)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->setValue(Ljava/lang/String;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->setValueBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic p()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

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

.method private setKey(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->key_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setKeyBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->key_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textColor_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textColor_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTextFont(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textFont_:J

    .line 2
    .line 3
    return-void
.end method

.method private setTextSize(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textSize_:J

    .line 2
    .line 3
    return-void
.end method

.method private setType(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->type_:J

    .line 2
    .line 3
    return-void
.end method

.method private setValue(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->value_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setValueBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->value_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_a

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
    const/16 p3, 0x28

    .line 79
    .line 80
    if-eq p1, p3, :cond_5

    .line 81
    .line 82
    const/16 p3, 0x30

    .line 83
    .line 84
    if-eq p1, p3, :cond_4

    .line 85
    .line 86
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-nez p1, :cond_2

    .line 91
    .line 92
    :cond_3
    move v0, v2

    .line 93
    goto :goto_3

    .line 94
    :catch_0
    move-exception v0

    .line 95
    move-object p1, v0

    .line 96
    goto :goto_4

    .line 97
    :catch_1
    move-exception v0

    .line 98
    move-object p1, v0

    .line 99
    goto :goto_5

    .line 100
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 101
    .line 102
    .line 103
    move-result-wide v3

    .line 104
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textFont_:J

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 108
    .line 109
    .line 110
    move-result-wide v3

    .line 111
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textSize_:J

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textColor_:Ljava/lang/String;

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->value_:Ljava/lang/String;

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 129
    .line 130
    .line 131
    move-result-wide v3

    .line 132
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->type_:J

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->key_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 140
    .line 141
    goto :goto_3

    .line 142
    :catchall_1
    move-exception v0

    .line 143
    move-object p0, v0

    .line 144
    throw p0

    .line 145
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 146
    .line 147
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 159
    .line 160
    .line 161
    return-object v1

    .line 162
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 167
    .line 168
    .line 169
    return-object v1

    .line 170
    :cond_a
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    .line 171
    .line 172
    return-object p0

    .line 173
    :pswitch_3
    move-object v3, p2

    .line 174
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 175
    .line 176
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    .line 177
    .line 178
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->key_:Ljava/lang/String;

    .line 179
    .line 180
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    xor-int/2addr p1, v2

    .line 185
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->key_:Ljava/lang/String;

    .line 186
    .line 187
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->key_:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    xor-int/2addr v1, v2

    .line 194
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->key_:Ljava/lang/String;

    .line 195
    .line 196
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->key_:Ljava/lang/String;

    .line 201
    .line 202
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->type_:J

    .line 203
    .line 204
    const-wide/16 p1, 0x0

    .line 205
    .line 206
    cmp-long v1, v5, p1

    .line 207
    .line 208
    if-eqz v1, :cond_b

    .line 209
    .line 210
    move v4, v2

    .line 211
    goto :goto_6

    .line 212
    :cond_b
    move v4, v0

    .line 213
    :goto_6
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->type_:J

    .line 214
    .line 215
    cmp-long v1, v8, p1

    .line 216
    .line 217
    if-eqz v1, :cond_c

    .line 218
    .line 219
    move v7, v2

    .line 220
    goto :goto_7

    .line 221
    :cond_c
    move v7, v0

    .line 222
    :goto_7
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 223
    .line 224
    .line 225
    move-result-wide v4

    .line 226
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->type_:J

    .line 227
    .line 228
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->value_:Ljava/lang/String;

    .line 229
    .line 230
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    xor-int/2addr v1, v2

    .line 235
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->value_:Ljava/lang/String;

    .line 236
    .line 237
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->value_:Ljava/lang/String;

    .line 238
    .line 239
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 240
    .line 241
    .line 242
    move-result v5

    .line 243
    xor-int/2addr v5, v2

    .line 244
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->value_:Ljava/lang/String;

    .line 245
    .line 246
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->value_:Ljava/lang/String;

    .line 251
    .line 252
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textColor_:Ljava/lang/String;

    .line 253
    .line 254
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 255
    .line 256
    .line 257
    move-result v1

    .line 258
    xor-int/2addr v1, v2

    .line 259
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textColor_:Ljava/lang/String;

    .line 260
    .line 261
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textColor_:Ljava/lang/String;

    .line 262
    .line 263
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 264
    .line 265
    .line 266
    move-result v5

    .line 267
    xor-int/2addr v5, v2

    .line 268
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textColor_:Ljava/lang/String;

    .line 269
    .line 270
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v1

    .line 274
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textColor_:Ljava/lang/String;

    .line 275
    .line 276
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textSize_:J

    .line 277
    .line 278
    cmp-long v1, v5, p1

    .line 279
    .line 280
    if-eqz v1, :cond_d

    .line 281
    .line 282
    move v4, v2

    .line 283
    goto :goto_8

    .line 284
    :cond_d
    move v4, v0

    .line 285
    :goto_8
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textSize_:J

    .line 286
    .line 287
    cmp-long v1, v8, p1

    .line 288
    .line 289
    if-eqz v1, :cond_e

    .line 290
    .line 291
    move v7, v2

    .line 292
    goto :goto_9

    .line 293
    :cond_e
    move v7, v0

    .line 294
    :goto_9
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 295
    .line 296
    .line 297
    move-result-wide v4

    .line 298
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textSize_:J

    .line 299
    .line 300
    move v1, v0

    .line 301
    move v4, v2

    .line 302
    move-object v0, v3

    .line 303
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textFont_:J

    .line 304
    .line 305
    cmp-long v5, v2, p1

    .line 306
    .line 307
    if-eqz v5, :cond_f

    .line 308
    .line 309
    move v5, v1

    .line 310
    move v1, v4

    .line 311
    goto :goto_a

    .line 312
    :cond_f
    move v5, v1

    .line 313
    :goto_a
    iget-wide v6, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textFont_:J

    .line 314
    .line 315
    cmp-long p1, v6, p1

    .line 316
    .line 317
    if-eqz p1, :cond_10

    .line 318
    .line 319
    :goto_b
    move-wide v5, v6

    .line 320
    goto :goto_c

    .line 321
    :cond_10
    move v4, v5

    .line 322
    goto :goto_b

    .line 323
    :goto_c
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 324
    .line 325
    .line 326
    move-result-wide p1

    .line 327
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textFont_:J

    .line 328
    .line 329
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 330
    .line 331
    return-object p0

    .line 332
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra$Builder;

    .line 333
    .line 334
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra$Builder;-><init>(Ll/b4w;)V

    .line 335
    .line 336
    .line 337
    return-object p0

    .line 338
    :pswitch_5
    return-object v1

    .line 339
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    .line 340
    .line 341
    return-object p0

    .line 342
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;

    .line 343
    .line 344
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;-><init>()V

    .line 345
    .line 346
    .line 347
    return-object p0

    .line 348
    nop

    .line 349
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

.method public getKey()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->key_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getKeyBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->key_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->key_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->getKey()Ljava/lang/String;

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
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->type_:J

    .line 27
    .line 28
    const-wide/16 v3, 0x0

    .line 29
    .line 30
    cmp-long v5, v1, v3

    .line 31
    .line 32
    if-eqz v5, :cond_2

    .line 33
    .line 34
    const/4 v5, 0x2

    .line 35
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    add-int/2addr v0, v1

    .line 40
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->value_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->getValue()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textColor_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->getTextColor()Ljava/lang/String;

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
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textSize_:J

    .line 77
    .line 78
    cmp-long v5, v1, v3

    .line 79
    .line 80
    if-eqz v5, :cond_5

    .line 81
    .line 82
    const/4 v5, 0x5

    .line 83
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    add-int/2addr v0, v1

    .line 88
    :cond_5
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textFont_:J

    .line 89
    .line 90
    cmp-long v3, v1, v3

    .line 91
    .line 92
    if-eqz v3, :cond_6

    .line 93
    .line 94
    const/4 v3, 0x6

    .line 95
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    add-int/2addr v0, v1

    .line 100
    :cond_6
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 101
    .line 102
    return v0
.end method

.method public getTextColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textColor_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textColor_:Ljava/lang/String;

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

.method public getTextFont()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textFont_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getTextSize()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textSize_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getType()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->type_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->value_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getValueBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->value_:Ljava/lang/String;

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
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->key_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->getKey()Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->type_:J

    .line 18
    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    cmp-long v4, v0, v2

    .line 22
    .line 23
    if-eqz v4, :cond_1

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->value_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->getValue()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textColor_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->getTextColor()Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textSize_:J

    .line 62
    .line 63
    cmp-long v4, v0, v2

    .line 64
    .line 65
    if-eqz v4, :cond_4

    .line 66
    .line 67
    const/4 v4, 0x5

    .line 68
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 69
    .line 70
    .line 71
    :cond_4
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveSGVAAnimationExtra;->textFont_:J

    .line 72
    .line 73
    cmp-long p0, v0, v2

    .line 74
    .line 75
    if-eqz p0, :cond_5

    .line 76
    .line 77
    const/4 p0, 0x6

    .line 78
    invoke-virtual {p1, p0, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 79
    .line 80
    .line 81
    :cond_5
    return-void
.end method
