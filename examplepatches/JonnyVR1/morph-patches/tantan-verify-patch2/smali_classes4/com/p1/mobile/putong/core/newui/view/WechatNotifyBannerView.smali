.class public Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Landroid/widget/Space;

.field public f:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/WechatNotifySetting;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/WechatNotifySetting;->wechatLaunch:Lcom/p1/mobile/putong/core/data/WechatMicroProgramLaunchInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object p1, Ll/c70;->INSTANCE:Ll/c70;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/WechatMicroProgramLaunchInfo;->userName:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/WechatMicroProgramLaunchInfo;->path:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, v0, p0}, Ll/c70;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    const-string p0, "e_open_wechat_notification"

    .line 15
    .line 16
    const-string p1, "p_messages_view"

    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/nvp0;->a(Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/core/data/WechatNotifySetting;Ll/x20;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->eg()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const-string v1, "\u4ed6"

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->N8()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const-string v2, "\u5979"

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    :cond_1
    move-object v1, v2

    .line 35
    goto :goto_0

    .line 36
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;->c:Lv/VText;

    .line 51
    .line 52
    const-string v2, "\u5728\u5fae\u4fe1\u4e0a\u63a5\u6536\u901a\u77e5\uff0c\u4e0d\u9519\u8fc7%s\u7684\u6d88\u606f\uff0c"

    .line 53
    .line 54
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    new-instance v0, Ll/lvp0;

    .line 66
    .line 67
    invoke-direct {v0, p1}, Ll/lvp0;-><init>(Lcom/p1/mobile/putong/core/data/WechatNotifySetting;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;->f:Lv/VImage;

    .line 74
    .line 75
    new-instance p1, Ll/mvp0;

    .line 76
    .line 77
    invoke-direct {p1, p2}, Ll/mvp0;-><init>(Ll/x20;)V

    .line 78
    .line 79
    .line 80
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    const-string p0, "e_open_wechat_notification"

    .line 2
    .line 3
    const-string v0, "p_messages_view"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;->c:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    const/4 v3, 0x1

    .line 15
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;->d:Lv/VText;

    .line 19
    .line 20
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/gra;->z()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/WechatNotifyBannerView;->f:Lv/VImage;

    .line 34
    .line 35
    sget v0, Ll/dbc0;->tg:I

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method
