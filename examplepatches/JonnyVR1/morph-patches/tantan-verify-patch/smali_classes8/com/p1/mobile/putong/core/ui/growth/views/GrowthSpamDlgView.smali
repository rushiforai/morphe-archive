.class public Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;

.field public d:Lv/VFrame;

.field public e:Lv/VDraweeView;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VLinear;

.field public j:Lv/VCheckBox;

.field public k:Landroid/widget/TextView;

.field public l:Lv/VButton;

.field public m:Lv/VButton;

.field public n:Lv/VText;


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

.method public static synthetic P(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 10

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v8, 0x1

    .line 9
    const/4 v9, 0x0

    .line 10
    const-string v2, "\u6211\u7684\u5ba2\u670d"

    .line 11
    .line 12
    const/4 v4, 0x1

    .line 13
    const/4 v5, 0x0

    .line 14
    const/4 v6, 0x0

    .line 15
    const/4 v7, 0x1

    .line 16
    move-object v1, p0

    .line 17
    move-object v3, p1

    .line 18
    invoke-static/range {v1 .. v9}, Lcom/p1/mobile/putong/ui/webview/mk/AccessTokenMkWebViewAct;->u2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZZZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    const-string v0, "e_face_verified_nojump_failed_help"

    .line 2
    .line 3
    const-string v1, "p_face_verified_nojump_failed"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->R1:Ll/qs8;

    .line 11
    .line 12
    const-string v1, "index"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/qs8;->d3(Ljava/lang/String;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/auk;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/auk;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ll/buk;

    .line 28
    .line 29
    invoke-direct {p0}, Ll/buk;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public final S(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cuk;->a(Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public T()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->c:Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->d:Lv/VFrame;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->e:Lv/VDraweeView;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->f:Lv/VImage;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->g:Lv/VText;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->h:Lv/VText;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->l:Lv/VButton;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->m:Lv/VButton;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->n:Lv/VText;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->i:Lv/VLinear;

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->j:Lv/VCheckBox;

    .line 42
    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->k:Landroid/widget/TextView;

    .line 46
    .line 47
    if-nez p0, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const/4 p0, 0x0

    .line 51
    return p0

    .line 52
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 53
    return p0
.end method

.method public V(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->g:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->n:Lv/VText;

    .line 12
    .line 13
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->l:Lv/VButton;

    .line 21
    .line 22
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->m:Lv/VButton;

    .line 30
    .line 31
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->k:Landroid/widget/TextView;

    .line 39
    .line 40
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->n:Lv/VText;

    .line 48
    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    const-string p1, "\u7a0d\u540e\u8ba4\u8bc1"

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    const-string p1, "\u767b\u51fa\u8d26\u53f7"

    .line 55
    .line 56
    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->e:Lv/VDraweeView;

    .line 62
    .line 63
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profile180()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const/4 v1, 0x0

    .line 80
    invoke-virtual {p1, p0, v0, v1}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public W(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->T()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_3

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->l:Lv/VButton;

    .line 11
    .line 12
    if-eqz p2, :cond_1

    .line 13
    .line 14
    const-string v1, "\u91cd\u65b0\u8ba4\u8bc1"

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    const-string v1, "\u7acb\u5373\u8ba4\u8bc1"

    .line 18
    .line 19
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->g:Lv/VText;

    .line 23
    .line 24
    if-eqz p2, :cond_2

    .line 25
    .line 26
    const-string v1, "\u771f\u5b9e\u5934\u50cf\u8ba4\u8bc1\u5931\u8d25"

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_2
    const-string v1, "\u771f\u5b9e\u5934\u50cf\u8ba4\u8bc1"

    .line 30
    .line 31
    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->h:Lv/VText;

    .line 35
    .line 36
    if-eqz p2, :cond_3

    .line 37
    .line 38
    const-string v1, "\u4f60\u7684\u5934\u50cf\u6ca1\u6709\u5b8c\u6574\u9732\u51fa\u6e05\u6670\u9762\u90e8\u6216\u63d0\u4ea4\u8ba4\u8bc1\u8005\u4e0d\u662f\u540c\u4e00\u4eba\uff0c\u8bf7\u91cd\u65b0\u8ba4\u8bc1\uff0c\u5982\u6709\u95ee\u9898\u8bf7\u8054\u7cfb\u5ba2\u670d\u3002"

    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_3
    const-string v1, "\u63a2\u63a2\u8981\u6c42\u7528\u6237\u63d0\u4f9b\u771f\u5b9e\u7167\u7247\u6765\u4fdd\u8bc1\u5e73\u53f0\u548c\u7528\u6237\u5b89\u5168\u3002\u9632\u6b62\u5047\u7167\uff0c\u4ea4\u6d41\u66f4\u771f\u8bda\u3002"

    .line 42
    .line 43
    :goto_2
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->i:Lv/VLinear;

    .line 47
    .line 48
    xor-int/lit8 v1, p2, 0x1

    .line 49
    .line 50
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->m:Lv/VButton;

    .line 54
    .line 55
    invoke-static {v0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    if-eqz p2, :cond_4

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->h:Lv/VText;

    .line 61
    .line 62
    const-string p2, "#FE7E1D"

    .line 63
    .line 64
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    new-instance v0, Ll/ztk;

    .line 69
    .line 70
    invoke-direct {v0, p1}, Ll/ztk;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 71
    .line 72
    .line 73
    const-string p1, "\u8054\u7cfb\u5ba2\u670d"

    .line 74
    .line 75
    invoke-static {p0, p1, p2, v0}, Ll/fsj0;->a(Landroid/widget/TextView;Ljava/lang/String;ILl/x20;)V

    .line 76
    .line 77
    .line 78
    :cond_4
    :goto_3
    return-void
.end method

.method public X(ZZLjava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "e_face_verified_jump_confirm"

    .line 4
    .line 5
    invoke-static {p0, p3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "e_face_verified_jump_cancel"

    .line 9
    .line 10
    invoke-static {p0, p3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    if-eqz p2, :cond_1

    .line 15
    .line 16
    const-string p0, "e_face_verified_nojump_failed_changeavatar"

    .line 17
    .line 18
    invoke-static {p0, p3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "e_face_verified_nojump_failed_signout"

    .line 22
    .line 23
    invoke-static {p0, p3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string p0, "e_face_verified_nojump_failed_help"

    .line 27
    .line 28
    invoke-static {p0, p3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string p0, "e_face_verified_nojump_failed_reverified"

    .line 32
    .line 33
    invoke-static {p0, p3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    const-string p0, "e_face_verified_nojump_confirm"

    .line 38
    .line 39
    invoke-static {p0, p3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const-string p0, "e_face_verified_nojump_signout"

    .line 43
    .line 44
    invoke-static {p0, p3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/growth/views/GrowthSpamDlgView;->S(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
