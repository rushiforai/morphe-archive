.class public Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Ll/r3m;


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VDraweeView;

.field public d:Lv/VDraweeView;

.field public e:Landroid/widget/ImageView;

.field public f:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView;

.field public g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public h:Lv/VText;

.field public i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public j:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public k:Lv/VImage;

.field public l:Ljava/lang/Runnable;

.field public m:Ljava/lang/Runnable;

.field public n:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->g(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->h(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->i(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public a(ZLcom/p1/mobile/putong/data/Media;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StatusesItem;->text:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->j(ZLcom/p1/mobile/putong/data/Media;ZLjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const/4 v0, 0x0

    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->j(ZLcom/p1/mobile/putong/data/Media;ZLjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vf40;->a(Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f()Lcom/p1/mobile/android/app/Act;
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

.method public final synthetic g(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->l:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->l:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public getRenderView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public getTitleView()Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic h(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->m:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->m:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->n:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->n:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final j(ZLcom/p1/mobile/putong/data/Media;ZLjava/lang/String;)V
    .locals 0

    .line 1
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->d:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p3, p4, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p2, 0x1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->h:Lv/VText;

    .line 21
    .line 22
    const-string p3, "\u5f53\u524d\u53f3\u6ed1\u6b21\u6570\u53d7\u9650\uff0c\u65e0\u6cd5\u83b7\u5f97\u914d\u5bf9\uff0c\u5f00\u542f\u9690\u79c1\u6a21\u5f0f\uff0c\u8ba9\u7f18\u5206\u627e\u5230\u4f60\u3002"

    .line 23
    .line 24
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 28
    .line 29
    const-string p3, "\u5934\u50cf\u4e0d\u771f\u5b9e"

    .line 30
    .line 31
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->h:Lv/VText;

    .line 35
    .line 36
    const/16 p4, 0x11

    .line 37
    .line 38
    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setGravity(I)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 42
    .line 43
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->e:Landroid/widget/ImageView;

    .line 47
    .line 48
    sget p3, Ll/dbc0;->vn:I

    .line 49
    .line 50
    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 54
    .line 55
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->j:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 59
    .line 60
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 64
    .line 65
    const-string p2, "\u9690\u79c1\u6a21\u5f0f"

    .line 66
    .line 67
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->j:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 71
    .line 72
    const-string p1, "\u4e0a\u4f20\u5934\u50cf"

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 79
    .line 80
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 84
    .line 85
    const-string p2, "\u6211\u77e5\u9053\u4e86"

    .line 86
    .line 87
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->j:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 91
    .line 92
    const/4 p2, 0x0

    .line 93
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->f()Lcom/p1/mobile/android/app/Act;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    sget p3, Lcom/p1/mobile/putong/core/R$string;->Cl:I

    .line 103
    .line 104
    invoke-virtual {p2, p3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->h:Lv/VText;

    .line 112
    .line 113
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Bl:I

    .line 114
    .line 115
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 116
    .line 117
    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->e:Landroid/widget/ImageView;

    .line 119
    .line 120
    sget p1, Ll/dbc0;->Hn:I

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->k:Lv/VImage;

    .line 8
    .line 9
    new-instance v1, Ll/sf40;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/sf40;-><init>(Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 18
    .line 19
    new-instance v1, Ll/tf40;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/tf40;-><init>(Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;->j:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 28
    .line 29
    new-instance v1, Ll/uf40;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/uf40;-><init>(Lcom/p1/mobile/putong/core/ui/popup/NewProfileFakeView;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
