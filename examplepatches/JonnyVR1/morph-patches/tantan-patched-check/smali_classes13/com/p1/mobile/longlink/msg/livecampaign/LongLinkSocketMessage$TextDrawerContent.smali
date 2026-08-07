.class public final Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContentOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "TextDrawerContent"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContentOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

.field public static final HIERARCHY_FIELD_NUMBER:I = 0x3

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;",
            ">;"
        }
    .end annotation
.end field

.field public static final TEMPLATEFIELDS_FIELD_NUMBER:I = 0x2

.field public static final TEMPLATEID_FIELD_NUMBER:I = 0x1


# instance fields
.field private bitField0_:I

.field private hierarchy_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

.field private templateFields_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private templateId_:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->addAllTemplateFields(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllTemplateFields(Ljava/lang/Iterable;)V
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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->ensureTemplateFieldsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addTemplateFields(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->ensureTemplateFieldsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private addTemplateFieldsBytes(Lcom/google/protobuf/ByteString;)V
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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->ensureTemplateFieldsIsMutable()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

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

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->addTemplateFields(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->addTemplateFieldsBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private clearHierarchy()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->hierarchy_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 3
    .line 4
    return-void
.end method

.method private clearTemplateFields()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearTemplateId()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateId_:J

    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->clearHierarchy()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->clearTemplateFields()V

    return-void
.end method

.method private ensureTemplateFieldsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->clearTemplateId()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->mergeHierarchy(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->setHierarchy(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy$Builder;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->setHierarchy(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->setTemplateFields(ILjava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->setTemplateId(J)V

    return-void
.end method

.method public static bridge synthetic l()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    return-object v0
.end method

.method private mergeHierarchy(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->hierarchy_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->hierarchy_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;->newBuilder(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->hierarchy_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->hierarchy_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 33
    .line 34
    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

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

.method private setHierarchy(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->hierarchy_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 8
    .line 9
    return-void
.end method

.method private setHierarchy(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->hierarchy_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    return-void
.end method

.method private setTemplateFields(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->ensureTemplateFieldsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private setTemplateId(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateId_:J

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->PARSER:Ll/ng60;

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
    const/16 v3, 0x8

    .line 63
    .line 64
    if-eq p1, v3, :cond_8

    .line 65
    .line 66
    const/16 v3, 0x12

    .line 67
    .line 68
    if-eq p1, v3, :cond_6

    .line 69
    .line 70
    const/16 v3, 0x1a

    .line 71
    .line 72
    if-eq p1, v3, :cond_4

    .line 73
    .line 74
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-nez p1, :cond_2

    .line 79
    .line 80
    :cond_3
    move v0, v2

    .line 81
    goto :goto_3

    .line 82
    :catch_0
    move-exception v0

    .line 83
    move-object p1, v0

    .line 84
    goto :goto_5

    .line 85
    :catch_1
    move-exception v0

    .line 86
    move-object p1, v0

    .line 87
    goto :goto_6

    .line 88
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->hierarchy_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 89
    .line 90
    if-eqz p1, :cond_5

    .line 91
    .line 92
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy$Builder;

    .line 97
    .line 98
    goto :goto_4

    .line 99
    :cond_5
    move-object p1, v1

    .line 100
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;->parser()Ll/ng60;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    check-cast v3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 109
    .line 110
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->hierarchy_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 111
    .line 112
    if-eqz p1, :cond_2

    .line 113
    .line 114
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 122
    .line 123
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->hierarchy_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 124
    .line 125
    goto :goto_3

    .line 126
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

    .line 131
    .line 132
    invoke-interface {v3}, Lcom/google/protobuf/l$h;->q()Z

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    if-nez v3, :cond_7

    .line 137
    .line 138
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

    .line 139
    .line 140
    invoke-static {v3}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

    .line 145
    .line 146
    :cond_7
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

    .line 147
    .line 148
    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    goto :goto_3

    .line 152
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 153
    .line 154
    .line 155
    move-result-wide v3

    .line 156
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateId_:J
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :catchall_1
    move-exception v0

    .line 160
    move-object p0, v0

    .line 161
    throw p0

    .line 162
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 163
    .line 164
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

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
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 184
    .line 185
    .line 186
    return-object v1

    .line 187
    :cond_9
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    .line 188
    .line 189
    return-object p0

    .line 190
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 191
    .line 192
    check-cast p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    .line 193
    .line 194
    move p1, v2

    .line 195
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateId_:J

    .line 196
    .line 197
    const-wide/16 v4, 0x0

    .line 198
    .line 199
    cmp-long v1, v2, v4

    .line 200
    .line 201
    if-eqz v1, :cond_a

    .line 202
    .line 203
    move v1, p1

    .line 204
    :goto_7
    move-wide v7, v4

    .line 205
    goto :goto_8

    .line 206
    :cond_a
    move v1, v0

    .line 207
    goto :goto_7

    .line 208
    :goto_8
    iget-wide v5, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateId_:J

    .line 209
    .line 210
    cmp-long v4, v5, v7

    .line 211
    .line 212
    if-eqz v4, :cond_b

    .line 213
    .line 214
    move v4, p1

    .line 215
    :goto_9
    move-object v0, p2

    .line 216
    goto :goto_a

    .line 217
    :cond_b
    move v4, v0

    .line 218
    goto :goto_9

    .line 219
    :goto_a
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 220
    .line 221
    .line 222
    move-result-wide p1

    .line 223
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateId_:J

    .line 224
    .line 225
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

    .line 226
    .line 227
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

    .line 228
    .line 229
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

    .line 234
    .line 235
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->hierarchy_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 236
    .line 237
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->hierarchy_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 238
    .line 239
    invoke-interface {v0, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 244
    .line 245
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->hierarchy_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 246
    .line 247
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 248
    .line 249
    if-ne v0, p1, :cond_c

    .line 250
    .line 251
    iget p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->bitField0_:I

    .line 252
    .line 253
    iget p2, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->bitField0_:I

    .line 254
    .line 255
    or-int/2addr p1, p2

    .line 256
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->bitField0_:I

    .line 257
    .line 258
    :cond_c
    return-object p0

    .line 259
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent$Builder;

    .line 260
    .line 261
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent$Builder;-><init>(Ll/v3w;)V

    .line 262
    .line 263
    .line 264
    return-object p0

    .line 265
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

    .line 266
    .line 267
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 268
    .line 269
    .line 270
    return-object v1

    .line 271
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    .line 272
    .line 273
    return-object p0

    .line 274
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    .line 275
    .line 276
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;-><init>()V

    .line 277
    .line 278
    .line 279
    return-object p0

    .line 280
    nop

    .line 281
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

.method public getHierarchy()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->hierarchy_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateId_:J

    .line 8
    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmp-long v2, v0, v2

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    if-eqz v2, :cond_1

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move v0, v3

    .line 23
    :goto_0
    move v1, v3

    .line 24
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

    .line 25
    .line 26
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-ge v3, v2, :cond_2

    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

    .line 33
    .line 34
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v2}, Lcom/google/protobuf/CodedOutputStream;->L(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    add-int/2addr v1, v2

    .line 45
    add-int/lit8 v3, v3, 0x1

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    add-int/2addr v0, v1

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->getTemplateFieldsList()Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    add-int/2addr v0, v1

    .line 58
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->hierarchy_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 59
    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    const/4 v1, 0x3

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->getHierarchy()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    add-int/2addr v0, v1

    .line 72
    :cond_3
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 73
    .line 74
    return v0
.end method

.method public getTemplateFields(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

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

.method public getTemplateFieldsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

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

.method public getTemplateFieldsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

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

.method public getTemplateFieldsList()Ljava/util/List;
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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTemplateId()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateId_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public hasHierarchy()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->hierarchy_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateId_:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-ge v0, v1, :cond_1

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->templateFields_:Lcom/google/protobuf/l$h;

    .line 23
    .line 24
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Ljava/lang/String;

    .line 29
    .line 30
    const/4 v2, 0x2

    .line 31
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 32
    .line 33
    .line 34
    add-int/lit8 v0, v0, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->hierarchy_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    const/4 v0, 0x3

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->getHierarchy()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    return-void
.end method
