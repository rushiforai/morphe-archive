.class public final Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyleOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;",
        "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyleOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->k()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearButton()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->a(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSchema()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->b(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearType()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->c(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getButton()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->getButton()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSchema()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->getSchema()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSchemaBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->getSchemaBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getType()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->getType()Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpType;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->getTypeValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasButton()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->hasButton()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeButton(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->d(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setButton(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle$Builder;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->e(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle$Builder;)V

    return-object p0
.end method

.method public setButton(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->f(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$ButtonJumpStyle;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSchema(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->g(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSchemaBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->h(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setType(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpType;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->i(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpType;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTypeValue(I)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;->j(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$JumpStyle;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
