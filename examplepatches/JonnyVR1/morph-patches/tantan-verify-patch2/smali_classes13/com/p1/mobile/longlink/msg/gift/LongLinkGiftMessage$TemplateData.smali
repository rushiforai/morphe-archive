.class public final Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateDataOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "TemplateData"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateDataOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

.field public static final FIELDS_FIELD_NUMBER:I = 0x2

.field public static final ID_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Ll/ng60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private bitField0_:I

.field private fields_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private id_:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->addAllFields(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllFields(Ljava/lang/Iterable;)V
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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->ensureFieldsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addFields(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->ensureFieldsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private addFieldsBytes(Lcom/google/protobuf/ByteString;)V
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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->ensureFieldsIsMutable()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

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

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->addFields(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->addFieldsBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private clearFields()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->id_:I

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->clearFields()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->clearId()V

    return-void
.end method

.method private ensureFieldsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->setFields(ILjava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->setId(I)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    return-object v0
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

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

.method private setFields(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->ensureFieldsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private setId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->id_:I

    .line 2
    .line 3
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
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->PARSER:Ll/ng60;

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
    if-nez v1, :cond_7

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
    const/16 p3, 0x8

    .line 62
    .line 63
    if-eq p1, p3, :cond_6

    .line 64
    .line 65
    const/16 p3, 0x12

    .line 66
    .line 67
    if-eq p1, p3, :cond_4

    .line 68
    .line 69
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-nez p1, :cond_2

    .line 74
    .line 75
    :cond_3
    move v1, v2

    .line 76
    goto :goto_3

    .line 77
    :catch_0
    move-exception p1

    .line 78
    goto :goto_4

    .line 79
    :catch_1
    move-exception p1

    .line 80
    goto :goto_5

    .line 81
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

    .line 86
    .line 87
    invoke-interface {p3}, Lcom/google/protobuf/l$h;->q()Z

    .line 88
    .line 89
    .line 90
    move-result p3

    .line 91
    if-nez p3, :cond_5

    .line 92
    .line 93
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

    .line 94
    .line 95
    invoke-static {p3}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 96
    .line 97
    .line 98
    move-result-object p3

    .line 99
    iput-object p3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

    .line 100
    .line 101
    :cond_5
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

    .line 102
    .line 103
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->N()I

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    iput p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->id_:I
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :catchall_1
    move-exception p0

    .line 115
    throw p0

    .line 116
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 117
    .line 118
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 130
    .line 131
    .line 132
    return-object v0

    .line 133
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 138
    .line 139
    .line 140
    return-object v0

    .line 141
    :cond_7
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 142
    .line 143
    return-object p0

    .line 144
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 145
    .line 146
    check-cast p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 147
    .line 148
    iget p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->id_:I

    .line 149
    .line 150
    if-eqz p1, :cond_8

    .line 151
    .line 152
    move v0, v2

    .line 153
    goto :goto_6

    .line 154
    :cond_8
    move v0, v1

    .line 155
    :goto_6
    iget v3, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->id_:I

    .line 156
    .line 157
    if-eqz v3, :cond_9

    .line 158
    .line 159
    move v1, v2

    .line 160
    :cond_9
    invoke-interface {p2, v0, p1, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    iput p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->id_:I

    .line 165
    .line 166
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

    .line 167
    .line 168
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

    .line 169
    .line 170
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

    .line 175
    .line 176
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 177
    .line 178
    if-ne p2, p1, :cond_a

    .line 179
    .line 180
    iget p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->bitField0_:I

    .line 181
    .line 182
    iget p2, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->bitField0_:I

    .line 183
    .line 184
    or-int/2addr p1, p2

    .line 185
    iput p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->bitField0_:I

    .line 186
    .line 187
    :cond_a
    return-object p0

    .line 188
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;

    .line 189
    .line 190
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;-><init>(Ll/o2w;)V

    .line 191
    .line 192
    .line 193
    return-object p0

    .line 194
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

    .line 195
    .line 196
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 197
    .line 198
    .line 199
    return-object v0

    .line 200
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 201
    .line 202
    return-object p0

    .line 203
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 204
    .line 205
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;-><init>()V

    .line 206
    .line 207
    .line 208
    return-object p0

    .line 209
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

.method public getFields(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

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

.method public getFieldsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

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

.method public getFieldsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

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

.method public getFieldsList()Ljava/util/List;
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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->id_:I

    .line 2
    .line 3
    return p0
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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->id_:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-static {v2, v0}, Lcom/google/protobuf/CodedOutputStream;->N(II)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    move v0, v1

    .line 19
    :goto_0
    move v2, v1

    .line 20
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

    .line 21
    .line 22
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-ge v1, v3, :cond_2

    .line 27
    .line 28
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

    .line 29
    .line 30
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v3}, Lcom/google/protobuf/CodedOutputStream;->L(Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    add-int/2addr v2, v3

    .line 41
    add-int/lit8 v1, v1, 0x1

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_2
    add-int/2addr v0, v2

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->getFieldsList()Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    add-int/2addr v0, v1

    .line 54
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 55
    .line 56
    return v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->id_:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->G0(II)V

    .line 7
    .line 8
    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

    .line 11
    .line 12
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-ge v0, v1, :cond_1

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->fields_:Lcom/google/protobuf/l$h;

    .line 19
    .line 20
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ljava/lang/String;

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    add-int/lit8 v0, v0, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-void
.end method
