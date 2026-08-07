.class public final Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPointOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPointOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;->h()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;

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

.method public synthetic constructor <init>(Ll/x3o0;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearIsNewTopOne()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;->a(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPoint()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;->b(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserId()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;->c(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getIsNewTopOne()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;->getIsNewTopOne()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getPoint()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;->getPoint()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;->getUserIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setIsNewTopOne(Z)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;->d(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;Z)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPoint(J)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;->e(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;->f(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;->g(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLivePk$CallPkPoint;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
