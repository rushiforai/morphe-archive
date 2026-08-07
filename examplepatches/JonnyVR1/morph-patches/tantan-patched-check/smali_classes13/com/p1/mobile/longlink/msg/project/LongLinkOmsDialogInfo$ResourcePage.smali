.class public final Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ResourcePage"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePageOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

.field public static final INDEX_FIELD_NUMBER:I = 0x1

.field public static final NODES_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Ll/ng60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private bitField0_:I

.field private index_:I

.field private nodes_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->addAllNodes(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllNodes(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->ensureNodesIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addNodes(ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->ensureNodesIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addNodes(ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->ensureNodesIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addNodes(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->ensureNodesIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addNodes(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->ensureNodesIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->addNodes(ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode$Builder;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->addNodes(ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;)V

    return-void
.end method

.method private clearIndex()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->index_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearNodes()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->addNodes(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode$Builder;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->addNodes(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;)V

    return-void
.end method

.method private ensureNodesIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->clearIndex()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->clearNodes()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->removeNodes(I)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->setIndex(I)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->setNodes(ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode$Builder;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->setNodes(ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;)V

    return-void
.end method

.method public static bridge synthetic l()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    return-object v0
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

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

.method private removeNodes(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->ensureNodesIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private setIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->index_:I

    .line 2
    .line 3
    return-void
.end method

.method private setNodes(ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->ensureNodesIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setNodes(ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->ensureNodesIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->PARSER:Ll/ng60;

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
    const/16 v3, 0x8

    .line 62
    .line 63
    if-eq p1, v3, :cond_6

    .line 64
    .line 65
    const/16 v3, 0x12

    .line 66
    .line 67
    if-eq p1, v3, :cond_4

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
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 82
    .line 83
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->q()Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-nez p1, :cond_5

    .line 88
    .line 89
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 90
    .line 91
    invoke-static {p1}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 96
    .line 97
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 98
    .line 99
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;->parser()Ll/ng60;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    check-cast v3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;

    .line 108
    .line 109
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    goto :goto_3

    .line 113
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->index_:I
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 118
    .line 119
    goto :goto_3

    .line 120
    :catchall_1
    move-exception p0

    .line 121
    throw p0

    .line 122
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 123
    .line 124
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 136
    .line 137
    .line 138
    return-object v0

    .line 139
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 144
    .line 145
    .line 146
    return-object v0

    .line 147
    :cond_7
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 148
    .line 149
    return-object p0

    .line 150
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 151
    .line 152
    check-cast p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 153
    .line 154
    iget p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->index_:I

    .line 155
    .line 156
    if-eqz p1, :cond_8

    .line 157
    .line 158
    move v0, v2

    .line 159
    goto :goto_6

    .line 160
    :cond_8
    move v0, v1

    .line 161
    :goto_6
    iget v3, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->index_:I

    .line 162
    .line 163
    if-eqz v3, :cond_9

    .line 164
    .line 165
    move v1, v2

    .line 166
    :cond_9
    invoke-interface {p2, v0, p1, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->index_:I

    .line 171
    .line 172
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 173
    .line 174
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 175
    .line 176
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 181
    .line 182
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 183
    .line 184
    if-ne p2, p1, :cond_a

    .line 185
    .line 186
    iget p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->bitField0_:I

    .line 187
    .line 188
    iget p2, p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->bitField0_:I

    .line 189
    .line 190
    or-int/2addr p1, p2

    .line 191
    iput p1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->bitField0_:I

    .line 192
    .line 193
    :cond_a
    return-object p0

    .line 194
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;

    .line 195
    .line 196
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;-><init>(Ll/p3w;)V

    .line 197
    .line 198
    .line 199
    return-object p0

    .line 200
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 201
    .line 202
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 203
    .line 204
    .line 205
    return-object v0

    .line 206
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 207
    .line 208
    return-object p0

    .line 209
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 210
    .line 211
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;-><init>()V

    .line 212
    .line 213
    .line 214
    return-object p0

    .line 215
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

.method public getIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->index_:I

    .line 2
    .line 3
    return p0
.end method

.method public getNodes(I)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;

    .line 8
    .line 9
    return-object p0
.end method

.method public getNodesCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

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

.method public getNodesList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNodesOrBuilder(I)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNodeOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNodeOrBuilder;

    .line 8
    .line 9
    return-object p0
.end method

.method public getNodesOrBuilderList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNodeOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->index_:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-static {v2, v0}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

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
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 20
    .line 21
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-ge v1, v2, :cond_2

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 28
    .line 29
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Lcom/google/protobuf/q;

    .line 34
    .line 35
    const/4 v3, 0x2

    .line 36
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    add-int/2addr v0, v2

    .line 41
    add-int/lit8 v1, v1, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 45
    .line 46
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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->index_:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 7
    .line 8
    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->nodes_:Lcom/google/protobuf/l$h;

    .line 19
    .line 20
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/google/protobuf/q;

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

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
