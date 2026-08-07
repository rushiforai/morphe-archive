.class public Ll/swf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/yvf0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VImage;

.field public c:Lv/VLinear;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VRelative;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VFrame;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Lv/VImage;

.field public n:Lcom/p1/mobile/putong/core/ui/quickaudio/card/SpeedUpCardAct;

.field public o:Ll/yvf0;

.field public p:Landroid/view/View;

.field public q:Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/quickaudio/card/SpeedUpCardAct;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, ""

    .line 10
    .line 11
    invoke-static {v1, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/swf0;->q:Landroid/util/Pair;

    .line 16
    .line 17
    iput-object p1, p0, Ll/swf0;->n:Lcom/p1/mobile/putong/core/ui/quickaudio/card/SpeedUpCardAct;

    .line 18
    .line 19
    return-void
.end method

.method private synthetic A()V
    .locals 2

    .line 1
    invoke-static {}, Ll/vnb;->p1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/swf0;->f:Lv/VRelative;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Ll/swf0;->c:Lv/VLinear;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-le v0, v1, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/swf0;->f:Lv/VRelative;

    .line 22
    .line 23
    const v1, 0x3f733333    # 0.95f

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/swf0;->f:Lv/VRelative;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/swf0;->c:Lv/VLinear;

    .line 35
    .line 36
    const/high16 v0, 0x42200000    # 40.0f

    .line 37
    .line 38
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-static {p0, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method private synthetic B(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/swf0;->n:Lcom/p1/mobile/putong/core/ui/quickaudio/card/SpeedUpCardAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic C(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/swf0;->M()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic E(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_propscard_buy"

    .line 2
    .line 3
    const-string v0, "p_propscard"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/swf0;->n:Lcom/p1/mobile/putong/core/ui/quickaudio/card/SpeedUpCardAct;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/swf0;->N(Lcom/p1/mobile/android/app/Act;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic G(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/swf0;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic H(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "e_propscard_start"

    .line 2
    .line 3
    const-string v0, "p_propscard"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/swf0;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget v0, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/swf0;->o:Ll/yvf0;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/yvf0;->l0()Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance v0, Ll/qwf0;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/qwf0;-><init>(Ll/swf0;)V

    .line 27
    .line 28
    .line 29
    new-instance v1, Ll/rwf0;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/rwf0;-><init>(Ll/swf0;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic a(Ll/swf0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/swf0;->F(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic b(Ll/swf0;Ll/pej0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/swf0;->L(Ll/pej0;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/pej0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->cancel()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ll/swf0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/swf0;->C(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/swf0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/swf0;->A()V

    return-void
.end method

.method public static synthetic f(Ll/pej0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->cancel()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Ll/swf0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/swf0;->E(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ll/swf0;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/swf0;->I(Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Ll/swf0;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/swf0;->K(Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ll/swf0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/swf0;->H(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ll/swf0;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/swf0;->J(Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q(Ll/swf0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/swf0;->G(Ljava/lang/Throwable;)V

    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    invoke-static {}, Ll/vnb;->p1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/swf0;->f:Lv/VRelative;

    .line 8
    .line 9
    const v1, 0x3f59999a    # 0.85f

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/swf0;->f:Lv/VRelative;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/swf0;->c:Lv/VLinear;

    .line 21
    .line 22
    const/high16 v1, 0x41f00000    # 30.0f

    .line 23
    .line 24
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object v0, p0, Ll/swf0;->f:Lv/VRelative;

    .line 32
    .line 33
    new-instance v1, Ll/zvf0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/zvf0;-><init>(Ll/swf0;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/swf0;->g:Lv/VText;

    .line 42
    .line 43
    const/4 v1, 0x3

    .line 44
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const/4 v3, 0x1

    .line 49
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/swf0;->h:Lv/VText;

    .line 53
    .line 54
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/swf0;->e:Lv/VText;

    .line 62
    .line 63
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/swf0;->d:Lv/VText;

    .line 71
    .line 72
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/swf0;->k:Lv/VText;

    .line 80
    .line 81
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/swf0;->j:Lv/VText;

    .line 89
    .line 90
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/swf0;->l:Lv/VText;

    .line 98
    .line 99
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v0, v1, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ll/swf0;->a:Lv/VImage;

    .line 107
    .line 108
    new-instance v1, Ll/jwf0;

    .line 109
    .line 110
    invoke-direct {v1, p0}, Ll/jwf0;-><init>(Ll/swf0;)V

    .line 111
    .line 112
    .line 113
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/swf0;->b:Lv/VImage;

    .line 117
    .line 118
    new-instance v1, Ll/kwf0;

    .line 119
    .line 120
    invoke-direct {v1, p0}, Ll/kwf0;-><init>(Ll/swf0;)V

    .line 121
    .line 122
    .line 123
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Ll/swf0;->d:Lv/VText;

    .line 127
    .line 128
    new-instance v1, Ll/lwf0;

    .line 129
    .line 130
    invoke-direct {v1, p0}, Ll/lwf0;-><init>(Ll/swf0;)V

    .line 131
    .line 132
    .line 133
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Ll/swf0;->e:Lv/VText;

    .line 137
    .line 138
    new-instance v1, Ll/mwf0;

    .line 139
    .line 140
    invoke-direct {v1, p0}, Ll/mwf0;-><init>(Ll/swf0;)V

    .line 141
    .line 142
    .line 143
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 144
    .line 145
    .line 146
    iget-object p0, p0, Ll/swf0;->l:Lv/VText;

    .line 147
    .line 148
    const-wide v0, 0x40d3880000000000L    # 20000.0

    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 154
    .line 155
    .line 156
    move-result-wide v2

    .line 157
    mul-double/2addr v2, v0

    .line 158
    const-wide v0, 0x40dd4c0000000000L    # 30000.0

    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    add-double/2addr v2, v0

    .line 164
    double-to-int v0, v2

    .line 165
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    const-string v1, "%s\u4eba\u6b63\u5728\u4f7f\u7528\u8be5\u9053\u5177"

    .line 174
    .line 175
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 180
    .line 181
    .line 182
    return-void
.end method

.method public static synthetic s(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->subCode:I

    .line 8
    .line 9
    const v0, 0x3d0965

    .line 10
    .line 11
    .line 12
    if-ne p0, v0, :cond_0

    .line 13
    .line 14
    const-string p0, "10\u79d2\u5185\u53ea\u80fd\u4e70\u4e00\u6b21\u54e6\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic u(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic w(Ll/swf0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/swf0;->B(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x(Ll/pej0;Ll/uxj0;)V
    .locals 0

    .line 1
    const-string p1, "\u8d2d\u4e70\u6210\u529f"

    .line 2
    .line 3
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/swf0;->n:Lcom/p1/mobile/putong/core/ui/quickaudio/card/SpeedUpCardAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic F(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/swf0;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic I(Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    const-string v0, "quickchatSpeedUpNumX1"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p4, v0}, Ll/lqb;->s4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p4

    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/lqb;->h5()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {p4, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 28
    .line 29
    .line 30
    move-result-object p4

    .line 31
    iput-object p4, p0, Ll/swf0;->q:Landroid/util/Pair;

    .line 32
    .line 33
    sget p0, Ll/dbc0;->xr:I

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 36
    .line 37
    .line 38
    sget p0, Ll/dbc0;->w1:I

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 41
    .line 42
    .line 43
    sget p0, Ll/dbc0;->w1:I

    .line 44
    .line 45
    invoke-virtual {p3, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic J(Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    const-string v0, "quickchatSpeedUpNumX10"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p4, v0}, Ll/lqb;->s4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p4

    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/lqb;->g5()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {p4, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 28
    .line 29
    .line 30
    move-result-object p4

    .line 31
    iput-object p4, p0, Ll/swf0;->q:Landroid/util/Pair;

    .line 32
    .line 33
    sget p0, Ll/dbc0;->xr:I

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 36
    .line 37
    .line 38
    sget p0, Ll/dbc0;->w1:I

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 41
    .line 42
    .line 43
    sget p0, Ll/dbc0;->w1:I

    .line 44
    .line 45
    invoke-virtual {p3, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic K(Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    const-string v0, "quickchatSpeedUpNumX20"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p4, v0}, Ll/lqb;->s4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p4

    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/lqb;->i5()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {p4, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 28
    .line 29
    .line 30
    move-result-object p4

    .line 31
    iput-object p4, p0, Ll/swf0;->q:Landroid/util/Pair;

    .line 32
    .line 33
    sget p0, Ll/dbc0;->xr:I

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 36
    .line 37
    .line 38
    sget p0, Ll/dbc0;->w1:I

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 41
    .line 42
    .line 43
    sget p0, Ll/dbc0;->w1:I

    .line 44
    .line 45
    invoke-virtual {p3, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic L(Ll/pej0;Landroid/view/View;)V
    .locals 4

    .line 1
    const-string p2, "e_propscard_buy_confirm"

    .line 2
    .line 3
    const-string v0, "p_propscard_buy_popup"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 11
    .line 12
    invoke-virtual {p2}, Ll/lqb;->Y4()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    iget-object p2, p0, Ll/swf0;->q:Landroid/util/Pair;

    .line 17
    .line 18
    iget-object p2, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p2, Ljava/lang/Integer;

    .line 21
    .line 22
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    int-to-long v2, p2

    .line 27
    cmp-long p2, v0, v2

    .line 28
    .line 29
    if-ltz p2, :cond_0

    .line 30
    .line 31
    iget-object p2, p0, Ll/swf0;->o:Ll/yvf0;

    .line 32
    .line 33
    iget-object p0, p0, Ll/swf0;->q:Landroid/util/Pair;

    .line 34
    .line 35
    iget-object p0, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p0, Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p2, p0}, Ll/yvf0;->k0(Ljava/lang/String;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    new-instance p2, Ll/hwf0;

    .line 44
    .line 45
    invoke-direct {p2, p1}, Ll/hwf0;-><init>(Ll/pej0;)V

    .line 46
    .line 47
    .line 48
    new-instance p1, Ll/iwf0;

    .line 49
    .line 50
    invoke-direct {p1}, Ll/iwf0;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {p2, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    invoke-virtual {p0}, Ll/swf0;->act()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string p1, "p_propscard_buy,e_propscard_buy_confirm,click"

    .line 66
    .line 67
    invoke-static {p0, p1}, Ll/a5i0;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final M()V
    .locals 5

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_propscard_explain_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "tooltips_trigger_mode"

    .line 14
    .line 15
    const-string v2, "active"

    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    filled-new-array {v1}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/pej0;

    .line 29
    .line 30
    iget-object v2, p0, Ll/swf0;->n:Lcom/p1/mobile/putong/core/ui/quickaudio/card/SpeedUpCardAct;

    .line 31
    .line 32
    invoke-direct {v1, v2}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    sget v2, Ll/kec0;->l2:I

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ll/nu0;->getDelegate()Landroidx/appcompat/app/b;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    sget v3, Ll/vcc0;->E:I

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Landroidx/appcompat/app/b;->g(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-static {v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    const/4 v4, 0x3

    .line 55
    invoke-virtual {v3, v4}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 56
    .line 57
    .line 58
    const/4 v4, 0x1

    .line 59
    invoke-virtual {v3, v4}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setSkipCollapsed(Z)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Ll/swf0;->n:Lcom/p1/mobile/putong/core/ui/quickaudio/card/SpeedUpCardAct;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const v3, 0x106000d

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    invoke-virtual {v2, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 76
    .line 77
    .line 78
    sget p0, Ll/adc0;->o5:I

    .line 79
    .line 80
    invoke-virtual {v1, p0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    new-instance v2, Ll/nwf0;

    .line 85
    .line 86
    invoke-direct {v2, v1}, Ll/nwf0;-><init>(Ll/pej0;)V

    .line 87
    .line 88
    .line 89
    invoke-static {p0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    new-instance p0, Ll/owf0;

    .line 93
    .line 94
    invoke-direct {p0, v0}, Ll/owf0;-><init>(Ll/l4g0;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1, p0}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 98
    .line 99
    .line 100
    new-instance p0, Ll/pwf0;

    .line 101
    .line 102
    invoke-direct {p0, v0}, Ll/pwf0;-><init>(Ll/l4g0;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1, p0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public final N(Lcom/p1/mobile/android/app/Act;)V
    .locals 7

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_propscard_buy_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "tooltips_trigger_mode"

    .line 14
    .line 15
    const-string v2, "active"

    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    filled-new-array {v1}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/pej0;

    .line 29
    .line 30
    invoke-direct {v1, p1}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    sget v2, Ll/kec0;->k2:I

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ll/nu0;->getDelegate()Landroidx/appcompat/app/b;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    sget v3, Ll/vcc0;->E:I

    .line 43
    .line 44
    invoke-virtual {v2, v3}, Landroidx/appcompat/app/b;->g(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-static {v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    const/4 v4, 0x3

    .line 53
    invoke-virtual {v3, v4}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 54
    .line 55
    .line 56
    const/4 v5, 0x1

    .line 57
    invoke-virtual {v3, v5}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setSkipCollapsed(Z)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    const v3, 0x106000d

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    invoke-virtual {v2, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 72
    .line 73
    .line 74
    sget p1, Ll/adc0;->sc:I

    .line 75
    .line 76
    invoke-virtual {v1, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    check-cast p1, Landroid/widget/TextView;

    .line 81
    .line 82
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {p1, v2, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 87
    .line 88
    .line 89
    sget p1, Ll/adc0;->rc:I

    .line 90
    .line 91
    invoke-virtual {v1, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    check-cast p1, Landroid/widget/TextView;

    .line 96
    .line 97
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-virtual {p1, v2, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 102
    .line 103
    .line 104
    sget p1, Ll/adc0;->qc:I

    .line 105
    .line 106
    invoke-virtual {v1, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    new-instance v2, Ll/awf0;

    .line 111
    .line 112
    invoke-direct {v2, v1}, Ll/awf0;-><init>(Ll/pej0;)V

    .line 113
    .line 114
    .line 115
    invoke-static {p1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 116
    .line 117
    .line 118
    sget p1, Ll/adc0;->tc:I

    .line 119
    .line 120
    invoke-virtual {v1, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    sget v2, Ll/adc0;->Y8:I

    .line 125
    .line 126
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    check-cast v2, Landroid/widget/TextView;

    .line 131
    .line 132
    const-string v3, "x1"

    .line 133
    .line 134
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    .line 136
    .line 137
    sget v2, Ll/adc0;->H1:I

    .line 138
    .line 139
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    check-cast v2, Landroid/widget/TextView;

    .line 144
    .line 145
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 146
    .line 147
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 148
    .line 149
    invoke-virtual {v3}, Ll/lqb;->h5()I

    .line 150
    .line 151
    .line 152
    move-result v3

    .line 153
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    const-string v4, "%s\u63a2\u63a2\u5e01"

    .line 162
    .line 163
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 168
    .line 169
    .line 170
    sget v2, Ll/adc0;->uc:I

    .line 171
    .line 172
    invoke-virtual {v1, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    sget v3, Ll/adc0;->Y8:I

    .line 177
    .line 178
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    check-cast v3, Landroid/widget/TextView;

    .line 183
    .line 184
    const-string v5, "x10"

    .line 185
    .line 186
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    sget v3, Ll/adc0;->H1:I

    .line 190
    .line 191
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    check-cast v3, Landroid/widget/TextView;

    .line 196
    .line 197
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 198
    .line 199
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 200
    .line 201
    invoke-virtual {v5}, Ll/lqb;->g5()I

    .line 202
    .line 203
    .line 204
    move-result v5

    .line 205
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 206
    .line 207
    .line 208
    move-result-object v5

    .line 209
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object v5

    .line 213
    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v5

    .line 217
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 218
    .line 219
    .line 220
    sget v3, Ll/adc0;->vc:I

    .line 221
    .line 222
    invoke-virtual {v1, v3}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 223
    .line 224
    .line 225
    move-result-object v3

    .line 226
    sget v5, Ll/adc0;->Y8:I

    .line 227
    .line 228
    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 229
    .line 230
    .line 231
    move-result-object v5

    .line 232
    check-cast v5, Landroid/widget/TextView;

    .line 233
    .line 234
    const-string v6, "x20"

    .line 235
    .line 236
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 237
    .line 238
    .line 239
    sget v5, Ll/adc0;->H1:I

    .line 240
    .line 241
    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 242
    .line 243
    .line 244
    move-result-object v5

    .line 245
    check-cast v5, Landroid/widget/TextView;

    .line 246
    .line 247
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 248
    .line 249
    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 250
    .line 251
    invoke-virtual {v6}, Ll/lqb;->i5()I

    .line 252
    .line 253
    .line 254
    move-result v6

    .line 255
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 256
    .line 257
    .line 258
    move-result-object v6

    .line 259
    filled-new-array {v6}, [Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object v6

    .line 263
    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v4

    .line 267
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 268
    .line 269
    .line 270
    new-instance v4, Ll/bwf0;

    .line 271
    .line 272
    invoke-direct {v4, p0, p1, v2, v3}, Ll/bwf0;-><init>(Ll/swf0;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    .line 273
    .line 274
    .line 275
    invoke-static {p1, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {p1}, Landroid/view/View;->performClick()Z

    .line 279
    .line 280
    .line 281
    new-instance v4, Ll/cwf0;

    .line 282
    .line 283
    invoke-direct {v4, p0, v2, p1, v3}, Ll/cwf0;-><init>(Ll/swf0;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    .line 284
    .line 285
    .line 286
    invoke-static {v2, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 287
    .line 288
    .line 289
    new-instance v4, Ll/dwf0;

    .line 290
    .line 291
    invoke-direct {v4, p0, v3, p1, v2}, Ll/dwf0;-><init>(Ll/swf0;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    .line 292
    .line 293
    .line 294
    invoke-static {v3, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 295
    .line 296
    .line 297
    sget p1, Ll/adc0;->rc:I

    .line 298
    .line 299
    invoke-virtual {v1, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    new-instance v2, Ll/ewf0;

    .line 304
    .line 305
    invoke-direct {v2, p0, v1}, Ll/ewf0;-><init>(Ll/swf0;Ll/pej0;)V

    .line 306
    .line 307
    .line 308
    invoke-static {p1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 309
    .line 310
    .line 311
    new-instance p0, Ll/fwf0;

    .line 312
    .line 313
    invoke-direct {p0, v0}, Ll/fwf0;-><init>(Ll/l4g0;)V

    .line 314
    .line 315
    .line 316
    invoke-virtual {v1, p0}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 317
    .line 318
    .line 319
    new-instance p0, Ll/gwf0;

    .line 320
    .line 321
    invoke-direct {p0, v0}, Ll/gwf0;-><init>(Ll/l4g0;)V

    .line 322
    .line 323
    .line 324
    invoke-virtual {v1, p0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 325
    .line 326
    .line 327
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 328
    .line 329
    .line 330
    return-void
.end method

.method public O()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->S()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "propscard_count"

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    filled-new-array {v1}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "e_propscard_number"

    .line 20
    .line 21
    const-string v3, "p_propscard"

    .line 22
    .line 23
    invoke-static {v2, v3, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/swf0;->k:Lv/VText;

    .line 27
    .line 28
    const/16 v2, 0x63

    .line 29
    .line 30
    if-le v0, v2, :cond_0

    .line 31
    .line 32
    const-string v2, "99+"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/swf0;->e:Lv/VText;

    .line 43
    .line 44
    if-lez v0, :cond_1

    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    const/4 v0, 0x0

    .line 49
    :goto_1
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public P(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/swf0;->e:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const p1, 0x3f19999a    # 0.6f

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/swf0;->e:Lv/VText;

    .line 12
    .line 13
    const-string p1, "\u6682\u4e0d\u4f7f\u7528"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/swf0;->e:Lv/VText;

    .line 25
    .line 26
    const-string p1, "\u5f00\u59cb\u4f7f\u7528"

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/swf0;->n:Lcom/p1/mobile/putong/core/ui/quickaudio/card/SpeedUpCardAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/yvf0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/swf0;->z(Ll/yvf0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/swf0;->y(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/swf0;->p:Landroid/view/View;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/swf0;->r()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/swf0;->p:Landroid/view/View;

    .line 11
    .line 12
    return-object p0
.end method

.method public y(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/twf0;->b(Ll/swf0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public z(Ll/yvf0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/swf0;->o:Ll/yvf0;

    .line 2
    .line 3
    return-void
.end method
