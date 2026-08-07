.class public Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;
.super Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;
.source "SourceFile"


# instance fields
.field public a:Lv/VLinear;

.field public b:Landroid/widget/LinearLayout;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VFrame;

.field public j:Landroid/widget/ImageView;

.field public k:Lv/VDraweeView;

.field public l:Landroid/view/View;

.field public m:Lv/VLinear;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Ll/kcg0;

.field public final q:Ll/vxd0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/vxd0;

    .line 5
    .line 6
    const-string v0, "onlineMatchCardBlurRadius"

    .line 7
    .line 8
    const/4 v1, 0x5

    .line 9
    invoke-direct {p1, v0, v1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->q:Ll/vxd0;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 15
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    new-instance p1, Ll/vxd0;

    const-string p2, "onlineMatchCardBlurRadius"

    const/4 v0, 0x5

    invoke-direct {p1, p2, v0}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->q:Ll/vxd0;

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;Ll/z20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->u(Ll/z20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;Ll/z20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->r(Ll/z20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;Ll/z20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->s(Ll/z20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;ZZLjava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->w(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;ZZLjava/lang/Long;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;Ll/z20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->t(Ll/z20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->v()V

    return-void
.end method

.method public static synthetic n(Ll/z20;Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-interface {p0, p1, v0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public f(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;Ll/z20;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;",
            "Ll/z20<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->k:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->q:Ll/vxd0;

    .line 22
    .line 23
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    check-cast v4, Ljava/lang/Integer;

    .line 28
    .line 29
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    const/4 v5, 0x2

    .line 34
    invoke-virtual {v1, v2, v3, v5, v4}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->n:Lv/VText;

    .line 38
    .line 39
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    const/4 v2, 0x0

    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->n:Lv/VText;

    .line 52
    .line 53
    sget v3, Ll/dbc0;->Iq:I

    .line 54
    .line 55
    invoke-virtual {v1, v2, v2, v3, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->n:Lv/VText;

    .line 64
    .line 65
    if-eqz v1, :cond_1

    .line 66
    .line 67
    sget v1, Ll/dbc0;->Du:I

    .line 68
    .line 69
    invoke-virtual {v3, v2, v2, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    invoke-virtual {v3, v2, v2, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 74
    .line 75
    .line 76
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->n:Lv/VText;

    .line 77
    .line 78
    invoke-static {v1, v2, v2, v2}, Ll/bnl0;->l0(Landroid/view/View;IZZ)V

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->o:Lv/VText;

    .line 82
    .line 83
    const/4 v2, 0x1

    .line 84
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    new-instance v1, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    const-string v2, "\u5f53\u524d\u5728\u7ebf"

    .line 90
    .line 91
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 95
    .line 96
    iget v3, v2, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 97
    .line 98
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 99
    .line 100
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {v3, v2}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->C(ILjava/lang/String;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    const-string v4, " \u00b7 "

    .line 111
    .line 112
    if-nez v3, :cond_2

    .line 113
    .line 114
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    :cond_2
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->H(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 128
    .line 129
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 130
    .line 131
    invoke-static {v0}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    filled-new-array {v2, v0}, [Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    const-string v2, "%1$s \u00b7 %2$s"

    .line 140
    .line 141
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->o:Lv/VText;

    .line 149
    .line 150
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->x(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->q(Ll/z20;)V

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method public final o(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ir50;->a(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->p:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->o(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->n:Lv/VText;

    .line 8
    .line 9
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->h:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->d:Lv/VText;

    .line 20
    .line 21
    const-string v1, "[\u6109\u5feb]"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->e:Lv/VText;

    .line 27
    .line 28
    const-string v1, "[\u73ab\u7470]"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->f:Lv/VText;

    .line 34
    .line 35
    const-string v1, "[\u5564\u9152]"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->g:Lv/VText;

    .line 41
    .line 42
    const-string v1, "[\u5f97\u610f]"

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    new-instance v0, Ll/br50;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Ll/br50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final p(J)Ljava/lang/CharSequence;
    .locals 2

    .line 1
    const-wide/16 v0, 0xa

    .line 2
    .line 3
    cmp-long p0, p1, v0

    .line 4
    .line 5
    if-gez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "\u5373\u523b\u804a\u5929  %ss "

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, "\u5373\u523b\u804a\u5929  %ss"

    .line 11
    .line 12
    :goto_0
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p1, Landroid/text/SpannableStringBuilder;

    .line 25
    .line 26
    invoke-direct {p1, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    new-instance p2, Landroid/text/style/AbsoluteSizeSpan;

    .line 30
    .line 31
    const/16 v0, 0x10

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    invoke-direct {p2, v0, v1}, Landroid/text/style/AbsoluteSizeSpan;-><init>(IZ)V

    .line 35
    .line 36
    .line 37
    const-string v0, " "

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    const/16 v1, 0x21

    .line 48
    .line 49
    invoke-virtual {p1, p2, v0, p0, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 50
    .line 51
    .line 52
    return-object p1
.end method

.method public final q(Ll/z20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->h:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/cr50;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/cr50;-><init>(Ll/z20;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->d:Lv/VText;

    .line 12
    .line 13
    new-instance v1, Ll/dr50;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1}, Ll/dr50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;Ll/z20;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->e:Lv/VText;

    .line 22
    .line 23
    new-instance v1, Ll/er50;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1}, Ll/er50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;Ll/z20;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->f:Lv/VText;

    .line 32
    .line 33
    new-instance v1, Ll/fr50;

    .line 34
    .line 35
    invoke-direct {v1, p0, p1}, Ll/fr50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;Ll/z20;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->g:Lv/VText;

    .line 42
    .line 43
    new-instance v1, Ll/gr50;

    .line 44
    .line 45
    invoke-direct {v1, p0, p1}, Ll/gr50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;Ll/z20;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic r(Ll/z20;Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->d:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p1, p2, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic s(Ll/z20;Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->e:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p1, p2, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic t(Ll/z20;Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->f:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p1, p2, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic u(Ll/z20;Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->g:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p1, p2, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic v()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    mul-int/lit8 v0, v0, 0x3

    .line 12
    .line 13
    div-int/lit8 v0, v0, 0xb

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    mul-int/lit8 v0, v0, 0x4

    .line 21
    .line 22
    div-int/lit8 v0, v0, 0x9

    .line 23
    .line 24
    :goto_0
    mul-int/lit8 v1, v0, 0x64

    .line 25
    .line 26
    div-int/lit16 v1, v1, 0x85

    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->k:Lv/VDraweeView;

    .line 29
    .line 30
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    iput v1, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 35
    .line 36
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 37
    .line 38
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->k:Lv/VDraweeView;

    .line 39
    .line 40
    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->l:Landroid/view/View;

    .line 44
    .line 45
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iput v1, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 50
    .line 51
    int-to-float v3, v0

    .line 52
    const v4, 0x3ed70a3d    # 0.42f

    .line 53
    .line 54
    .line 55
    mul-float/2addr v3, v4

    .line 56
    float-to-int v3, v3

    .line 57
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 58
    .line 59
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->l:Landroid/view/View;

    .line 60
    .line 61
    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->j:Landroid/widget/ImageView;

    .line 65
    .line 66
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    mul-int/lit8 v3, v1, 0x1b

    .line 71
    .line 72
    div-int/lit8 v3, v3, 0x14

    .line 73
    .line 74
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 75
    .line 76
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 77
    .line 78
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->j:Landroid/widget/ImageView;

    .line 79
    .line 80
    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 81
    .line 82
    .line 83
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->m:Lv/VLinear;

    .line 84
    .line 85
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 90
    .line 91
    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 92
    .line 93
    mul-int/lit8 v0, v0, 0x11

    .line 94
    .line 95
    div-int/lit16 v0, v0, 0x10a

    .line 96
    .line 97
    iput v0, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->m:Lv/VLinear;

    .line 100
    .line 101
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;->b()Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_1

    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->n:Lv/VText;

    .line 111
    .line 112
    sget v1, Ll/qa00;->g:I

    .line 113
    .line 114
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->o:Lv/VText;

    .line 118
    .line 119
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 120
    .line 121
    .line 122
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;->e()V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public final synthetic w(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;ZZLjava/lang/Long;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->insertTime:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x3e8

    .line 9
    .line 10
    div-long/2addr v0, v2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    const/16 p1, 0xf

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/16 p1, 0x1e

    .line 19
    .line 20
    :goto_0
    int-to-long p1, p1

    .line 21
    cmp-long p3, v0, p1

    .line 22
    .line 23
    if-ltz p3, :cond_1

    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->p:Ll/kcg0;

    .line 26
    .line 27
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->h:Lv/VText;

    .line 31
    .line 32
    const-string p1, "\u5373\u523b\u804a\u5929"

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->h:Lv/VText;

    .line 39
    .line 40
    sub-long/2addr p1, v0

    .line 41
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->p(J)Ljava/lang/CharSequence;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final x(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->p:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isMaleQuickChatRing:Z

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v0, 0x0

    .line 27
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    iget-wide v2, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->insertTime:J

    .line 40
    .line 41
    const-wide/16 v4, 0x0

    .line 42
    .line 43
    cmp-long v2, v2, v4

    .line 44
    .line 45
    if-eqz v2, :cond_2

    .line 46
    .line 47
    invoke-static {}, Ll/pzi0;->o()J

    .line 48
    .line 49
    .line 50
    move-result-wide v2

    .line 51
    iget-wide v6, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->insertTime:J

    .line 52
    .line 53
    sub-long/2addr v2, v6

    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    const/16 v6, 0x3a98

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    const/16 v6, 0x7530

    .line 62
    .line 63
    :goto_1
    int-to-long v6, v6

    .line 64
    cmp-long v2, v2, v6

    .line 65
    .line 66
    if-gez v2, :cond_2

    .line 67
    .line 68
    const-wide/16 v2, 0x1

    .line 69
    .line 70
    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 71
    .line 72
    invoke-static {v4, v5, v2, v3, v6}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v2}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-virtual {v2, v3}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    new-instance v3, Ll/hr50;

    .line 89
    .line 90
    invoke-direct {v3, p0, p1, v0, v1}, Ll/hr50;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;ZZ)V

    .line 91
    .line 92
    .line 93
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {v2, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchCardView;->p:Ll/kcg0;

    .line 102
    .line 103
    :cond_2
    return-void
.end method
