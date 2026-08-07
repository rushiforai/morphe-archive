.class public Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntrySignIn;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VText;

.field public d:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntrySignIn;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/uun;->a(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntrySignIn;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s(Ll/oun;Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntrySignIn;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    const-string v1, "https://auto.tancdn.com/v1/raw/4801806a-4d91-4fa8-a2e3-375c878375a410.so"

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->title:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntrySignIn;->c:Lv/VText;

    .line 18
    .line 19
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->title:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->description:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntrySignIn;->d:Lv/VText;

    .line 33
    .line 34
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->description:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    invoke-virtual {p1}, Ll/oun;->J3()V

    .line 40
    .line 41
    .line 42
    const-string p0, "unknown_"

    .line 43
    .line 44
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const/4 p2, 0x0

    .line 49
    invoke-virtual {p1, p0, p2}, Ll/oun;->D3(Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;I)V

    .line 50
    .line 51
    .line 52
    return-void
.end method
