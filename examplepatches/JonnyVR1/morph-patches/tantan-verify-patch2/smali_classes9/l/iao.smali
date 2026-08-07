.class public Ll/iao;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;",
        "Ll/z3j0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/wbg0;Ll/zod;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wbg0<",
            "Ll/z3j0;",
            "Ll/z3j0;",
            ">;",
            "Ll/zod;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/jk2;-><init>(Ll/wbg0;Ll/zod;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;)Ll/z3j0;
    .locals 3

    .line 1
    iget-object p1, p0, Ll/mq2;->c:Ll/zod;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/zod;->d()Ll/m500;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getTemplate()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;->getId()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p1, v0}, Ll/m500;->f(I)Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const/4 v0, 0x0

    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_0
    invoke-static {}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->newBuilder()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getTemplate()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;->getId()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;->setId(I)Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;->getTemplate()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$TemplateData;->getFieldsList()Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;->addAllFields(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 56
    .line 57
    iget-object p0, p0, Ll/mq2;->c:Ll/zod;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/zod;->d()Ll/m500;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;->format:Ljava/util/List;

    .line 64
    .line 65
    invoke-virtual {p0, v1, p1, v0}, Ll/m500;->d(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ljava/util/List;Ll/hzc0;)Landroid/text/SpannableStringBuilder;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    new-instance p1, Ll/z3j0;

    .line 70
    .line 71
    invoke-direct {p1, p0, p2}, Ll/z3j0;-><init>(Landroid/text/SpannableStringBuilder;Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;)V

    .line 72
    .line 73
    .line 74
    return-object p1
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.intl.giftLeaderboard.topEffect"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/iao;->B(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic z(Ljava/lang/String;Lcom/google/protobuf/q;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/iao;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardTopEffect;)Ll/z3j0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
