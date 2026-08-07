.class public Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;

.field public d:Lv/VDraweeView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/putong/core/ui/VText_Bold;


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

.method public static synthetic P(ZLcom/p1/mobile/putong/core/data/CommonTipBox;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-interface {p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->w()Z

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    if-nez p3, :cond_0

    .line 14
    .line 15
    const-string p0, "\u529f\u80fd\u5df2\u4e0b\u7ebf"

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    if-eqz p0, :cond_1

    .line 22
    .line 23
    const-string p3, "false"

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const-string p3, "true"

    .line 27
    .line 28
    :goto_0
    const-string v0, "is_profile_complete"

    .line 29
    .line 30
    invoke-static {v0, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    filled-new-array {p3}, [Ll/sfj0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    const-string v0, "e_chat_complete_profile"

    .line 39
    .line 40
    const-string v1, "p_chat_view"

    .line 41
    .line 42
    invoke-static {v0, v1, p3}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 43
    .line 44
    .line 45
    if-nez p0, :cond_2

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CommonTipBox;->schema:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-nez p0, :cond_3

    .line 55
    .line 56
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CommonTipBox;->schema:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {p2, p0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    :goto_1
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;Lcom/p1/mobile/putong/core/data/CommonTipBox;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;->S(Lcom/p1/mobile/putong/core/data/CommonTipBox;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method


# virtual methods
.method public final R(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/m4q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic S(Lcom/p1/mobile/putong/core/data/CommonTipBox;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0, p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Kq(Lcom/p1/mobile/putong/data/User;)Z

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    xor-int/lit8 v0, p3, 0x1

    .line 14
    .line 15
    if-nez p3, :cond_0

    .line 16
    .line 17
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CommonTipBox;->button:Ljava/lang/String;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CommonTipBox;->disabledButton:Ljava/lang/String;

    .line 21
    .line 22
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;->g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 27
    .line 28
    if-nez v2, :cond_2

    .line 29
    .line 30
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;->g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 34
    .line 35
    if-nez p3, :cond_1

    .line 36
    .line 37
    const-string v2, "#FE7E1D"

    .line 38
    .line 39
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    const-string v2, "#33000000"

    .line 48
    .line 49
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 54
    .line 55
    .line 56
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;->g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 57
    .line 58
    const/4 v2, 0x1

    .line 59
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_2
    const/4 v1, 0x0

    .line 64
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    :goto_2
    if-nez p3, :cond_3

    .line 68
    .line 69
    const-string p3, "false"

    .line 70
    .line 71
    goto :goto_3

    .line 72
    :cond_3
    const-string p3, "true"

    .line 73
    .line 74
    :goto_3
    const-string v1, "is_profile_complete"

    .line 75
    .line 76
    invoke-static {v1, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    filled-new-array {p3}, [Ll/sfj0$a;

    .line 81
    .line 82
    .line 83
    move-result-object p3

    .line 84
    const-string v1, "e_chat_complete_profile"

    .line 85
    .line 86
    const-string v2, "p_chat_view"

    .line 87
    .line 88
    invoke-static {v1, v2, p3}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;->g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 92
    .line 93
    new-instance p3, Ll/j4q;

    .line 94
    .line 95
    invoke-direct {p3, v0, p1, p2}, Ll/j4q;-><init>(ZLcom/p1/mobile/putong/core/data/CommonTipBox;Lcom/p1/mobile/android/app/Act;)V

    .line 96
    .line 97
    .line 98
    invoke-static {p0, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public T(Lcom/p1/mobile/android/app/Act;Ll/g900;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;->e:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 10
    .line 11
    .line 12
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_3

    .line 17
    .line 18
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->commonTipBox:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 40
    .line 41
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->commonTipBox:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    .line 42
    .line 43
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/CommonTipBox;->iconUrl:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_0

    .line 50
    .line 51
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;->d:Lv/VDraweeView;

    .line 54
    .line 55
    iget-object v2, p3, Lcom/p1/mobile/putong/core/data/CommonTipBox;->iconUrl:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/CommonTipBox;->title:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_1

    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;->e:Lv/VText;

    .line 69
    .line 70
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/CommonTipBox;->title:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/CommonTipBox;->subtitle:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_2

    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;->f:Lv/VText;

    .line 84
    .line 85
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/CommonTipBox;->subtitle:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {v0, v1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {p2, p1, v0}, Ll/l900;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    new-instance v0, Ll/i4q;

    .line 111
    .line 112
    invoke-direct {v0, p0, p3, p1}, Ll/i4q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;Lcom/p1/mobile/putong/core/data/CommonTipBox;Lcom/p1/mobile/android/app/Act;)V

    .line 113
    .line 114
    .line 115
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_3
    const/4 p1, 0x0

    .line 124
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;->R(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;->e:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Ll/g9c0;->g:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemCommonTipBox;->g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget v1, Ll/g9c0;->j:I

    .line 43
    .line 44
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method
