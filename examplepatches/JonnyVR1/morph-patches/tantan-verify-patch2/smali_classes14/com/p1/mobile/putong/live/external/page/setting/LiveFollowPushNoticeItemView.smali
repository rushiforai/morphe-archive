.class public Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VText;

.field public f:Lv/VSwitch;

.field public g:Lcom/p1/mobile/putong/live/external/page/setting/a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/external/page/setting/b$a;Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;Lcom/p1/mobile/putong/live/external/page/setting/a;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;->isPushEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    xor-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    invoke-interface {p0, p2, p1}, Lcom/p1/mobile/putong/live/external/page/setting/b$a;->a(Lcom/p1/mobile/putong/live/external/page/setting/a;Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/ldc0;->k:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;->d:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/ldc0;->a1:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VText;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;->e:Lv/VText;

    .line 23
    .line 24
    sget v0, Ll/ldc0;->H1:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VSwitch;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;->f:Lv/VSwitch;

    .line 33
    .line 34
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/live/external/page/setting/a;Lcom/p1/mobile/putong/live/external/page/setting/b$a;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;->g:Lcom/p1/mobile/putong/live/external/page/setting/a;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/page/setting/a;->H()Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;->anchorAvatar:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;->d:Lv/VDraweeView;

    .line 18
    .line 19
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;->anchorAvatar:Ljava/lang/String;

    .line 20
    .line 21
    const-string v3, "context_common"

    .line 22
    .line 23
    invoke-static {v3, v1, v2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;->e:Lv/VText;

    .line 27
    .line 28
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;->anchorName:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const-string v2, ""

    .line 34
    .line 35
    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;->f:Lv/VSwitch;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;->isPushEnabled()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    .line 45
    .line 46
    .line 47
    new-instance v1, Ll/gfs;

    .line 48
    .line 49
    invoke-direct {v1, p2, v0, p1}, Ll/gfs;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/b$a;Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;Lcom/p1/mobile/putong/live/external/page/setting/a;)V

    .line 50
    .line 51
    .line 52
    invoke-static {p0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public z(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;->f:Lv/VSwitch;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;->g:Lcom/p1/mobile/putong/live/external/page/setting/a;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/page/setting/a;->H()Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;->g:Lcom/p1/mobile/putong/live/external/page/setting/a;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/setting/a;->H()Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;->setPushEnabled(Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method
