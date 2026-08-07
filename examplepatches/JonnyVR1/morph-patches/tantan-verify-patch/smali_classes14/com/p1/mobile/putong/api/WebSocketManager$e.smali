.class public Lcom/p1/mobile/putong/api/WebSocketManager$e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/api/WebSocketManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "e"
.end annotation


# instance fields
.field public final a:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;",
            "Ljava/util/List<",
            "Ll/fxl;",
            ">;>;"
        }
    .end annotation
.end field

.field public b:Ll/n4w;

.field public final synthetic c:Lcom/p1/mobile/putong/api/WebSocketManager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/api/WebSocketManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->c:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/LinkedHashMap;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->a:Ljava/util/LinkedHashMap;

    .line 12
    .line 13
    new-instance p1, Ll/n4w;

    .line 14
    .line 15
    invoke-direct {p1}, Ll/n4w;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->b:Ll/n4w;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/api/WebSocketManager$e;Ll/pq60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager$e;->e(Ll/pq60;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/api/WebSocketManager$e;Ll/pq60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager$e;->f(Ll/pq60;)V

    return-void
.end method


# virtual methods
.method public c(Ll/pq60;)Z
    .locals 3

    .line 1
    iget-object v0, p1, Ll/pq60;->a:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getType()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "LongLinkCommonBaseDisposeHandler handle type = "

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v2, ", originMsg = "

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ll/pq60;->a()Lokio/ByteString;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "[common][push]"

    .line 34
    .line 35
    invoke-static {v2, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->a:Ljava/util/LinkedHashMap;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Ljava/util/List;

    .line 45
    .line 46
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    const/4 v1, 0x0

    .line 51
    if-nez v0, :cond_0

    .line 52
    .line 53
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Ll/fxl;

    .line 68
    .line 69
    iget-object v1, p1, Ll/pq60;->b:Lcom/google/protobuf/q;

    .line 70
    .line 71
    invoke-interface {v0, v1, p1}, Ll/fxl;->a(Lcom/google/protobuf/q;Ll/pq60;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    goto :goto_0

    .line 76
    :cond_0
    return v1
.end method

.method public d()V
    .locals 3

    .line 1
    new-instance v0, Ll/k4w;

    .line 2
    .line 3
    new-instance v1, Ll/xsp0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/xsp0;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager$e;)V

    .line 6
    .line 7
    .line 8
    new-instance v2, Ll/ysp0;

    .line 9
    .line 10
    invoke-direct {v2, p0}, Ll/ysp0;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager$e;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {v0, v1, v2}, Ll/k4w;-><init>(Ll/y20;Ll/y20;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->c:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->f0(Ll/fxl;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->c:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->b:Ll/n4w;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/api/WebSocketManager;->f0(Ll/fxl;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager$e;->i()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic e(Ll/pq60;)V
    .locals 2

    .line 1
    iget-object p1, p1, Ll/pq60;->a:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getMsgId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->c:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/api/WebSocketManager;->g:Ljava/util/Queue;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroid/util/Pair;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v1, Ljava/lang/CharSequence;

    .line 22
    .line 23
    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->c:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->t0()V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->c:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 35
    .line 36
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->z(Lcom/p1/mobile/putong/api/WebSocketManager;Landroid/util/Pair;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->c:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 40
    .line 41
    sget-object p1, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->CONNECTED:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->m0(Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;)V

    .line 44
    .line 45
    .line 46
    const-string p0, "[common][network]"

    .line 47
    .line 48
    const-string p1, "long link connected!"

    .line 49
    .line 50
    invoke-static {p0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public final synthetic f(Ll/pq60;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->c:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->FORBIDDEN:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->m0(Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->c:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->C(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->c:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->k(Lcom/p1/mobile/putong/api/WebSocketManager;)Ll/isp0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance p1, Ljava/lang/Exception;

    .line 20
    .line 21
    const-string v0, "auth succ == failed"

    .line 22
    .line 23
    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-interface {p0, p1, v0}, Ll/isp0;->f(Ljava/lang/Exception;Ll/i5d0;)V

    .line 28
    .line 29
    .line 30
    const-string p0, "[common][network]"

    .line 31
    .line 32
    const-string p1, "long link failed!!"

    .line 33
    .line 34
    invoke-static {p0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public g([B)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager$e;->h([B)Ll/pq60;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    iget-object v0, p1, Ll/pq60;->a:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager$e;->c(Ll/pq60;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager$e;->j(ZLl/pq60;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    :goto_0
    return-void
.end method

.method public final h([B)Ll/pq60;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-static {p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->parseFrom([B)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->a:Ljava/util/LinkedHashMap;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getType()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/util/List;

    .line 20
    .line 21
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_1

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ll/fxl;

    .line 33
    .line 34
    invoke-interface {p0, p1}, Ll/fxl;->d(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;)Lcom/google/protobuf/q;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance v1, Ll/pq60;

    .line 39
    .line 40
    invoke-direct {v1, p1, p0}, Ll/pq60;-><init>(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;Lcom/google/protobuf/q;)V
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    .line 43
    return-object v1

    .line 44
    :catch_0
    move-exception p0

    .line 45
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-object v0
.end method

.method public i()V
    .locals 0

    .line 1
    return-void
.end method

.method public j(ZLl/pq60;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$PushAck;->newBuilder()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$PushAck$Builder;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$PushAck$Builder;->setRecvTs(J)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$PushAck$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->c:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->t(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p1, v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$PushAck$Builder;->setStaySide(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$PushAck$Builder;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$PushAck;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$e;->c:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 34
    .line 35
    new-instance v0, Ll/pq60;

    .line 36
    .line 37
    sget-object v1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->MSG_TYPE_PUSH_ACK:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 38
    .line 39
    iget-object p2, p2, Ll/pq60;->a:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 40
    .line 41
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getMsgId()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-direct {v0, v1, p2, p1}, Ll/pq60;-><init>(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;Ljava/lang/String;Lcom/google/protobuf/q;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ll/pq60;->a()Lokio/ByteString;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->x(Lcom/p1/mobile/putong/api/WebSocketManager;Lokio/ByteString;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method
