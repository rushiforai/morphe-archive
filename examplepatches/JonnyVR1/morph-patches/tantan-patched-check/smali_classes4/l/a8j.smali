.class public Ll/a8j;
.super Ll/em2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/em2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/oql;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/a8j;->o(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/widget/FrameLayout;ILandroid/content/Context;)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Ll/em2;->c(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/widget/FrameLayout;ILandroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    check-cast p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomThemeAnswerView;

    .line 5
    .line 6
    iget-object p3, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomThemeAnswerView;->c:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 7
    .line 8
    invoke-virtual {p0, p3, p1, p4}, Ll/em2;->k(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;I)V

    .line 9
    .line 10
    .line 11
    iget-object p3, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomThemeAnswerView;->e:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 12
    .line 13
    invoke-virtual {p0, p3, p1, p4}, Ll/em2;->m(Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 19
    .line 20
    sget-object p3, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->THEME_CARD:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 21
    .line 22
    if-ne p0, p3, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    :goto_0
    iget-object p3, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomThemeAnswerView;->c:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 28
    .line 29
    invoke-static {p3, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object p3, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomThemeAnswerView;->e:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 33
    .line 34
    invoke-static {p3, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomThemeAnswerView;->Q(Ll/oql;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public d(Landroid/widget/FrameLayout$LayoutParams;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/em2;->d(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 2
    .line 3
    .line 4
    const/high16 p0, 0x41800000    # 16.0f

    .line 5
    .line 6
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 11
    .line 12
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 17
    .line 18
    return-void
.end method

.method public i()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public o(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/yti0;->b()Ll/yti0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/yti0;->h()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 p2, 0x0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return p2

    .line 13
    :cond_0
    invoke-static {}, Ll/yti0;->b()Ll/yti0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    if-nez p3, :cond_1

    .line 22
    .line 23
    return p2

    .line 24
    :cond_1
    invoke-virtual {p0}, Ll/yti0;->a()Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p3

    .line 32
    if-nez p3, :cond_2

    .line 33
    .line 34
    return p2

    .line 35
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    if-nez p3, :cond_3

    .line 40
    .line 41
    return p2

    .line 42
    :cond_3
    invoke-virtual {p0}, Ll/yti0;->h()Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-nez p0, :cond_5

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isThemeCard:Z

    .line 53
    .line 54
    if-nez p0, :cond_5

    .line 55
    .line 56
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z0:Ll/uab;

    .line 59
    .line 60
    iget-object p0, p0, Ll/uab;->W:Ll/jxd0;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    check-cast p0, Ljava/lang/Boolean;

    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-eqz p0, :cond_4

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    return p2

    .line 76
    :cond_5
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isThemeCard:Z

    .line 81
    .line 82
    if-eqz p0, :cond_7

    .line 83
    .line 84
    iget-object p2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 85
    .line 86
    sget-object p3, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->THEME_CARD:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 87
    .line 88
    iput-object p3, p2, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 89
    .line 90
    invoke-static {}, Ll/yti0;->b()Ll/yti0;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-virtual {p2}, Ll/yti0;->h()Z

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    if-eqz p2, :cond_6

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result p2

    .line 108
    if-eqz p2, :cond_6

    .line 109
    .line 110
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 115
    .line 116
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result p2

    .line 120
    if-eqz p2, :cond_6

    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 127
    .line 128
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Settings;->omsSetting:Lcom/p1/mobile/putong/data/OmsSetting;

    .line 129
    .line 130
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result p2

    .line 134
    if-eqz p2, :cond_6

    .line 135
    .line 136
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 141
    .line 142
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Settings;->omsSetting:Lcom/p1/mobile/putong/data/OmsSetting;

    .line 143
    .line 144
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OmsSetting;->themeView:Lcom/p1/mobile/putong/data/ThemeView;

    .line 145
    .line 146
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result p2

    .line 150
    if-eqz p2, :cond_6

    .line 151
    .line 152
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 153
    .line 154
    .line 155
    move-result-object p2

    .line 156
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 157
    .line 158
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Settings;->omsSetting:Lcom/p1/mobile/putong/data/OmsSetting;

    .line 159
    .line 160
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OmsSetting;->themeView:Lcom/p1/mobile/putong/data/ThemeView;

    .line 161
    .line 162
    iget-object p2, p2, Lcom/p1/mobile/putong/data/ThemeView;->icon:Ljava/lang/String;

    .line 163
    .line 164
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 165
    .line 166
    .line 167
    move-result p2

    .line 168
    if-nez p2, :cond_6

    .line 169
    .line 170
    const/high16 p2, 0x43220000    # 162.0f

    .line 171
    .line 172
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 173
    .line 174
    .line 175
    move-result p2

    .line 176
    invoke-virtual {p1, p3, p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->w(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;I)V

    .line 177
    .line 178
    .line 179
    return p0

    .line 180
    :cond_6
    const/high16 p2, 0x42a00000    # 80.0f

    .line 181
    .line 182
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 183
    .line 184
    .line 185
    move-result p2

    .line 186
    invoke-virtual {p1, p3, p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->w(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;I)V

    .line 187
    .line 188
    .line 189
    :cond_7
    return p0
.end method
