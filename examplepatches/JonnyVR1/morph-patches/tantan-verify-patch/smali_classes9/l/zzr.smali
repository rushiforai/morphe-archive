.class public Ll/zzr;
.super Ll/mq2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mq2<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/zod;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mq2;-><init>(Ll/zod;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;->getTempdata()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getFieldsList()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/vwt;->c4()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;->getTempdata()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getFields(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 p1, 0x2

    .line 34
    invoke-static {p1}, Ll/wft;->b(I)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Hf:I

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->y0:I

    .line 44
    .line 45
    :goto_0
    invoke-static {p1, p0}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    sget-object v0, Ll/xzr;->INSTANCE:Ll/xzr;

    .line 50
    .line 51
    const/4 v1, -0x1

    .line 52
    invoke-virtual {v0, p1, p0, v1}, Ll/xzr;->a(Ljava/lang/String;Ljava/lang/String;I)Landroid/text/SpannableString;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Landroid/text/SpannableString;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method


# virtual methods
.method public A(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;->getRoomId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string p2, "no_care"

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, p2}, Ll/mq2;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public B(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;
    .locals 2

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;->getUser()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-static {}, Ll/eb20;->a()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {p3, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_0

    .line 30
    .line 31
    invoke-static {v0, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p3

    .line 35
    if-eqz p3, :cond_1

    .line 36
    .line 37
    :cond_0
    new-instance p3, Ljava/lang/IllegalStateException;

    .line 38
    .line 39
    const-string v0, "live boot message send in block msg handler"

    .line 40
    .line 41
    invoke-direct {p3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p3}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    new-instance p3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    .line 48
    .line 49
    const-string v0, "boot"

    .line 50
    .line 51
    invoke-direct {p3, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-direct {p0, p2}, Ll/zzr;->z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->setContent(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string p1, "live.room.block"

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->setFrom(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0

    .line 69
    :cond_1
    const/4 p0, 0x0

    .line 70
    return-object p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 6

    .line 1
    const/4 p3, 0x2

    .line 2
    invoke-static {p3}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result p3

    .line 6
    if-nez p3, :cond_1

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;->getUser()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    invoke-static {}, Ll/eb20;->a()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {p3, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_0

    .line 37
    .line 38
    invoke-static {v0, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result p3

    .line 42
    if-eqz p3, :cond_1

    .line 43
    .line 44
    :cond_0
    const/4 p0, 0x0

    .line 45
    return-object p0

    .line 46
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;->getTempdata()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getId()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;->getUser()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;->getManager()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;->getTempdata()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    move-object v0, p0

    .line 67
    move-object v1, p1

    .line 68
    invoke-virtual/range {v0 .. v5}, Ll/mq2;->n(Ljava/lang/String;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.room.block"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/zzr;->A(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic w(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/zzr;->B(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic x(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/zzr;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Block;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
