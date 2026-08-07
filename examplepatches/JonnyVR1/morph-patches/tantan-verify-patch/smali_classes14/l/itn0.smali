.class public Ll/itn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ftn0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v(Ll/m4s;)V
    .locals 1

    .line 1
    sget-object v0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/fk3;->M(Ll/m4s;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;)V
    .locals 1

    .line 1
    sget-object v0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/fk3;->N(Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()Ljava/util/HashMap;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vwt;->c6()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;->follow:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyleType;

    .line 16
    .line 17
    const-string v2, "BigCard"

    .line 18
    .line 19
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const-string v3, "type_small_card"

    .line 24
    .line 25
    const-string v4, "type_big_card"

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    move-object v1, v4

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    move-object v1, v3

    .line 32
    :goto_0
    const-string v5, "page_follow"

    .line 33
    .line 34
    invoke-virtual {v0, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;->nearby:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyleType;

    .line 38
    .line 39
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    move-object v1, v4

    .line 46
    goto :goto_1

    .line 47
    :cond_2
    move-object v1, v3

    .line 48
    :goto_1
    const-string v5, "page_nearby"

    .line 49
    .line 50
    invoke-virtual {v0, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;->photo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyleType;

    .line 54
    .line 55
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_3

    .line 60
    .line 61
    move-object v3, v4

    .line 62
    :cond_3
    const-string p0, "page_photo"

    .line 63
    .line 64
    invoke-virtual {v0, p0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    return-object v0
.end method

.method public b()V
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/j6t;->d()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-static {}, Ll/lwk0;->b()Ll/lwk0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/lwk0;->a()V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/lti;->d()Ll/lti;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/lti;->c()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public c()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/wft;->e()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/wft;->c()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public d(Landroid/content/Context;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationEntryAct;->Y1(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->Q(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p2, p4}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p0, p1, p2}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public f()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/fk3;->p()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public g(Landroid/view/View;Lcom/p1/mobile/putong/data/PushMessageCustom;Ll/x20;)V
    .locals 0

    .line 1
    return-void
.end method

.method public h(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->k()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p0, p1, p2}, Ll/j6t;->b(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public j(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    const/4 p0, 0x3

    .line 2
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/vvn;->c()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance p1, Ll/htn0;

    .line 17
    .line 18
    invoke-direct {p1}, Ll/htn0;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {p1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public k()Ll/m4s;
    .locals 0

    .line 1
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/fk3;->n()Ll/m4s;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public l(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/hyn0;->b(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/fk3;->r()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public n(Landroid/content/Context;)V
    .locals 1

    .line 1
    const-string p0, "voice_favorite_chat_rooms"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->Z1(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public o(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlVoiceCenterApiProvider;->getVoiceActivitiesChatData()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Ll/gtn0;

    .line 10
    .line 11
    invoke-direct {p1}, Ll/gtn0;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/zh0;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/zh0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {p1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p2, p5}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const/4 p3, 0x1

    .line 20
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->Q(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2, p4}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->z(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p0, p1, p2}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public q()Z
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/vwt;->X3()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public r(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/h3g0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s(Lcom/p1/mobile/android/app/Act;)Landroid/view/View;
    .locals 0

    .line 1
    new-instance p0, Landroid/view/View;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public t()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/m4s;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/fk3;->o()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public u(Lcom/p1/mobile/android/app/Act;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/bjo0;->d(Lcom/p1/mobile/android/app/Act;Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
