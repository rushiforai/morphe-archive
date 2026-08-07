.class public final Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "H5Drawer"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerOrBuilder;"
    }
.end annotation


# static fields
.field public static final CLOSEBUTTONURL_FIELD_NUMBER:I = 0x3

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

.field public static final FADINGSECONDS_FIELD_NUMBER:I = 0x2

.field public static final H5URL_FIELD_NUMBER:I = 0x1

.field public static final HEIGHT_FIELD_NUMBER:I = 0x4

.field public static final LOADING_FIELD_NUMBER:I = 0x6

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;",
            ">;"
        }
    .end annotation
.end field

.field public static final WIDTH_FIELD_NUMBER:I = 0x5


# instance fields
.field private closeButtonUrl_:Ljava/lang/String;

.field private fadingSeconds_:J

.field private h5Url_:Ljava/lang/String;

.field private height_:D

.field private loading_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

.field private width_:D


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->h5Url_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->closeButtonUrl_:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->clearCloseButtonUrl()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->clearFadingSeconds()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->clearH5Url()V

    return-void
.end method

.method private clearCloseButtonUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getCloseButtonUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->closeButtonUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearFadingSeconds()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->fadingSeconds_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearH5Url()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getH5Url()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->h5Url_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearHeight()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->height_:D

    .line 4
    .line 5
    return-void
.end method

.method private clearLoading()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->loading_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 3
    .line 4
    return-void
.end method

