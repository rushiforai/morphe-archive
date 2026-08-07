.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/WealthLevelView;
.super Lv/VDraweeView;
.source "SourceFile"


# instance fields
.field public o:Lcom/p1/mobile/putong/data/UserWealthGradeConfig;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VDraweeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/WealthLevelView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/WealthLevelView;->w(Landroid/view/View;)V

    return-void
.end method

.method private v()V
    .locals 1

    .line 1
    new-instance v0, Ll/hqp0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/hqp0;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/WealthLevelView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/WealthLevelView;->o:Lcom/p1/mobile/putong/data/UserWealthGradeConfig;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->wealthGradeDesc:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/WealthLevelView;->o:Lcom/p1/mobile/putong/data/UserWealthGradeConfig;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->wealthGradeDesc:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/gqp0;->e(Landroid/view/View;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
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
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/WealthLevelView;->v()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public x(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 6
    .line 7
    if-eqz v1, :cond_2

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 10
    .line 11
    if-eqz v1, :cond_2

    .line 12
    .line 13
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_2

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 40
    .line 41
    if-nez v1, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 53
    .line 54
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 55
    .line 56
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideMomentsWealthTag:Ljava/lang/Boolean;

    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 70
    .line 71
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 72
    .line 73
    long-to-int p1, v2

    .line 74
    invoke-interface {v1, p1, v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Gj(IZ)Lcom/p1/mobile/putong/data/UserWealthGradeConfig;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/WealthLevelView;->o:Lcom/p1/mobile/putong/data/UserWealthGradeConfig;

    .line 79
    .line 80
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->wealthIconUrl:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-nez p1, :cond_2

    .line 87
    .line 88
    const/4 p1, 0x1

    .line 89
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/WealthLevelView;->o:Lcom/p1/mobile/putong/data/UserWealthGradeConfig;

    .line 93
    .line 94
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->wealthIconUrl:Ljava/lang/String;

    .line 95
    .line 96
    const/high16 v0, 0x41600000    # 14.0f

    .line 97
    .line 98
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    invoke-static {p1, p0, v0}, Ll/gqp0;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 103
    .line 104
    .line 105
    :cond_2
    :goto_0
    return-void
.end method
