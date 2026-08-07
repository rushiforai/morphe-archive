.class public Lcom/p1/mobile/putong/core/ui/profile/loop/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Lcom/p1/mobile/putong/core/ui/profile/loop/a;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Landroid/widget/ImageView;

.field public c:Lcom/p1/mobile/putong/core/ui/profile/views/SetInfoProgressView;

.field public d:Lv/VText;

.field public e:Lv/VFrame;

.field public f:Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/widget/TextView;

.field public i:Landroid/widget/FrameLayout;

.field public j:Landroid/content/Context;

.field public k:Lcom/p1/mobile/putong/core/ui/profile/loop/a;

.field public l:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->j:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/profile/loop/b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->f(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/profile/loop/b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->i(Landroid/view/View;)V

    return-void
.end method

.method private synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->p0()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->r0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private m()Z
    .locals 2

    .line 1
    const-string v0, "from_ideal_guide_dialog"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->l:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-string v0, "from_ideal_guide_profile_item"

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->l:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->j:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/npa0;->b(Lcom/p1/mobile/putong/core/ui/profile/loop/b;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/core/ui/profile/loop/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;I)V
    .locals 3

    .line 1
    const-string v0, "from_card_upload_photo"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-string v0, "from_profile_upload_photo"

    .line 12
    .line 13
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    const-string v0, "from_explore_card"

    .line 20
    .line 21
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    const-string v0, "from_filter_purpose_dialog"

    .line 28
    .line 29
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    const-string v0, "from_card_guide_improve_profile"

    .line 36
    .line 37
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->d:Lv/VText;

    .line 45
    .line 46
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->d:Lv/VText;

    .line 51
    .line 52
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    :goto_1
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_INTL_FILL_INFO_KIT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 56
    .line 57
    if-ne p2, p1, :cond_2

    .line 58
    .line 59
    if-gt p3, v1, :cond_2

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->d:Lv/VText;

    .line 62
    .line 63
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_MY_TAB_OPT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 67
    .line 68
    if-ne p2, p1, :cond_3

    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->d:Lv/VText;

    .line 71
    .line 72
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    :cond_3
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_MOMENT_GAME:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 76
    .line 77
    if-ne p2, p1, :cond_4

    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->b:Landroid/widget/ImageView;

    .line 80
    .line 81
    sget p2, Ll/kbc0;->r:I

    .line 82
    .line 83
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->c:Lcom/p1/mobile/putong/core/ui/profile/views/SetInfoProgressView;

    .line 87
    .line 88
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->d:Lv/VText;

    .line 92
    .line 93
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    :cond_4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->d(Lcom/p1/mobile/putong/core/ui/profile/loop/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->d:Lv/VText;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(II)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-interface {p1, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Jc(Lcom/p1/mobile/android/app/Act;)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->f:Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;

    .line 25
    .line 26
    int-to-float v0, p1

    .line 27
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->setProgress(F)V

    .line 28
    .line 29
    .line 30
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->g:Landroid/widget/TextView;

    .line 31
    .line 32
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 37
    .line 38
    .line 39
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->g:Landroid/widget/TextView;

    .line 40
    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v1, "\u5df2\u5b8c\u6210"

    .line 44
    .line 45
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string p1, "%"

    .line 52
    .line 53
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    const-string p1, "from_ideal_guide_dialog"

    .line 64
    .line 65
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->l:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_0

    .line 72
    .line 73
    const-string p1, "from_ideal_guide_profile_item"

    .line 74
    .line 75
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->l:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_2

    .line 82
    .line 83
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->h:Landroid/widget/TextView;

    .line 84
    .line 85
    const-string p2, "\u4e30\u5bcc\u8d44\u6599\uff0c\u7b26\u5408\u66f4\u591a\u4eba\u7684\u7406\u60f3\u578b\uff0c\u63a8\u8350\u7ed9\u66f4\u591a\u5408\u9002\u7684\u4eba"

    .line 86
    .line 87
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->h:Landroid/widget/TextView;

    .line 91
    .line 92
    const/high16 p2, 0x41880000    # 17.0f

    .line 93
    .line 94
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    invoke-static {p1, p2}, Ll/msi0;->m(Landroid/widget/TextView;I)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->g:Landroid/widget/TextView;

    .line 102
    .line 103
    const/high16 p1, 0x41a80000    # 21.0f

    .line 104
    .line 105
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    invoke-static {p0, p1}, Ll/msi0;->m(Landroid/widget/TextView;I)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->c:Lcom/p1/mobile/putong/core/ui/profile/views/SetInfoProgressView;

    .line 114
    .line 115
    invoke-virtual {v0, p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/SetInfoProgressView;->d(II)V

    .line 116
    .line 117
    .line 118
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->c:Lcom/p1/mobile/putong/core/ui/profile/views/SetInfoProgressView;

    .line 119
    .line 120
    invoke-static {p2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 121
    .line 122
    .line 123
    move-result p2

    .line 124
    if-nez p2, :cond_2

    .line 125
    .line 126
    if-le p1, v1, :cond_2

    .line 127
    .line 128
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->c:Lcom/p1/mobile/putong/core/ui/profile/views/SetInfoProgressView;

    .line 129
    .line 130
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->c:Lcom/p1/mobile/putong/core/ui/profile/views/SetInfoProgressView;

    .line 134
    .line 135
    const/4 p2, 0x0

    .line 136
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 137
    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->c:Lcom/p1/mobile/putong/core/ui/profile/views/SetInfoProgressView;

    .line 140
    .line 141
    new-array p1, v1, [F

    .line 142
    .line 143
    const/high16 p2, 0x3f800000    # 1.0f

    .line 144
    .line 145
    const/4 v0, 0x0

    .line 146
    aput p2, p1, v0

    .line 147
    .line 148
    const-string p2, "alpha"

    .line 149
    .line 150
    invoke-static {p0, p2, p1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    const-wide/16 p1, 0xb4

    .line 155
    .line 156
    invoke-virtual {p0, p1, p2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 161
    .line 162
    .line 163
    :cond_2
    return-void
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->d:Lv/VText;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public r()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->c:Lcom/p1/mobile/putong/core/ui/profile/views/SetInfoProgressView;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->e:Lv/VFrame;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->h:Landroid/widget/TextView;

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->b:Landroid/widget/ImageView;

    .line 26
    .line 27
    new-instance v1, Ll/lpa0;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/lpa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/b;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/b;->d:Lv/VText;

    .line 36
    .line 37
    new-instance v1, Ll/mpa0;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/mpa0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/b;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
