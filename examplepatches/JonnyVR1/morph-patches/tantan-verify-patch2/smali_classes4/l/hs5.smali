.class public Ll/hs5;
.super Ll/f6l;
.source "SourceFile"


# instance fields
.field public f:Lv/VLinear;

.field public g:Landroid/widget/FrameLayout;

.field public h:Lv/VImage;

.field public i:Lv/VText_NoTopPadding;

.field public j:Landroid/widget/LinearLayout;

.field public k:Lv/VText_NoTopPadding;

.field public l:Landroid/view/View;

.field public m:Lv/AutoVDraweeView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/f6l;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic D(Ll/hs5;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hs5;->K(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic E(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/gp5;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;->e()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic H(Ll/hs5;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ComplimentFromOther;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hs5;->J(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ComplimentFromOther;)V

    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;III)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {}, Ll/mp5;->h()Ll/mp5;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object p3, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p1, p3}, Ll/mp5;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    .line 11
    .line 12
    .line 13
    move-result-object p3

    .line 14
    iget-object p4, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1, p4}, Ll/mp5;->i(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result p4

    .line 20
    if-eqz p4, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, p3, p2}, Ll/hs5;->L(Lcom/p1/mobile/putong/core/data/ComplimentFromOther;Lcom/p1/mobile/putong/data/User;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    invoke-virtual {p0}, Ll/dmf;->m()Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    const/4 p4, 0x0

    .line 31
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    iget-object p4, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p1, p4}, Ll/mp5;->f(Ljava/lang/String;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p3, p1}, Ll/dmf;->k(Ll/ner;Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    new-instance p3, Ll/cs5;

    .line 49
    .line 50
    invoke-direct {p3, p0, p2}, Ll/cs5;-><init>(Ll/hs5;Lcom/p1/mobile/putong/data/User;)V

    .line 51
    .line 52
    .line 53
    new-instance p2, Ll/ds5;

    .line 54
    .line 55
    invoke-direct {p2, p0}, Ll/ds5;-><init>(Ll/hs5;)V

    .line 56
    .line 57
    .line 58
    invoke-static {p3, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    :goto_0
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-static {p1}, Ll/gp5;->b(Lcom/p1/mobile/android/app/Act;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_2

    .line 74
    .line 75
    invoke-static {}, Ll/gp5;->j()V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_2
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->y()Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    new-instance p3, Ll/es5;

    .line 92
    .line 93
    invoke-direct {p3}, Ll/es5;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p2, p3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    invoke-virtual {p0, p1, p2}, Ll/dmf;->k(Ll/ner;Lrx/c;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    new-instance p1, Ll/fs5;

    .line 105
    .line 106
    invoke-direct {p1}, Ll/fs5;-><init>()V

    .line 107
    .line 108
    .line 109
    new-instance p2, Ll/gs5;

    .line 110
    .line 111
    invoke-direct {p2}, Ll/gs5;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public final I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/is5;->a(Ll/hs5;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic J(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ComplimentFromOther;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Ll/hs5;->L(Lcom/p1/mobile/putong/core/data/ComplimentFromOther;Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic K(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dmf;->m()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final L(Lcom/p1/mobile/putong/core/data/ComplimentFromOther;Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/dmf;->m()Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/dmf;->m()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/hs5;->i:Lv/VText_NoTopPadding;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    sget v4, Lcom/p1/mobile/putong/core/R$string;->V9:I

    .line 29
    .line 30
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object v1, p0, Ll/hs5;->k:Lv/VText_NoTopPadding;

    .line 38
    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ComplimentFromOther;->value:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz v3, :cond_2

    .line 44
    .line 45
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    :cond_2
    iget-object v1, p0, Ll/hs5;->m:Lv/AutoVDraweeView;

    .line 49
    .line 50
    if-eqz v1, :cond_6

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ComplimentFromOther;->media:Lcom/p1/mobile/putong/data/Media;

    .line 53
    .line 54
    if-eqz p1, :cond_3

    .line 55
    .line 56
    invoke-static {p1}, Ll/xr5;->a(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    goto :goto_0

    .line 61
    :cond_3
    const/4 p1, 0x0

    .line 62
    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-nez v1, :cond_4

    .line 67
    .line 68
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 69
    .line 70
    iget-object v0, p0, Ll/hs5;->m:Lv/AutoVDraweeView;

    .line 71
    .line 72
    const/high16 v1, 0x42800000    # 64.0f

    .line 73
    .line 74
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    invoke-virtual {p2, v0, p1, v3, v1}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Ll/hs5;->m:Lv/AutoVDraweeView;

    .line 86
    .line 87
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_4
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 92
    .line 93
    if-eqz p1, :cond_5

    .line 94
    .line 95
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-nez p1, :cond_5

    .line 100
    .line 101
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 102
    .line 103
    iget-object v0, p0, Ll/hs5;->m:Lv/AutoVDraweeView;

    .line 104
    .line 105
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    const/16 v1, 0x40

    .line 110
    .line 111
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/data/Picture;->profileSize(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    invoke-virtual {p1, v0, p2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 116
    .line 117
    .line 118
    iget-object p0, p0, Ll/hs5;->m:Lv/AutoVDraweeView;

    .line 119
    .line 120
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_5
    iget-object p0, p0, Ll/hs5;->m:Lv/AutoVDraweeView;

    .line 125
    .line 126
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 127
    .line 128
    .line 129
    :cond_6
    return-void
.end method

.method public g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/dmf;->g(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/hs5;->I(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
