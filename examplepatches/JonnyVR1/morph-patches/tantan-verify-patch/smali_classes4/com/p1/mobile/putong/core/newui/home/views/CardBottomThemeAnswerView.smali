.class public Lcom/p1/mobile/putong/core/newui/home/views/CardBottomThemeAnswerView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

.field public d:Lv/VLinear;

.field public e:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

.field public f:Lv/VLinear;

.field public g:Lv/VDraweeView;

.field public h:Lv/VText;

.field public i:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cj4;->a(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomThemeAnswerView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Q(Ll/oql;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/yti0;->b()Ll/yti0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/yti0;->h()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ll/oql;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p1}, Ll/oql;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    invoke-interface {p1}, Ll/oql;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->omsSetting:Lcom/p1/mobile/putong/data/OmsSetting;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    invoke-interface {p1}, Ll/oql;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->omsSetting:Lcom/p1/mobile/putong/data/OmsSetting;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OmsSetting;->themeView:Lcom/p1/mobile/putong/data/ThemeView;

    .line 56
    .line 57
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    invoke-interface {p1}, Ll/oql;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->omsSetting:Lcom/p1/mobile/putong/data/OmsSetting;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OmsSetting;->themeView:Lcom/p1/mobile/putong/data/ThemeView;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ThemeView;->icon:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_0

    .line 80
    .line 81
    invoke-interface {p1}, Ll/oql;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomThemeAnswerView;->R(Lcom/p1/mobile/putong/data/User;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomThemeAnswerView;->f:Lv/VLinear;

    .line 90
    .line 91
    const/4 p1, 0x0

    .line 92
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final R(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomThemeAnswerView;->f:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomThemeAnswerView;->g:Lv/VDraweeView;

    .line 10
    .line 11
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->omsSetting:Lcom/p1/mobile/putong/data/OmsSetting;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OmsSetting;->themeView:Lcom/p1/mobile/putong/data/ThemeView;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ThemeView;->icon:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomThemeAnswerView;->h:Lv/VText;

    .line 23
    .line 24
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->omsSetting:Lcom/p1/mobile/putong/data/OmsSetting;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OmsSetting;->themeView:Lcom/p1/mobile/putong/data/ThemeView;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ThemeView;->title:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomThemeAnswerView;->i:Lv/VText;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->omsSetting:Lcom/p1/mobile/putong/data/OmsSetting;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OmsSetting;->themeView:Lcom/p1/mobile/putong/data/ThemeView;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ThemeView;->subTitle:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomThemeAnswerView;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
