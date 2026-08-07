.class public final Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPictureOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "UserPicture"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPictureOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

.field public static final MEDIATYPE_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;",
            ">;"
        }
    .end annotation
.end field

.field public static final SIZE_FIELD_NUMBER:I = 0x3

.field public static final URL_FIELD_NUMBER:I = 0x1


# instance fields
.field private bitField0_:I

.field private mediaType_:Ljava/lang/String;

.field private size_:Lcom/google/protobuf/l$g;

.field private url_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->url_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->mediaType_:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyLongList()Lcom/google/protobuf/l$g;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->addAllSize(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllSize(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->ensureSizeIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addSize(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->ensureSizeIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 5
    .line 6
    invoke-interface {p0, p1, p2}, Lcom/google/protobuf/l$g;->u(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->addSize(J)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->clearMediaType()V

    return-void
.end method

.method private clearMediaType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->getMediaType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->mediaType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearSize()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyLongList()Lcom/google/protobuf/l$g;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 6
    .line 7
    return-void
.end method

.method private clearUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->getUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->url_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->clearSize()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->clearUrl()V

    return-void
.end method

.method private ensureSizeIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$g;)Lcom/google/protobuf/l$g;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->setMediaType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->setMediaTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;IJ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->setSize(IJ)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->setUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->setUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic k()Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    return-object v0
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;)Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

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

.method private setMediaType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->mediaType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setMediaTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->mediaType_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setSize(IJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->ensureSizeIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 5
    .line 6
    invoke-interface {p0, p1, p2, p3}, Lcom/google/protobuf/l$g;->setLong(IJ)J

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private setUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->url_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->url_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->PARSER:Ll/ng60;

    .line 19
    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    .line 23
    .line 24
    monitor-enter p0

    .line 25
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->PARSER:Ll/ng60;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 30
    .line 31
    sget-object p2, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    .line 32
    .line 33
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 34
    .line 35
    .line 36
    sput-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->PARSER:Ll/ng60;

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
    if-nez p1, :cond_b

    .line 54
    .line 55
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    if-eqz p3, :cond_3

    .line 60
    .line 61
    const/16 v2, 0xa

    .line 62
    .line 63
    if-eq p3, v2, :cond_a

    .line 64
    .line 65
    const/16 v2, 0x12

    .line 66
    .line 67
    if-eq p3, v2, :cond_9

    .line 68
    .line 69
    const/16 v2, 0x18

    .line 70
    .line 71
    if-eq p3, v2, :cond_7

    .line 72
    .line 73
    const/16 v2, 0x1a

    .line 74
    .line 75
    if-eq p3, v2, :cond_4

    .line 76
    .line 77
    invoke-virtual {p2, p3}, Lcom/google/protobuf/e;->R(I)Z

    .line 78
    .line 79
    .line 80
    move-result p3

    .line 81
    if-nez p3, :cond_2

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
    goto :goto_5

    .line 87
    :catch_1
    move-exception p1

    .line 88
    goto :goto_6

    .line 89
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->C()I

    .line 90
    .line 91
    .line 92
    move-result p3

    .line 93
    invoke-virtual {p2, p3}, Lcom/google/protobuf/e;->l(I)I

    .line 94
    .line 95
    .line 96
    move-result p3

    .line 97
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 98
    .line 99
    invoke-interface {v2}, Lcom/google/protobuf/l$h;->q()Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-nez v2, :cond_5

    .line 104
    .line 105
    invoke-virtual {p2}, Lcom/google/protobuf/e;->d()I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    if-lez v2, :cond_5

    .line 110
    .line 111
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 112
    .line 113
    invoke-static {v2}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$g;)Lcom/google/protobuf/l$g;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 118
    .line 119
    :cond_5
    :goto_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->d()I

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-lez v2, :cond_6

    .line 124
    .line 125
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 126
    .line 127
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 128
    .line 129
    .line 130
    move-result-wide v3

    .line 131
    invoke-interface {v2, v3, v4}, Lcom/google/protobuf/l$g;->u(J)V

    .line 132
    .line 133
    .line 134
    goto :goto_4

    .line 135
    :cond_6
    invoke-virtual {p2, p3}, Lcom/google/protobuf/e;->k(I)V

    .line 136
    .line 137
    .line 138
    goto :goto_3

    .line 139
    :cond_7
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 140
    .line 141
    invoke-interface {p3}, Lcom/google/protobuf/l$h;->q()Z

    .line 142
    .line 143
    .line 144
    move-result p3

    .line 145
    if-nez p3, :cond_8

    .line 146
    .line 147
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 148
    .line 149
    invoke-static {p3}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$g;)Lcom/google/protobuf/l$g;

    .line 150
    .line 151
    .line 152
    move-result-object p3

    .line 153
    iput-object p3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 154
    .line 155
    :cond_8
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 156
    .line 157
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 158
    .line 159
    .line 160
    move-result-wide v2

    .line 161
    invoke-interface {p3, v2, v3}, Lcom/google/protobuf/l$g;->u(J)V

    .line 162
    .line 163
    .line 164
    goto :goto_3

    .line 165
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p3

    .line 169
    iput-object p3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->mediaType_:Ljava/lang/String;

    .line 170
    .line 171
    goto :goto_3

    .line 172
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p3

    .line 176
    iput-object p3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->url_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 177
    .line 178
    goto :goto_3

    .line 179
    :catchall_1
    move-exception p0

    .line 180
    throw p0

    .line 181
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 182
    .line 183
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 195
    .line 196
    .line 197
    return-object v0

    .line 198
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 203
    .line 204
    .line 205
    return-object v0

    .line 206
    :cond_b
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    .line 207
    .line 208
    return-object p0

    .line 209
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 210
    .line 211
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    .line 212
    .line 213
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->url_:Ljava/lang/String;

    .line 214
    .line 215
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    xor-int/2addr p1, v1

    .line 220
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->url_:Ljava/lang/String;

    .line 221
    .line 222
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->url_:Ljava/lang/String;

    .line 223
    .line 224
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 225
    .line 226
    .line 227
    move-result v2

    .line 228
    xor-int/2addr v2, v1

    .line 229
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->url_:Ljava/lang/String;

    .line 230
    .line 231
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->url_:Ljava/lang/String;

    .line 236
    .line 237
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->mediaType_:Ljava/lang/String;

    .line 238
    .line 239
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 240
    .line 241
    .line 242
    move-result p1

    .line 243
    xor-int/2addr p1, v1

    .line 244
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->mediaType_:Ljava/lang/String;

    .line 245
    .line 246
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->mediaType_:Ljava/lang/String;

    .line 247
    .line 248
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 249
    .line 250
    .line 251
    move-result v2

    .line 252
    xor-int/2addr v1, v2

    .line 253
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->mediaType_:Ljava/lang/String;

    .line 254
    .line 255
    invoke-interface {p2, p1, v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->mediaType_:Ljava/lang/String;

    .line 260
    .line 261
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 262
    .line 263
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 264
    .line 265
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->q(Lcom/google/protobuf/l$g;Lcom/google/protobuf/l$g;)Lcom/google/protobuf/l$g;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 270
    .line 271
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 272
    .line 273
    if-ne p2, p1, :cond_c

    .line 274
    .line 275
    iget p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->bitField0_:I

    .line 276
    .line 277
    iget p2, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->bitField0_:I

    .line 278
    .line 279
    or-int/2addr p1, p2

    .line 280
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->bitField0_:I

    .line 281
    .line 282
    :cond_c
    return-object p0

    .line 283
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture$Builder;

    .line 284
    .line 285
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture$Builder;-><init>(Ll/x3w;)V

    .line 286
    .line 287
    .line 288
    return-object p0

    .line 289
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 290
    .line 291
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 292
    .line 293
    .line 294
    return-object v0

    .line 295
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    .line 296
    .line 297
    return-object p0

    .line 298
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;

    .line 299
    .line 300
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;-><init>()V

    .line 301
    .line 302
    .line 303
    return-object p0

    .line 304
    nop

    .line 305
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

.method public getMediaType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->mediaType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMediaTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->mediaType_:Ljava/lang/String;

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
    .locals 5

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->url_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->getUrl()Ljava/lang/String;

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
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->mediaType_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->getMediaType()Ljava/lang/String;

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
    move v2, v1

    .line 46
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 47
    .line 48
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-ge v1, v3, :cond_3

    .line 53
    .line 54
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 55
    .line 56
    invoke-interface {v3, v1}, Lcom/google/protobuf/l$g;->getLong(I)J

    .line 57
    .line 58
    .line 59
    move-result-wide v3

    .line 60
    invoke-static {v3, v4}, Lcom/google/protobuf/CodedOutputStream;->w(J)I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    add-int/2addr v2, v3

    .line 65
    add-int/lit8 v1, v1, 0x1

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_3
    add-int/2addr v0, v2

    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->getSizeList()Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    add-int/2addr v0, v1

    .line 78
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 79
    .line 80
    return v0
.end method

.method public getSize(I)J
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/google/protobuf/l$g;->getLong(I)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public getSizeCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

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

.method public getSizeList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->url_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->url_:Ljava/lang/String;

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
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->getSerializedSize()I

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->url_:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->getUrl()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->mediaType_:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    const/4 v0, 0x2

    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->getMediaType()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    const/4 v0, 0x0

    .line 37
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 38
    .line 39
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-ge v0, v1, :cond_2

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkUserPictureMessage$UserPicture;->size_:Lcom/google/protobuf/l$g;

    .line 46
    .line 47
    invoke-interface {v1, v0}, Lcom/google/protobuf/l$g;->getLong(I)J

    .line 48
    .line 49
    .line 50
    move-result-wide v1

    .line 51
    const/4 v3, 0x3

    .line 52
    invoke-virtual {p1, v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 53
    .line 54
    .line 55
    add-int/lit8 v0, v0, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    return-void
.end method
