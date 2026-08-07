.class public Lcom/p1/mobile/putong/api/WebSocketManager$b;
.super Ll/lsp0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/api/WebSocketManager;->J(Ljava/lang/String;)Ll/isp0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/WebSocketManager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/api/WebSocketManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/lsp0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/api/WebSocketManager$b;Lokio/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager$b;->k(Lokio/ByteString;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/api/WebSocketManager$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager$b;->l()V

    return-void
.end method


# virtual methods
.method public a(Ll/isp0;ILjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    const/16 p3, 0x3f4

    .line 4
    .line 5
    if-ne p2, p3, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->m(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->h(Lcom/p1/mobile/putong/api/WebSocketManager;)Ljava/lang/Runnable;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-static {p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->y(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public b(Ll/isp0;ILjava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Ll/isp0;Ljava/lang/Throwable;Ll/i5d0;)V
    .locals 2
    .param p3    # Ll/i5d0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->l(Lcom/p1/mobile/putong/api/WebSocketManager;)I

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    add-int/lit8 p3, p3, 0x1

    .line 14
    .line 15
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/api/WebSocketManager;->p(Lcom/p1/mobile/putong/api/WebSocketManager;I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->l(Lcom/p1/mobile/putong/api/WebSocketManager;)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    const/16 p3, 0xa

    .line 25
    .line 26
    if-ne p1, p3, :cond_2

    .line 27
    .line 28
    const-string p1, "deviceid"

    .line 29
    .line 30
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    invoke-static {p1, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string p3, ""

    .line 39
    .line 40
    if-eqz p2, :cond_1

    .line 41
    .line 42
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    goto :goto_1

    .line 54
    :cond_1
    :goto_0
    move-object p2, p3

    .line 55
    :goto_1
    const-string v0, "error"

    .line 56
    .line 57
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 62
    .line 63
    invoke-interface {v0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const-string v1, "userid"

    .line 68
    .line 69
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    filled-new-array {p1, p2, v0}, [Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    const-string p2, "e_socket_connection_failed"

    .line 78
    .line 79
    invoke-static {p2, p3, p1}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 83
    .line 84
    const/4 p2, 0x0

    .line 85
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/api/WebSocketManager;->p(Lcom/p1/mobile/putong/api/WebSocketManager;I)V

    .line 86
    .line 87
    .line 88
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 89
    .line 90
    invoke-static {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->y(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public d(Ll/isp0;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/isp0;Lokio/ByteString;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->m(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Ll/wsp0;

    .line 8
    .line 9
    invoke-direct {v0, p0, p2}, Ll/wsp0;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager$b;Lokio/ByteString;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public f(Ll/isp0;Ll/i5d0;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->m(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance p2, Ll/vsp0;

    .line 8
    .line 9
    invoke-direct {p2, p0}, Ll/vsp0;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager$b;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public g(Lokio/ByteString;)V
    .locals 0

    .line 1
    return-void
.end method

.method public h(Lokio/ByteString;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->m(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/16 p1, 0x2766

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic k(Lokio/ByteString;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->S()Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->CLOSE:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    invoke-static {v2}, Lcom/p1/mobile/putong/api/WebSocketManager;->k(Lcom/p1/mobile/putong/api/WebSocketManager;)Ll/isp0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/16 p1, 0x3e8

    .line 18
    .line 19
    const-string v0, "CloseNormalClosure"

    .line 20
    .line 21
    invoke-interface {p0, p1, v0}, Ll/isp0;->close(ILjava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    :try_start_0
    iget-object v0, v2, Lcom/p1/mobile/putong/api/WebSocketManager;->h:Lcom/p1/mobile/putong/api/WebSocketManager$e;

    .line 26
    .line 27
    invoke-virtual {p1}, Lokio/ByteString;->toByteArray()[B

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager$e;->g([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catch_0
    move-exception p1

    .line 36
    new-instance v0, Ljava/lang/Exception;

    .line 37
    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v2, "WebSocketManager onMessage "

    .line 41
    .line 42
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-direct {v0, v1, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    const/16 p1, 0xa

    .line 60
    .line 61
    invoke-static {v0, p1}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 62
    .line 63
    .line 64
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 65
    .line 66
    invoke-static {p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->G(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 70
    .line 71
    invoke-static {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->D(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final synthetic l()V
    .locals 6

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/WebSocketManager;->S()Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v2, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->CLOSE:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 10
    .line 11
    if-ne v1, v2, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->k(Lcom/p1/mobile/putong/api/WebSocketManager;)Ll/isp0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/16 v0, 0x3e8

    .line 20
    .line 21
    const-string v1, "CloseNormalClosure"

    .line 22
    .line 23
    invoke-interface {p0, v0, v1}, Ll/isp0;->close(ILjava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->newBuilder()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    sget-object v2, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->CLIENT_SOURCE_ANDROID:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;->setSource(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    sget-object v2, Ll/uqb0;->s:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;->setAppVersion(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    new-instance v2, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 49
    .line 50
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v1, v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;->setSourceVersion(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;->setBrand(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;->setModel(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {}, Ll/tl8;->H()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;->setAppUIVersion(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 94
    .line 95
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;->newBuilder()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 100
    .line 101
    invoke-interface {v2}, Ll/bn5;->getAuthData()Ll/gxd0;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {v2}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    check-cast v2, Lcom/p1/mobile/putong/data/AuthData;

    .line 110
    .line 111
    iget-object v2, v2, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;->setAccessToken(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    iget-object v2, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 118
    .line 119
    invoke-static {v2}, Lcom/p1/mobile/putong/api/WebSocketManager;->t(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;->setStaySide(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    iget-object v2, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 128
    .line 129
    invoke-static {v2}, Lcom/p1/mobile/putong/api/WebSocketManager;->w(Lcom/p1/mobile/putong/api/WebSocketManager;)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;->setLocale(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {v1, v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;->setUa(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    const-string v1, "TantanTribe"

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;->setAppID(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    const/4 v2, 0x0

    .line 152
    if-nez v1, :cond_1

    .line 153
    .line 154
    const/4 v1, 0x1

    .line 155
    goto :goto_0

    .line 156
    :cond_1
    move v1, v2

    .line 157
    :goto_0
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;->setMute(Z)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;->setDeviceIdentifer(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    const-string v1, "googleplay"

    .line 170
    .line 171
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;->setChannel(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;

    .line 172
    .line 173
    .line 174
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 175
    .line 176
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->K(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth$Builder;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Auth;

    .line 184
    .line 185
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->N()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    iget-object v3, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 190
    .line 191
    new-instance v4, Ll/pq60;

    .line 192
    .line 193
    sget-object v5, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->MSG_TYPE_AUTH:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 194
    .line 195
    invoke-direct {v4, v5, v1, v0}, Ll/pq60;-><init>(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;Ljava/lang/String;Lcom/google/protobuf/q;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v4}, Ll/pq60;->a()Lokio/ByteString;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-static {v3, v1, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->s(Lcom/p1/mobile/putong/api/WebSocketManager;Ljava/lang/String;Lokio/ByteString;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 203
    .line 204
    .line 205
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 206
    .line 207
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/api/WebSocketManager;->q(Lcom/p1/mobile/putong/api/WebSocketManager;I)V

    .line 208
    .line 209
    .line 210
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 211
    .line 212
    invoke-static {v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->G(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    .line 213
    .line 214
    .line 215
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$b;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 216
    .line 217
    invoke-static {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->F(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    .line 218
    .line 219
    .line 220
    return-void

    .line 221
    :catch_0
    move-exception p0

    .line 222
    new-instance v0, Ljava/lang/Exception;

    .line 223
    .line 224
    new-instance v1, Ljava/lang/StringBuilder;

    .line 225
    .line 226
    const-string v2, "WebSocketManager onOpen "

    .line 227
    .line 228
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    invoke-direct {v0, v1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 243
    .line 244
    .line 245
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 246
    .line 247
    .line 248
    throw p0
.end method
