.class public Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;
.super Lv/VLinear;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;
    }
.end annotation


# instance fields
.field public c:Lv/VText;

.field public d:Lcom/p1/mobile/putong/core/newui/main/view/LinearLayoutFixedLayout;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

.field public i:Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;

.field public j:Lv/VImage;

.field public k:Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;

.field public l:Landroid/widget/LinearLayout;

.field public m:Lv/VDraweeView;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Lv/VLinear;

.field public s:Lv/VDraweeView;

.field public t:Lv/VText;

.field public u:Lv/VText;

.field public v:Lv/VText;

.field public w:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->w:Z

    .line 6
    .line 7
    return-void
.end method

.method private f0(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->m:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/vq8;->b()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 15
    .line 16
    if-eqz p1, :cond_2

    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 45
    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideSwipeWealthTag:Ljava/lang/Boolean;

    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_2

    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 78
    .line 79
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 80
    .line 81
    iget p1, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->wealthGrade:I

    .line 82
    .line 83
    const/4 v1, 0x1

    .line 84
    invoke-interface {v0, p1, v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Gj(IZ)Lcom/p1/mobile/putong/data/UserWealthGradeConfig;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->wealthIconUrl:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-nez v0, :cond_2

    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->m:Lv/VDraweeView;

    .line 97
    .line 98
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->m:Lv/VDraweeView;

    .line 104
    .line 105
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->wealthIconUrl:Ljava/lang/String;

    .line 106
    .line 107
    new-instance v2, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$a;

    .line 108
    .line 109
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, v1, p1, v2}, Ll/fsb0;->M0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V

    .line 113
    .line 114
    .line 115
    :cond_2
    :goto_0
    return-void
.end method

.method private varargs setUsTagBg([Landroid/view/View;)V
    .locals 3

    .line 1
    array-length p0, p1

    .line 2
    const/4 v0, 0x0

    .line 3
    :goto_0
    if-ge v0, p0, :cond_1

    .line 4
    .line 5
    aget-object v1, p1, v0

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    sget v2, Ll/dbc0;->U2:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/gn4;->a(Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final Q(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ll/ina;->B3(Lcom/p1/mobile/putong/data/User;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 29
    .line 30
    invoke-static {p0}, Ll/q8g0;->Y(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/CharSequence;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    :cond_1
    :goto_0
    return-object p0
.end method

.method public final R(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 5

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    move-object p0, v1

    .line 21
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 24
    .line 25
    iget-boolean v2, v0, Lcom/p1/mobile/putong/data/Work;->active:Z

    .line 26
    .line 27
    if-eqz v2, :cond_8

    .line 28
    .line 29
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Work;->company:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_7

    .line 36
    .line 37
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 44
    .line 45
    const-string v2, "\u5176\u4ed6"

    .line 46
    .line 47
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    const-string v4, "\u5176\u5b83"

    .line 52
    .line 53
    if-nez v3, :cond_2

    .line 54
    .line 55
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_3

    .line 60
    .line 61
    :cond_2
    move-object v0, v1

    .line 62
    :cond_3
    invoke-static {p0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-nez v2, :cond_5

    .line 67
    .line 68
    invoke-static {p0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-eqz v2, :cond_4

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    move-object v1, p0

    .line 76
    :cond_5
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-nez p0, :cond_6

    .line 81
    .line 82
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-nez p0, :cond_6

    .line 87
    .line 88
    new-instance p0, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v0, " \u00b7 "

    .line 97
    .line 98
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    goto :goto_1

    .line 109
    :cond_6
    new-instance p0, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    :cond_7
    :goto_1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-nez v0, :cond_8

    .line 129
    .line 130
    return-object p0

    .line 131
    :cond_8
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_9

    .line 136
    .line 137
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 138
    .line 139
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 140
    .line 141
    invoke-virtual {v0, p1}, Ll/ina;->B3(Lcom/p1/mobile/putong/data/User;)Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-nez v0, :cond_9

    .line 146
    .line 147
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-nez v0, :cond_9

    .line 152
    .line 153
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 154
    .line 155
    const/4 p1, 0x0

    .line 156
    const/4 v0, 0x1

    .line 157
    const/4 v1, 0x0

    .line 158
    invoke-static {p0, v1, p1, v1, v0}, Ll/q8g0;->U(Lcom/p1/mobile/putong/data/Location;ZLandroid/text/style/CharacterStyle;ZZ)Ljava/lang/CharSequence;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    :cond_9
    return-object p0
.end method

.method public final S(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->Q(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 11
    .line 12
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    invoke-static {v0, v1, p1}, Ll/pzi0;->I(DZ)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    return-object p1

    .line 26
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string p0, " \u00b7 "

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public final T()Z
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->h:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->j:Lv/VImage;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->i:Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->m:Lv/VDraweeView;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->k:Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->n:Lv/VText;

    .line 12
    .line 13
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->o:Lv/VText;

    .line 14
    .line 15
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->p:Lv/VText;

    .line 16
    .line 17
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->q:Lv/VText;

    .line 18
    .line 19
    iget-object v9, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->u:Lv/VText;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->v:Lv/VText;

    .line 22
    .line 23
    const/16 v10, 0xb

    .line 24
    .line 25
    new-array v11, v10, [Landroid/view/View;

    .line 26
    .line 27
    const/4 v12, 0x0

    .line 28
    aput-object v0, v11, v12

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    aput-object v1, v11, v0

    .line 32
    .line 33
    const/4 v0, 0x2

    .line 34
    aput-object v2, v11, v0

    .line 35
    .line 36
    const/4 v0, 0x3

    .line 37
    aput-object v3, v11, v0

    .line 38
    .line 39
    const/4 v0, 0x4

    .line 40
    aput-object v4, v11, v0

    .line 41
    .line 42
    const/4 v0, 0x5

    .line 43
    aput-object v5, v11, v0

    .line 44
    .line 45
    const/4 v0, 0x6

    .line 46
    aput-object v6, v11, v0

    .line 47
    .line 48
    const/4 v0, 0x7

    .line 49
    aput-object v7, v11, v0

    .line 50
    .line 51
    const/16 v0, 0x8

    .line 52
    .line 53
    aput-object v8, v11, v0

    .line 54
    .line 55
    const/16 v0, 0x9

    .line 56
    .line 57
    aput-object v9, v11, v0

    .line 58
    .line 59
    const/16 v0, 0xa

    .line 60
    .line 61
    aput-object p0, v11, v0

    .line 62
    .line 63
    move p0, v12

    .line 64
    :goto_0
    if-ge v12, v10, :cond_0

    .line 65
    .line 66
    aget-object v0, v11, v12

    .line 67
    .line 68
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    or-int/2addr p0, v0

    .line 73
    add-int/lit8 v12, v12, 0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    return p0
.end method

.method public V()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->w:Z

    .line 2
    .line 3
    return p0
.end method

.method public W(Lcom/p1/mobile/putong/data/User;IZ)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;->b()Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->Z(Lcom/p1/mobile/putong/data/User;IZLcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public X(Lcom/p1/mobile/putong/data/User;IZLcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->Z(Lcom/p1/mobile/putong/data/User;IZLcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-static {p4}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;->a(Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final Y(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isBlackDiamondVIP()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->hideBlackDiamondTag()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->k:Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->k:Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->k0()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->k:Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public Z(Lcom/p1/mobile/putong/data/User;IZLcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;)V
    .locals 2

    .line 1
    iget-boolean p2, p4, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;->i:Z

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->l:Landroid/widget/LinearLayout;

    .line 7
    .line 8
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->e:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    :goto_0
    iget-boolean p2, p4, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;->b:Z

    .line 18
    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->S(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->R(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->c:Lv/VText;

    .line 31
    .line 32
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->c:Lv/VText;

    .line 36
    .line 37
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    const/4 v1, 0x1

    .line 42
    xor-int/2addr p2, v1

    .line 43
    invoke-static {v0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->Y(Lcom/p1/mobile/putong/data/User;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->e0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;)V

    .line 50
    .line 51
    .line 52
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->f0(Lcom/p1/mobile/putong/data/User;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->c0(Lcom/p1/mobile/putong/data/User;)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->p:Lv/VText;

    .line 59
    .line 60
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->n:Lv/VText;

    .line 64
    .line 65
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->n:Lv/VText;

    .line 69
    .line 70
    invoke-static {p2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    if-nez p2, :cond_3

    .line 75
    .line 76
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->p:Lv/VText;

    .line 77
    .line 78
    invoke-static {p2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    if-eqz p2, :cond_2

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_2
    move p2, p3

    .line 86
    goto :goto_3

    .line 87
    :cond_3
    :goto_2
    move p2, v1

    .line 88
    :goto_3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->w:Z

    .line 89
    .line 90
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->u:Lv/VText;

    .line 91
    .line 92
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->h0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p4

    .line 96
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->d0(Lcom/p1/mobile/putong/data/User;)V

    .line 100
    .line 101
    .line 102
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->u:Lv/VText;

    .line 103
    .line 104
    invoke-virtual {p2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 105
    .line 106
    .line 107
    move-result-object p4

    .line 108
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 109
    .line 110
    .line 111
    move-result p4

    .line 112
    if-nez p4, :cond_4

    .line 113
    .line 114
    invoke-static {}, Ll/r43;->b()Z

    .line 115
    .line 116
    .line 117
    move-result p4

    .line 118
    if-nez p4, :cond_4

    .line 119
    .line 120
    move p3, v1

    .line 121
    :cond_4
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    invoke-static {}, Ll/gra;->N3()Z

    .line 125
    .line 126
    .line 127
    move-result p2

    .line 128
    if-eqz p2, :cond_5

    .line 129
    .line 130
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->u:Lv/VText;

    .line 131
    .line 132
    sget p3, Ll/dbc0;->T2:I

    .line 133
    .line 134
    invoke-virtual {p2, p3}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 135
    .line 136
    .line 137
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->d:Lcom/p1/mobile/putong/core/newui/main/view/LinearLayoutFixedLayout;

    .line 138
    .line 139
    sget p3, Ll/qa00;->d:I

    .line 140
    .line 141
    invoke-static {p2, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 142
    .line 143
    .line 144
    :cond_5
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 145
    .line 146
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 147
    .line 148
    invoke-virtual {p2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 149
    .line 150
    .line 151
    move-result-object p2

    .line 152
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->b0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 153
    .line 154
    .line 155
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->d:Lcom/p1/mobile/putong/core/newui/main/view/LinearLayoutFixedLayout;

    .line 156
    .line 157
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->T()Z

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 162
    .line 163
    .line 164
    return-void
.end method

.method public a0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->g:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v2, Ll/dbc0;->A2:I

    .line 12
    .line 13
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    const/4 v4, 0x0

    .line 26
    invoke-virtual {v0, v4, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 27
    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->g:Lv/VText;

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    invoke-virtual {v2, v0, v3, v3, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->d:Lcom/p1/mobile/putong/core/newui/main/view/LinearLayoutFixedLayout;

    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isNonBinary()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->g:Lv/VText;

    .line 45
    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Rf:I

    .line 49
    .line 50
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    if-eqz p2, :cond_1

    .line 63
    .line 64
    sget p2, Lcom/p1/mobile/putong/core/R$string;->ld:I

    .line 65
    .line 66
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    goto :goto_0

    .line 71
    :cond_1
    sget p2, Lcom/p1/mobile/putong/core/R$string;->kd:I

    .line 72
    .line 73
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final b0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 4
    .line 5
    const-string v1, "facebook"

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->hideMutualContacts()Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-nez p2, :cond_1

    .line 24
    .line 25
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 28
    .line 29
    iget-object p2, p2, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->lookups:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-nez p2, :cond_1

    .line 36
    .line 37
    const/4 p2, 0x1

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 p2, 0x0

    .line 40
    :goto_0
    if-eqz p2, :cond_2

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->v:Lv/VText;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Y0:I

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 53
    .line 54
    invoke-static {p1}, Ll/e1b;->K0(Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {v1, v2, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->v:Lv/VText;

    .line 70
    .line 71
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final c0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/nrb0;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->o:Lv/VText;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final d0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->f:Lv/VText;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final e0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->j:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->i:Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->h:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-boolean v0, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;->d:Z

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/4 v3, 0x1

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVipWithMe()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->j:Lv/VImage;

    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->j:Lv/VImage;

    .line 41
    .line 42
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->j:Lv/VImage;

    .line 54
    .line 55
    invoke-interface {v0, p1, v1}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->ro(Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;)V

    .line 56
    .line 57
    .line 58
    :goto_0
    iget-boolean p2, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$b;->f:Z

    .line 59
    .line 60
    if-eqz p2, :cond_3

    .line 61
    .line 62
    invoke-static {}, Ll/xu90;->d()Ll/xu90;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-virtual {p2, p1}, Ll/xu90;->g(Lcom/p1/mobile/putong/data/User;)Z

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    if-eqz p2, :cond_3

    .line 71
    .line 72
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->j:Lv/VImage;

    .line 73
    .line 74
    invoke-static {p2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    if-nez p2, :cond_3

    .line 79
    .line 80
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->j:Lv/VImage;

    .line 81
    .line 82
    invoke-static {p2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 86
    .line 87
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-interface {p2, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ve(Lcom/p1/mobile/putong/data/User;)Z

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    if-eqz p2, :cond_1

    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->j:Lv/VImage;

    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    sget p2, Ll/dbc0;->Sc:I

    .line 104
    .line 105
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p0, p1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_1
    invoke-static {}, Ll/d79;->T()Z

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    if-eqz p2, :cond_2

    .line 118
    .line 119
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    if-eqz p1, :cond_2

    .line 124
    .line 125
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->j:Lv/VImage;

    .line 126
    .line 127
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    sget p2, Ll/dbc0;->Rc:I

    .line 132
    .line 133
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {p0, p1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->j:Lv/VImage;

    .line 142
    .line 143
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUtils;->g()I

    .line 148
    .line 149
    .line 150
    move-result p2

    .line 151
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    invoke-virtual {p0, p1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 156
    .line 157
    .line 158
    :cond_3
    return-void
.end method

.method public g0()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->u:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->m:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->n:Lv/VText;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->o:Lv/VText;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->p:Lv/VText;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->q:Lv/VText;

    .line 12
    .line 13
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->v:Lv/VText;

    .line 14
    .line 15
    const/4 v7, 0x7

    .line 16
    new-array v7, v7, [Landroid/view/View;

    .line 17
    .line 18
    const/4 v8, 0x0

    .line 19
    aput-object v0, v7, v8

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    aput-object v1, v7, v0

    .line 23
    .line 24
    const/4 v0, 0x2

    .line 25
    aput-object v2, v7, v0

    .line 26
    .line 27
    const/4 v0, 0x3

    .line 28
    aput-object v3, v7, v0

    .line 29
    .line 30
    const/4 v0, 0x4

    .line 31
    aput-object v4, v7, v0

    .line 32
    .line 33
    const/4 v0, 0x5

    .line 34
    aput-object v5, v7, v0

    .line 35
    .line 36
    const/4 v0, 0x6

    .line 37
    aput-object v6, v7, v0

    .line 38
    .line 39
    invoke-direct {p0, v7}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->setUsTagBg([Landroid/view/View;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final h0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ll/r43;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lcom/p1/mobile/putong/data/BloodType;

    .line 35
    .line 36
    const-string v1, "UNKNOWN"

    .line 37
    .line 38
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-nez p0, :cond_0

    .line 43
    .line 44
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Lcom/p1/mobile/putong/data/BloodType;

    .line 57
    .line 58
    invoke-static {p0}, Ll/r43;->a(Lcom/p1/mobile/putong/data/BloodType;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0

    .line 63
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 66
    .line 67
    invoke-static {p0}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
