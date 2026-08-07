.class public Ll/twd0;
.super Ll/yr2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/yr2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ll/hzc0;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;",
            "Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;",
            "Ll/hzc0;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p2, p3, Ll/hzc0;->d:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getUserId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/4 p2, 0x0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    new-array p0, p2, [Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    sget-object p0, Ll/htd0;->b:Ll/htd0;

    .line 28
    .line 29
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Ll/jfv;

    .line 34
    .line 35
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Ll/jfv;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    iget-object p3, p3, Ll/hzc0;->d:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 46
    .line 47
    if-eqz p3, :cond_1

    .line 48
    .line 49
    if-eqz p0, :cond_1

    .line 50
    .line 51
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getExtInfo()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getSenderCityID()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserLiveState;->cityId:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {p0, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_1

    .line 68
    .line 69
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->url:Ljava/lang/String;

    .line 70
    .line 71
    filled-new-array {p0}, [Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0

    .line 80
    :cond_1
    new-array p0, p2, [Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0
.end method

.method public f(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/util/List;Ll/hzc0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/suf0;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ll/hzc0;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 p4, 0x0

    .line 2
    invoke-interface {p3, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p3

    .line 6
    check-cast p3, Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, p3}, Ll/yr2;->d(Ll/suf0;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "sameCityLable"

    .line 2
    .line 3
    return-object p0
.end method
