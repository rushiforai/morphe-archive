.class public Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Landroid/view/ViewStub;

.field public c:Landroid/view/ViewStub;

.field public d:Landroid/view/View;

.field public e:Landroid/view/View;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;


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
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->i(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;Lcom/p1/mobile/putong/core/data/MessageTipsContent;Ljava/lang/String;Ll/pol;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->l(Lcom/p1/mobile/putong/core/data/MessageTipsContent;Ljava/lang/String;Ll/pol;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->k(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->j(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic f(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public g()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public getRealRenderView()Landroid/view/View;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public final h(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "instantChat"

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->f:Lv/VText;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string p1, "\u89e3\u9501\u9ed1\u91d1\u4f1a\u5458\uff0c\u7acb\u5373\u4e0e\u5979\u7545\u804a"

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string p1, "\u89e3\u9501\u9ed1\u91d1\u4f1a\u5458\uff0c\u7acb\u5373\u4e0e\u4ed6\u7545\u804a"

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic j(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->g()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v0, v1, p1}, Ll/r97;->B1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->g()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 21
    .line 22
    .line 23
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->g()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ll/jdk;

    .line 14
    .line 15
    invoke-direct {v2, p0, p1}, Ll/jdk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;Lcom/p1/mobile/putong/data/User;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {v0, v1, p1, v2}, Ll/r97;->V(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/core/data/MessageTipsContent;Ljava/lang/String;Ll/pol;Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {p4}, Ll/joa;->y4()Lrx/c;

    .line 6
    .line 7
    .line 8
    iget-object p4, p1, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleId:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p4

    .line 14
    if-nez p4, :cond_1

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleId:Ljava/lang/String;

    .line 17
    .line 18
    const-string p4, "other_user_id"

    .line 19
    .line 20
    invoke-static {p4, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p4

    .line 24
    invoke-static {}, Ll/joa;->G3()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    const-string v0, "1"

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 v0, 0x0

    .line 34
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    :goto_0
    const-string v1, "is_blackgold"

    .line 39
    .line 40
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    filled-new-array {p4, v0}, [Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object p4

    .line 48
    const-string v0, "p_kankan_chat_popup"

    .line 49
    .line 50
    invoke-static {p1, v0, p4}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    invoke-static {}, Ll/joa;->G3()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_2

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->g()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 66
    .line 67
    invoke-virtual {p4, p2}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-virtual {p2}, Lrx/c;->first()Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    invoke-interface {p3, p1, p2}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    new-instance p2, Ll/hdk;

    .line 80
    .line 81
    invoke-direct {p2, p0}, Ll/hdk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;)V

    .line 82
    .line 83
    .line 84
    new-instance p0, Ll/idk;

    .line 85
    .line 86
    invoke-direct {p0}, Ll/idk;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {p1}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->g()Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    const-string p3, "p_chat_greet,odiamond_sayhi"

    .line 110
    .line 111
    invoke-interface {p1, p0, p2, p3}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->Do(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/core/data/Message;ILl/pol;Ll/hgm;)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->a:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->d:Landroid/view/View;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->d:Landroid/view/View;

    .line 16
    .line 17
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->g:Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;

    .line 21
    .line 22
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_1

    .line 27
    .line 28
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->g:Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;

    .line 29
    .line 30
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    const/4 v0, 0x1

    .line 38
    if-eqz p2, :cond_3

    .line 39
    .line 40
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 41
    .line 42
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    if-eqz p2, :cond_3

    .line 47
    .line 48
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 49
    .line 50
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageExtData;->greetingTips:Lcom/p1/mobile/putong/core/data/MessageTips;

    .line 51
    .line 52
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    if-eqz p2, :cond_3

    .line 57
    .line 58
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 59
    .line 60
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageExtData;->greetingTips:Lcom/p1/mobile/putong/core/data/MessageTips;

    .line 61
    .line 62
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageTips;->selfShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 63
    .line 64
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    if-eqz p2, :cond_3

    .line 69
    .line 70
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 71
    .line 72
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageExtData;->greetingTips:Lcom/p1/mobile/putong/core/data/MessageTips;

    .line 73
    .line 74
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageTips;->selfShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 75
    .line 76
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->style:Ljava/lang/String;

    .line 77
    .line 78
    const-string v1, "sendPhoto"

    .line 79
    .line 80
    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    if-eqz p2, :cond_3

    .line 85
    .line 86
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->g:Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;

    .line 87
    .line 88
    if-nez p2, :cond_2

    .line 89
    .line 90
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->c:Landroid/view/ViewStub;

    .line 91
    .line 92
    invoke-virtual {p2}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    check-cast p2, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;

    .line 97
    .line 98
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->g:Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;

    .line 99
    .line 100
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->g:Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;

    .line 101
    .line 102
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->g:Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetGuidePic;->O(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_3
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 114
    .line 115
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p2

    .line 119
    if-eqz p2, :cond_7

    .line 120
    .line 121
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 122
    .line 123
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageExtData;->greetingTips:Lcom/p1/mobile/putong/core/data/MessageTips;

    .line 124
    .line 125
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    if-eqz p2, :cond_7

    .line 130
    .line 131
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 132
    .line 133
    .line 134
    move-result p2

    .line 135
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 136
    .line 137
    if-eqz p2, :cond_5

    .line 138
    .line 139
    iget-object p2, v1, Lcom/p1/mobile/putong/core/data/MessageExtData;->greetingTips:Lcom/p1/mobile/putong/core/data/MessageTips;

    .line 140
    .line 141
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageTips;->selfShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 142
    .line 143
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result p2

    .line 147
    if-eqz p2, :cond_7

    .line 148
    .line 149
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 150
    .line 151
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageExtData;->greetingTips:Lcom/p1/mobile/putong/core/data/MessageTips;

    .line 152
    .line 153
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageTips;->selfShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 154
    .line 155
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    .line 156
    .line 157
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 158
    .line 159
    .line 160
    move-result p2

    .line 161
    if-nez p2, :cond_7

    .line 162
    .line 163
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 164
    .line 165
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageExtData;->greetingTips:Lcom/p1/mobile/putong/core/data/MessageTips;

    .line 166
    .line 167
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageTips;->selfShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 168
    .line 169
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->style:Ljava/lang/String;

    .line 170
    .line 171
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->h(Ljava/lang/String;)Z

    .line 172
    .line 173
    .line 174
    move-result p2

    .line 175
    if-eqz p2, :cond_4

    .line 176
    .line 177
    invoke-virtual {p0, p1, p3, p4}, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->n(Lcom/p1/mobile/putong/core/data/Message;Ll/pol;Ll/hgm;)V

    .line 178
    .line 179
    .line 180
    return-void

    .line 181
    :cond_4
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 182
    .line 183
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageExtData;->greetingTips:Lcom/p1/mobile/putong/core/data/MessageTips;

    .line 184
    .line 185
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageTips;->selfShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 186
    .line 187
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->style:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->p(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->a:Lv/VText;

    .line 193
    .line 194
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 195
    .line 196
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageExtData;->greetingTips:Lcom/p1/mobile/putong/core/data/MessageTips;

    .line 197
    .line 198
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageTips;->selfShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 199
    .line 200
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    .line 201
    .line 202
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 203
    .line 204
    .line 205
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->a:Lv/VText;

    .line 206
    .line 207
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 208
    .line 209
    .line 210
    return-void

    .line 211
    :cond_5
    iget-object p2, v1, Lcom/p1/mobile/putong/core/data/MessageExtData;->greetingTips:Lcom/p1/mobile/putong/core/data/MessageTips;

    .line 212
    .line 213
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageTips;->otherShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 214
    .line 215
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result p2

    .line 219
    if-eqz p2, :cond_7

    .line 220
    .line 221
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 222
    .line 223
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageExtData;->greetingTips:Lcom/p1/mobile/putong/core/data/MessageTips;

    .line 224
    .line 225
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageTips;->otherShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 226
    .line 227
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    .line 228
    .line 229
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 230
    .line 231
    .line 232
    move-result p2

    .line 233
    if-nez p2, :cond_7

    .line 234
    .line 235
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 236
    .line 237
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageExtData;->greetingTips:Lcom/p1/mobile/putong/core/data/MessageTips;

    .line 238
    .line 239
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageTips;->selfShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 240
    .line 241
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->style:Ljava/lang/String;

    .line 242
    .line 243
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->h(Ljava/lang/String;)Z

    .line 244
    .line 245
    .line 246
    move-result p2

    .line 247
    if-eqz p2, :cond_6

    .line 248
    .line 249
    invoke-virtual {p0, p1, p3, p4}, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->n(Lcom/p1/mobile/putong/core/data/Message;Ll/pol;Ll/hgm;)V

    .line 250
    .line 251
    .line 252
    return-void

    .line 253
    :cond_6
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 254
    .line 255
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageExtData;->greetingTips:Lcom/p1/mobile/putong/core/data/MessageTips;

    .line 256
    .line 257
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageTips;->otherShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 258
    .line 259
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->style:Ljava/lang/String;

    .line 260
    .line 261
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->p(Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->a:Lv/VText;

    .line 265
    .line 266
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 267
    .line 268
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageExtData;->greetingTips:Lcom/p1/mobile/putong/core/data/MessageTips;

    .line 269
    .line 270
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageTips;->otherShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 271
    .line 272
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    .line 273
    .line 274
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 275
    .line 276
    .line 277
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->a:Lv/VText;

    .line 278
    .line 279
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 280
    .line 281
    .line 282
    :cond_7
    return-void
.end method

.method public final n(Lcom/p1/mobile/putong/core/data/Message;Ll/pol;Ll/hgm;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->d:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->b:Landroid/view/ViewStub;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->d:Landroid/view/View;

    .line 13
    .line 14
    sget v2, Ll/edc0;->V2:I

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->e:Landroid/view/View;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->d:Landroid/view/View;

    .line 23
    .line 24
    sget v2, Ll/edc0;->W2:I

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VText;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->f:Lv/VText;

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->d:Landroid/view/View;

    .line 35
    .line 36
    sget v2, Ll/edc0;->X2:I

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lv/VText;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 49
    .line 50
    .line 51
    :cond_0
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 58
    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/MessageExtData;->greetingTips:Lcom/p1/mobile/putong/core/data/MessageTips;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageTips;->selfShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 64
    .line 65
    :goto_0
    move-object v4, v0

    .line 66
    goto :goto_1

    .line 67
    :cond_1
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/MessageExtData;->greetingTips:Lcom/p1/mobile/putong/core/data/MessageTips;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageTips;->otherShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :goto_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_2

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 79
    .line 80
    :goto_2
    move-object v2, p0

    .line 81
    move-object v5, p1

    .line 82
    move-object v6, p2

    .line 83
    move-object v7, p3

    .line 84
    goto :goto_3

    .line 85
    :cond_2
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :goto_3
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->o(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageTipsContent;Ljava/lang/String;Ll/pol;Ll/hgm;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, v2, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->d:Landroid/view/View;

    .line 92
    .line 93
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final o(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageTipsContent;Ljava/lang/String;Ll/pol;Ll/hgm;)V
    .locals 2

    .line 1
    invoke-virtual {p5, p1}, Ll/hgm;->a(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p5, p1}, Ll/hgm;->b(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleId:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->statsModuleId:Ljava/lang/String;

    .line 19
    .line 20
    const-string p5, "other_user_id"

    .line 21
    .line 22
    invoke-static {p5, p3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p5

    .line 26
    invoke-static {}, Ll/joa;->G3()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    const-string v0, "1"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v0, 0x0

    .line 36
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    :goto_0
    const-string v1, "is_blackgold"

    .line 41
    .line 42
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    filled-new-array {p5, v0}, [Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p5

    .line 50
    const-string v0, "p_kankan_chat_popup"

    .line 51
    .line 52
    invoke-static {p1, v0, p5}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->g()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    sget-object p5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 60
    .line 61
    iget-object p5, p5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 62
    .line 63
    invoke-virtual {p5, p3}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object p5

    .line 67
    invoke-virtual {p5}, Lrx/c;->first()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p5

    .line 71
    invoke-interface {p4, p1, p5}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    new-instance p5, Ll/edk;

    .line 76
    .line 77
    invoke-direct {p5, p0}, Ll/edk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;)V

    .line 78
    .line 79
    .line 80
    new-instance v0, Ll/fdk;

    .line 81
    .line 82
    invoke-direct {v0}, Ll/fdk;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-static {p5, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 86
    .line 87
    .line 88
    move-result-object p5

    .line 89
    invoke-virtual {p1, p5}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->e:Landroid/view/View;

    .line 93
    .line 94
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_2

    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->e:Landroid/view/View;

    .line 101
    .line 102
    new-instance p5, Ll/gdk;

    .line 103
    .line 104
    invoke-direct {p5, p0, p2, p3, p4}, Ll/gdk;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;Lcom/p1/mobile/putong/core/data/MessageTipsContent;Ljava/lang/String;Ll/pol;)V

    .line 105
    .line 106
    .line 107
    invoke-static {p1, p5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 108
    .line 109
    .line 110
    :cond_2
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 9
    .line 10
    .line 11
    sget v0, Ll/edc0;->Q:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lv/VText;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->a:Lv/VText;

    .line 20
    .line 21
    sget v0, Ll/edc0;->K2:I

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/view/ViewStub;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->b:Landroid/view/ViewStub;

    .line 30
    .line 31
    sget v0, Ll/edc0;->f0:I

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Landroid/view/ViewStub;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->c:Landroid/view/ViewStub;

    .line 40
    .line 41
    return-void
.end method

.method public final p(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "blackDiamond"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->a:Lv/VText;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget v1, Ll/ibc0;->i0:I

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {v0, p1}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->a:Lv/VText;

    .line 29
    .line 30
    const-string v0, "#ffedd7a3"

    .line 31
    .line 32
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->a:Lv/VText;

    .line 40
    .line 41
    sget v0, Ll/qa00;->j:I

    .line 42
    .line 43
    sget v1, Ll/qa00;->e:I

    .line 44
    .line 45
    invoke-virtual {p1, v0, v1, v0, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->a:Lv/VText;

    .line 49
    .line 50
    sget p1, Ll/ibc0;->z5:I

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    const/4 p1, 0x0

    .line 57
    invoke-virtual {v0, p1, p1, p1, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->a:Lv/VText;

    .line 61
    .line 62
    const-string v1, "#4c000000"

    .line 63
    .line 64
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->a:Lv/VText;

    .line 72
    .line 73
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingItemRootLayout;->a:Lv/VText;

    .line 77
    .line 78
    sget p1, Ll/qa00;->j:I

    .line 79
    .line 80
    sget v0, Ll/qa00;->e:I

    .line 81
    .line 82
    invoke-virtual {p0, p1, v0, p1, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 83
    .line 84
    .line 85
    return-void
.end method
