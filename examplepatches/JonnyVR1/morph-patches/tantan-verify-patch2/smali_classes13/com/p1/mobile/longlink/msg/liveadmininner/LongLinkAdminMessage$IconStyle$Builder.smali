.class public final Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyleOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;",
        "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyleOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;->g()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$b;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ll/q1w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearType()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;->a(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUrl()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;->b(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getType()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;->getType()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconType;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTypeValue()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;->getTypeValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;->getUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;->getUrlBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setType(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconType;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;->c(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconType;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTypeValue(I)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;->d(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;->e(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUrlBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;->f(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$IconStyle;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
