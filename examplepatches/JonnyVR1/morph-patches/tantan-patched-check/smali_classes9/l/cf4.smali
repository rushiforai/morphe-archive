.class public Ll/cf4;
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
    .locals 0
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
    const/4 p0, 0x0

    .line 2
    new-array p0, p0, [Ljava/lang/String;

    .line 3
    .line 4
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
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
    const-string p0, "liveRevenueCampaignVip"

    .line 2
    .line 3
    return-object p0
.end method