.method private clearWidth()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->width_:D

    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->clearHeight()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->clearLoading()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->clearWidth()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->mergeLoading(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->setCloseButtonUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->setCloseButtonUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->setFadingSeconds(J)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->setH5Url(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->setH5UrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;D)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->setHeight(D)V

    return-void
.end method

.method private mergeLoading(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->loading_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->loading_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;->newBuilder(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->loading_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->loading_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->setLoading(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading$Builder;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->setLoading(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;D)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->setWidth(D)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

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

.method public static bridge synthetic q()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    return-object v0
.end method

.method private setCloseButtonUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->closeButtonUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setCloseButtonUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->closeButtonUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setFadingSeconds(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->fadingSeconds_:J

    .line 2
    .line 3
    return-void
.end method

.method private setH5Url(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->h5Url_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setH5UrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->h5Url_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setHeight(D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->height_:D

    .line 2
    .line 3
    return-void
.end method

.method private setLoading(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->loading_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 8
    .line 9
    return-void
.end method

.method private setLoading(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->loading_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    return-void
.end method

.method private setWidth(D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->width_:D

    .line 2
    .line 3
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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->PARSER:Ll/ng60;

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
    const/16 v3, 0xa

    .line 63
    .line 64
    if-eq p1, v3, :cond_a

    .line 65
    .line 66
    const/16 v3, 0x10

    .line 67
    .line 68
    if-eq p1, v3, :cond_9

    .line 69
    .line 70
    const/16 v3, 0x1a

    .line 71
    .line 72
    if-eq p1, v3, :cond_8

    .line 73
    .line 74
    const/16 v3, 0x21

    .line 75
    .line 76
    if-eq p1, v3, :cond_7

    .line 77
    .line 78
    const/16 v3, 0x29

    .line 79
    .line 80
    if-eq p1, v3, :cond_6

    .line 81
    .line 82
    const/16 v3, 0x32

    .line 83
    .line 84
    if-eq p1, v3, :cond_4

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
    goto :goto_5

    .line 97
    :catch_1
    move-exception v0

    .line 98
    move-object p1, v0

    .line 99
    goto :goto_6

    .line 100
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->loading_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 101
    .line 102
    if-eqz p1, :cond_5

    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading$Builder;

    .line 109
    .line 110
    goto :goto_4

    .line 111
    :cond_5
    move-object p1, v1

    .line 112
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;->parser()Ll/ng60;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    check-cast v3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 121
    .line 122
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->loading_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 123
    .line 124
    if-eqz p1, :cond_2

    .line 125
    .line 126
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 134
    .line 135
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->loading_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 136
    .line 137
    goto :goto_3

    .line 138
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->o()D

    .line 139
    .line 140
    .line 141
    move-result-wide v3

    .line 142
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->width_:D

    .line 143
    .line 144
    goto :goto_3

    .line 145
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->o()D

    .line 146
    .line 147
    .line 148
    move-result-wide v3

    .line 149
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->height_:D

    .line 150
    .line 151
    goto :goto_3

    .line 152
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->closeButtonUrl_:Ljava/lang/String;

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 160
    .line 161
    .line 162
    move-result-wide v3

    .line 163
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->fadingSeconds_:J

    .line 164
    .line 165
    goto :goto_3

    .line 166
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->h5Url_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 171
    .line 172
    goto :goto_3

    .line 173
    :catchall_1
    move-exception v0

    .line 174
    move-object p0, v0

    .line 175
    throw p0

    .line 176
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 177
    .line 178
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 190
    .line 191
    .line 192
    return-object v1

    .line 193
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 198
    .line 199
    .line 200
    return-object v1

    .line 201
    :cond_b
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 202
    .line 203
    return-object p0

    .line 204
    :pswitch_3
    move-object v3, p2

    .line 205
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 206
    .line 207
    check-cast p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 208
    .line 209
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->h5Url_:Ljava/lang/String;

    .line 210
    .line 211
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 212
    .line 213
    .line 214
    move-result p1

    .line 215
    xor-int/2addr p1, v2

    .line 216
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->h5Url_:Ljava/lang/String;

    .line 217
    .line 218
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->h5Url_:Ljava/lang/String;

    .line 219
    .line 220
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    xor-int/2addr v1, v2

    .line 225
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->h5Url_:Ljava/lang/String;

    .line 226
    .line 227
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->h5Url_:Ljava/lang/String;

    .line 232
    .line 233
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->fadingSeconds_:J

    .line 234
    .line 235
    const-wide/16 p1, 0x0

    .line 236
    .line 237
    cmp-long v1, v5, p1

    .line 238
    .line 239
    if-eqz v1, :cond_c

    .line 240
    .line 241
    move v4, v2

    .line 242
    goto :goto_7

    .line 243
    :cond_c
    move v4, v0

    .line 244
    :goto_7
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->fadingSeconds_:J

    .line 245
    .line 246
    cmp-long p1, v8, p1

    .line 247
    .line 248
    if-eqz p1, :cond_d

    .line 249
    .line 250
    move v7, v2

    .line 251
    goto :goto_8

    .line 252
    :cond_d
    move v7, v0

    .line 253
    :goto_8
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 254
    .line 255
    .line 256
    move-result-wide p1

    .line 257
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->fadingSeconds_:J

    .line 258
    .line 259
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->closeButtonUrl_:Ljava/lang/String;

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
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->closeButtonUrl_:Ljava/lang/String;

    .line 267
    .line 268
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->closeButtonUrl_:Ljava/lang/String;

    .line 269
    .line 270
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    xor-int/2addr v1, v2

    .line 275
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->closeButtonUrl_:Ljava/lang/String;

    .line 276
    .line 277
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object p1

    .line 281
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->closeButtonUrl_:Ljava/lang/String;

    .line 282
    .line 283
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->height_:D

    .line 284
    .line 285
    const-wide/16 p1, 0x0

    .line 286
    .line 287
    cmpl-double v1, v5, p1

    .line 288
    .line 289
    if-eqz v1, :cond_e

    .line 290
    .line 291
    move v4, v2

    .line 292
    goto :goto_9

    .line 293
    :cond_e
    move v4, v0

    .line 294
    :goto_9
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->height_:D

    .line 295
    .line 296
    cmpl-double v1, v8, p1

    .line 297
    .line 298
    if-eqz v1, :cond_f

    .line 299
    .line 300
    move v7, v2

    .line 301
    goto :goto_a

    .line 302
    :cond_f
    move v7, v0

    .line 303
    :goto_a
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->j(ZDZD)D

    .line 304
    .line 305
    .line 306
    move-result-wide v4

    .line 307
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->height_:D

    .line 308
    .line 309
    move v1, v0

    .line 310
    move v4, v2

    .line 311
    move-object v0, v3

    .line 312
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->width_:D

    .line 313
    .line 314
    cmpl-double v5, v2, p1

    .line 315
    .line 316
    if-eqz v5, :cond_10

    .line 317
    .line 318
    move v5, v1

    .line 319
    move v1, v4

    .line 320
    goto :goto_b

    .line 321
    :cond_10
    move v5, v1

    .line 322
    :goto_b
    iget-wide v6, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->width_:D

    .line 323
    .line 324
    cmpl-double p1, v6, p1

    .line 325
    .line 326
    if-eqz p1, :cond_11

    .line 327
    .line 328
    :goto_c
    move-wide v5, v6

    .line 329
    goto :goto_d

    .line 330
    :cond_11
    move v4, v5

    .line 331
    goto :goto_c

    .line 332
    :goto_d
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->j(ZDZD)D

    .line 333
    .line 334
    .line 335
    move-result-wide p1

    .line 336
    move-object v3, v0

    .line 337
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->width_:D

    .line 338
    .line 339
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->loading_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 340
    .line 341
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->loading_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 342
    .line 343
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 344
    .line 345
    .line 346
    move-result-object p1

    .line 347
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 348
    .line 349
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->loading_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 350
    .line 351
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 352
    .line 353
    return-object p0

    .line 354
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer$Builder;

    .line 355
    .line 356
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer$Builder;-><init>(Ll/v3w;)V

    .line 357
    .line 358
    .line 359
    return-object p0

    .line 360
    :pswitch_5
    return-object v1

    .line 361
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 362
    .line 363
    return-object p0

    .line 364
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 365
    .line 366
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;-><init>()V

    .line 367
    .line 368
    .line 369
    return-object p0

    .line 370
    nop

    .line 371
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

.method public getCloseButtonUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->closeButtonUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCloseButtonUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->closeButtonUrl_:Ljava/lang/String;

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

.method public getFadingSeconds()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->fadingSeconds_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getH5Url()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->h5Url_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getH5UrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->h5Url_:Ljava/lang/String;

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

.method public getHeight()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->height_:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public getLoading()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->loading_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->h5Url_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getH5Url()Ljava/lang/String;

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
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->fadingSeconds_:J

    .line 27
    .line 28
    const-wide/16 v3, 0x0

    .line 29
    .line 30
    cmp-long v3, v1, v3

    .line 31
    .line 32
    if-eqz v3, :cond_2

    .line 33
    .line 34
    const/4 v3, 0x2

    .line 35
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    add-int/2addr v0, v1

    .line 40
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->closeButtonUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getCloseButtonUrl()Ljava/lang/String;

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
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->height_:D

    .line 59
    .line 60
    const-wide/16 v3, 0x0

    .line 61
    .line 62
    cmpl-double v5, v1, v3

    .line 63
    .line 64
    if-eqz v5, :cond_4

    .line 65
    .line 66
    const/4 v5, 0x4

    .line 67
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->k(ID)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    add-int/2addr v0, v1

    .line 72
    :cond_4
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->width_:D

    .line 73
    .line 74
    cmpl-double v3, v1, v3

    .line 75
    .line 76
    if-eqz v3, :cond_5

    .line 77
    .line 78
    const/4 v3, 0x5

    .line 79
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->k(ID)I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    add-int/2addr v0, v1

    .line 84
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->loading_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 85
    .line 86
    if-eqz v1, :cond_6

    .line 87
    .line 88
    const/4 v1, 0x6

    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getLoading()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    add-int/2addr v0, v1

    .line 98
    :cond_6
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 99
    .line 100
    return v0
.end method

.method public getWidth()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->width_:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public hasLoading()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->loading_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

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
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->h5Url_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getH5Url()Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->fadingSeconds_:J

    .line 18
    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    cmp-long v2, v0, v2

    .line 22
    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->closeButtonUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getCloseButtonUrl()Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->height_:D

    .line 46
    .line 47
    const-wide/16 v2, 0x0

    .line 48
    .line 49
    cmpl-double v4, v0, v2

    .line 50
    .line 51
    if-eqz v4, :cond_3

    .line 52
    .line 53
    const/4 v4, 0x4

    .line 54
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->g0(ID)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->width_:D

    .line 58
    .line 59
    cmpl-double v2, v0, v2

    .line 60
    .line 61
    if-eqz v2, :cond_4

    .line 62
    .line 63
    const/4 v2, 0x5

    .line 64
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->g0(ID)V

    .line 65
    .line 66
    .line 67
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->loading_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 68
    .line 69
    if-eqz v0, :cond_5

    .line 70
    .line 71
    const/4 v0, 0x6

    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getLoading()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 77
    .line 78
    .line 79
    :cond_5
    return-void
.end method
