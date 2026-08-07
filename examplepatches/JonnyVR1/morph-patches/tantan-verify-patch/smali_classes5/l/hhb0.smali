.class public Ll/hhb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ahb0;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/putong/core/data/PrivilegeDetail;

.field public B:Lcom/p1/mobile/putong/core/data/PrivilegeDetail;

.field public C:Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;

.field public D:Landroid/animation/AnimatorSet;

.field public E:Landroid/animation/ObjectAnimator;

.field public F:Z

.field public a:Landroid/widget/Space;

.field public b:Landroid/widget/FrameLayout;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lcom/p1/mobile/putong/core/ui/result/VRectBottomArc;

.field public e:Landroid/widget/ImageView;

.field public f:Landroid/widget/LinearLayout;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/widget/TextView;

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/LinearLayout;

.field public k:Landroid/widget/ImageView;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/LinearLayout;

.field public n:Landroid/widget/FrameLayout;

.field public o:Lv/VText;

.field public p:Lv/VImage;

.field public q:Lv/VText;

.field public r:Landroid/view/View;

.field public final s:Lcom/p1/mobile/android/app/Act;

.field public final t:Lcom/p1/mobile/putong/app/PutongFrag;

.field public u:Ll/ahb0;

.field public v:Lcom/p1/mobile/putong/core/data/ProductCategory;

.field public w:Ljava/lang/String;

.field public x:Ljava/lang/String;

.field public y:Ljava/lang/String;

.field public z:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PrivilegeDetail;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/hhb0;->w:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Ll/hhb0;->x:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Ll/hhb0;->y:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Ll/hhb0;->F:Z

    .line 14
    .line 15
    iput-object p1, p0, Ll/hhb0;->s:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    iput-object p2, p0, Ll/hhb0;->t:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 18
    .line 19
    return-void
.end method

.method private L()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/hhb0;->E:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/hhb0;->p:Lv/VImage;

    .line 8
    .line 9
    const/high16 v3, 0x42400000    # 48.0f

    .line 10
    .line 11
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    neg-int v3, v3

    .line 16
    int-to-float v3, v3

    .line 17
    iget-object v4, p0, Ll/hhb0;->o:Lv/VText;

    .line 18
    .line 19
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    int-to-float v4, v4

    .line 24
    const/4 v5, 0x2

    .line 25
    new-array v5, v5, [F

    .line 26
    .line 27
    aput v3, v5, v2

    .line 28
    .line 29
    aput v4, v5, v1

    .line 30
    .line 31
    const-string v3, "translationX"

    .line 32
    .line 33
    invoke-static {v0, v3, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Ll/hhb0;->E:Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    :cond_0
    iget-object v0, p0, Ll/hhb0;->D:Landroid/animation/AnimatorSet;

    .line 40
    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 44
    .line 45
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Ll/hhb0;->D:Landroid/animation/AnimatorSet;

    .line 49
    .line 50
    :cond_1
    iget-object v0, p0, Ll/hhb0;->D:Landroid/animation/AnimatorSet;

    .line 51
    .line 52
    const-wide/16 v3, 0x320

    .line 53
    .line 54
    invoke-virtual {v0, v3, v4}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/hhb0;->D:Landroid/animation/AnimatorSet;

    .line 58
    .line 59
    new-instance v3, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 60
    .line 61
    invoke-direct {v3}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/hhb0;->D:Landroid/animation/AnimatorSet;

    .line 68
    .line 69
    new-instance v3, Ll/hhb0$b;

    .line 70
    .line 71
    invoke-direct {v3, p0}, Ll/hhb0$b;-><init>(Ll/hhb0;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v3}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/hhb0;->D:Landroid/animation/AnimatorSet;

    .line 78
    .line 79
    iget-object v3, p0, Ll/hhb0;->E:Landroid/animation/ObjectAnimator;

    .line 80
    .line 81
    new-array v1, v1, [Landroid/animation/Animator;

    .line 82
    .line 83
    aput-object v3, v1, v2

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Ll/hhb0;->D:Landroid/animation/AnimatorSet;

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public static synthetic a(Ll/hhb0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hhb0;->z()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/PrivilegeDetail;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "give"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PrivilegeDetail;->channel:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic c(Ll/hhb0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hhb0;->x(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/data/PrivilegeDetail;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "buy"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PrivilegeDetail;->channel:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic e(Ll/hhb0;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hhb0;->w(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/hhb0;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hhb0;->y(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic i(Ll/hhb0;)Landroid/animation/AnimatorSet;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hhb0;->D:Landroid/animation/AnimatorSet;

    return-object p0
.end method

.method public static bridge synthetic j(Ll/hhb0;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/hhb0;->F:Z

    return-void
.end method

.method public static bridge synthetic k(Ll/hhb0;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hhb0;->D:Landroid/animation/AnimatorSet;

    return-void
.end method

.method public static bridge synthetic l(Ll/hhb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hhb0;->L()V

    return-void
.end method


# virtual methods
.method public A()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hhb0;->D:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/hhb0;->p()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final B()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v1, "tttVip"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/hhb0;->o:Lv/VText;

    .line 12
    .line 13
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->d0:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/hhb0;->o:Lv/VText;

    .line 19
    .line 20
    sget v1, Ll/jbc0;->e:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 23
    .line 24
    .line 25
    const-string v0, "vip"

    .line 26
    .line 27
    goto/16 :goto_1

    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 30
    .line 31
    const-string v1, "tttSeeWhoLikedMe"

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Ll/hhb0;->o:Lv/VText;

    .line 40
    .line 41
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->K:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/hhb0;->o:Lv/VText;

    .line 47
    .line 48
    sget v1, Ll/jbc0;->d:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 51
    .line 52
    .line 53
    const-string v0, "see"

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 57
    .line 58
    const-string v1, "quickchatMembership"

    .line 59
    .line 60
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    iget-object v0, p0, Ll/hhb0;->o:Lv/VText;

    .line 67
    .line 68
    sget v1, Ll/jbc0;->c:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/hhb0;->o:Lv/VText;

    .line 74
    .line 75
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->c0:I

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 78
    .line 79
    .line 80
    const-string v0, "quickchat"

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 84
    .line 85
    const-string v1, "coin"

    .line 86
    .line 87
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_4

    .line 92
    .line 93
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 94
    .line 95
    const-string v2, "noneLiveCoin"

    .line 96
    .line 97
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-nez v0, :cond_4

    .line 102
    .line 103
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 104
    .line 105
    const-string v2, "tttCoin"

    .line 106
    .line 107
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_4

    .line 112
    .line 113
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 114
    .line 115
    const-string v2, "tttLiveCoin"

    .line 116
    .line 117
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_3

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_3
    const-string v0, ""

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_4
    :goto_0
    iget-object v0, p0, Ll/hhb0;->o:Lv/VText;

    .line 128
    .line 129
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->V:I

    .line 130
    .line 131
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Ll/hhb0;->o:Lv/VText;

    .line 135
    .line 136
    sget v2, Ll/jbc0;->e:I

    .line 137
    .line 138
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 139
    .line 140
    .line 141
    move-object v0, v1

    .line 142
    :goto_1
    iget-object v1, p0, Ll/hhb0;->o:Lv/VText;

    .line 143
    .line 144
    new-instance v2, Ll/dhb0;

    .line 145
    .line 146
    invoke-direct {v2, p0, v0}, Ll/dhb0;-><init>(Ll/hhb0;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 150
    .line 151
    .line 152
    iget-object v1, p0, Ll/hhb0;->e:Landroid/widget/ImageView;

    .line 153
    .line 154
    new-instance v2, Ll/ehb0;

    .line 155
    .line 156
    invoke-direct {v2, p0}, Ll/ehb0;-><init>(Ll/hhb0;)V

    .line 157
    .line 158
    .line 159
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 160
    .line 161
    .line 162
    const-string v1, "pageproducttype"

    .line 163
    .line 164
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    filled-new-array {v1}, [Ll/pf60;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    const-string v2, "e_pay_result_button"

    .line 173
    .line 174
    const-string v3, "p_pay_result"

    .line 175
    .line 176
    invoke-static {v2, v3, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p0, v0}, Ll/hhb0;->E(Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    return-void
.end method

.method public final C()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "zh"

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 31
    .line 32
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->e0:I

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v1, " "

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 47
    .line 48
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->Y:I

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object v1, p0, Ll/hhb0;->A:Lcom/p1/mobile/putong/core/data/PrivilegeDetail;

    .line 62
    .line 63
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/PrivilegeDetail;->count:J

    .line 64
    .line 65
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    const-string v2, "#fff356"

    .line 78
    .line 79
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    new-instance v4, Landroid/text/SpannableString;

    .line 88
    .line 89
    invoke-direct {v4, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    .line 93
    .line 94
    invoke-direct {v0, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    add-int/2addr v1, v3

    .line 102
    const/16 v2, 0x21

    .line 103
    .line 104
    invoke-virtual {v4, v0, v3, v1, v2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/hhb0;->g:Landroid/widget/TextView;

    .line 108
    .line 109
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 114
    .line 115
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->e0:I

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iget-object v1, p0, Ll/hhb0;->g:Landroid/widget/TextView;

    .line 122
    .line 123
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 129
    .line 130
    .line 131
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 132
    .line 133
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->W:I

    .line 134
    .line 135
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    iget-object v2, p0, Ll/hhb0;->x:Ljava/lang/String;

    .line 140
    .line 141
    iget-object v3, p0, Ll/hhb0;->y:Ljava/lang/String;

    .line 142
    .line 143
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    const-string v1, "  |  "

    .line 155
    .line 156
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 160
    .line 161
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->P:I

    .line 162
    .line 163
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    iget-object v2, p0, Ll/hhb0;->A:Lcom/p1/mobile/putong/core/data/PrivilegeDetail;

    .line 168
    .line 169
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/PrivilegeDetail;->remaining:J

    .line 170
    .line 171
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    iget-object p0, p0, Ll/hhb0;->h:Landroid/widget/TextView;

    .line 191
    .line 192
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 193
    .line 194
    .line 195
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hhb0;->s:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public final E(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hhb0;->i:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/hhb0;->q:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/hhb0;->i:Landroid/widget/TextView;

    .line 14
    .line 15
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->Z:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/hhb0;->i:Landroid/widget/TextView;

    .line 21
    .line 22
    new-instance v1, Ll/ghb0;

    .line 23
    .line 24
    invoke-direct {v1, p0, p1}, Ll/ghb0;-><init>(Ll/hhb0;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    const-string p0, "pageproducttype"

    .line 31
    .line 32
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    filled-new-array {p0}, [Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string p1, "e_pay_feedback"

    .line 41
    .line 42
    const-string v0, "p_pay_result"

    .line 43
    .line 44
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final F(Ljava/lang/String;)V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "zh"

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/hhb0;->A:Lcom/p1/mobile/putong/core/data/PrivilegeDetail;

    .line 26
    .line 27
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/PrivilegeDetail;->duration:J

    .line 28
    .line 29
    const-wide/32 v2, 0x278d00

    .line 30
    .line 31
    .line 32
    cmp-long v0, v0, v2

    .line 33
    .line 34
    if-gez v0, :cond_0

    .line 35
    .line 36
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v1, p0, Ll/hhb0;->A:Lcom/p1/mobile/putong/core/data/PrivilegeDetail;

    .line 41
    .line 42
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/PrivilegeDetail;->duration:J

    .line 43
    .line 44
    const-wide/32 v3, 0x15180

    .line 45
    .line 46
    .line 47
    div-long/2addr v1, v3

    .line 48
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const-string v2, "%d\u5929"

    .line 57
    .line 58
    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    goto :goto_0

    .line 63
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 64
    .line 65
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->X:I

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object v1, p0, Ll/hhb0;->A:Lcom/p1/mobile/putong/core/data/PrivilegeDetail;

    .line 72
    .line 73
    iget-wide v4, v1, Lcom/p1/mobile/putong/core/data/PrivilegeDetail;->duration:J

    .line 74
    .line 75
    div-long/2addr v4, v2

    .line 76
    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    :goto_0
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    const-string v1, "#fff356"

    .line 97
    .line 98
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    new-instance v3, Landroid/text/SpannableString;

    .line 107
    .line 108
    invoke-direct {v3, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    new-instance p1, Landroid/text/style/ForegroundColorSpan;

    .line 112
    .line 113
    invoke-direct {p1, v1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    add-int/2addr v0, v2

    .line 121
    const/16 v1, 0x21

    .line 122
    .line 123
    invoke-virtual {v3, p1, v2, v0, v1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Ll/hhb0;->g:Landroid/widget/TextView;

    .line 127
    .line 128
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_1
    iget-object v0, p0, Ll/hhb0;->g:Landroid/widget/TextView;

    .line 133
    .line 134
    const-string v1, ""

    .line 135
    .line 136
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 145
    .line 146
    .line 147
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 148
    .line 149
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 150
    .line 151
    .line 152
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 153
    .line 154
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->W:I

    .line 155
    .line 156
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    iget-object v1, p0, Ll/hhb0;->x:Ljava/lang/String;

    .line 161
    .line 162
    iget-object v2, p0, Ll/hhb0;->y:Ljava/lang/String;

    .line 163
    .line 164
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string v0, "  |  "

    .line 176
    .line 177
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 181
    .line 182
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->Q:I

    .line 183
    .line 184
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    iget-object v1, p0, Ll/hhb0;->A:Lcom/p1/mobile/putong/core/data/PrivilegeDetail;

    .line 189
    .line 190
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/PrivilegeDetail;->expireAt:J

    .line 191
    .line 192
    const-wide/16 v3, 0x3e8

    .line 193
    .line 194
    mul-long/2addr v1, v3

    .line 195
    invoke-virtual {p0, v1, v2}, Ll/hhb0;->u(J)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    iget-object p0, p0, Ll/hhb0;->h:Landroid/widget/TextView;

    .line 215
    .line 216
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 217
    .line 218
    .line 219
    return-void
.end method

.method public final G()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const-string v2, "coin"

    .line 15
    .line 16
    const-string v3, "tttCoin"

    .line 17
    .line 18
    const-string v4, "tttLiveCoin"

    .line 19
    .line 20
    const-string v5, "noneLiveCoin"

    .line 21
    .line 22
    const/4 v6, -0x1

    .line 23
    sparse-switch v1, :sswitch_data_0

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :sswitch_0
    const-string v1, "quickchatMembership"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 v6, 0x6

    .line 37
    goto :goto_0

    .line 38
    :sswitch_1
    const-string v1, "tttSeeWhoLikedMe"

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const/4 v6, 0x5

    .line 48
    goto :goto_0

    .line 49
    :sswitch_2
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_2

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    const/4 v6, 0x4

    .line 57
    goto :goto_0

    .line 58
    :sswitch_3
    const-string v1, "tttVip"

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_3

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    const/4 v6, 0x3

    .line 68
    goto :goto_0

    .line 69
    :sswitch_4
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_4

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_4
    const/4 v6, 0x2

    .line 77
    goto :goto_0

    .line 78
    :sswitch_5
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_5

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_5
    const/4 v6, 0x1

    .line 86
    goto :goto_0

    .line 87
    :sswitch_6
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_6

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_6
    const/4 v6, 0x0

    .line 95
    :goto_0
    const/4 v0, 0x0

    .line 96
    packed-switch v6, :pswitch_data_0

    .line 97
    .line 98
    .line 99
    const-string v0, "Unexpected category: "

    .line 100
    .line 101
    iget-object p0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 102
    .line 103
    invoke-static {v0, p0}, Ll/qg50;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :pswitch_0
    invoke-virtual {p0}, Ll/hhb0;->C0()Landroid/content/Context;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-static {v1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    sget v6, Ll/rec0;->Y2:I

    .line 116
    .line 117
    invoke-virtual {v1, v6, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    goto :goto_1

    .line 122
    :pswitch_1
    invoke-virtual {p0}, Ll/hhb0;->C0()Landroid/content/Context;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-static {v1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    sget v6, Ll/rec0;->Z2:I

    .line 131
    .line 132
    invoke-virtual {v1, v6, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    goto :goto_1

    .line 137
    :pswitch_2
    new-instance v0, Lcom/p1/mobile/putong/core/ui/result/VipContent;

    .line 138
    .line 139
    invoke-virtual {p0}, Ll/hhb0;->C0()Landroid/content/Context;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/result/VipContent;-><init>(Landroid/content/Context;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/result/VipContent;->I()V

    .line 147
    .line 148
    .line 149
    goto :goto_1

    .line 150
    :pswitch_3
    new-instance v0, Lcom/p1/mobile/putong/core/ui/result/CoinRecyclerView;

    .line 151
    .line 152
    invoke-virtual {p0}, Ll/hhb0;->C0()Landroid/content/Context;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/result/CoinRecyclerView;-><init>(Landroid/content/Context;)V

    .line 157
    .line 158
    .line 159
    :goto_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    if-eqz v1, :cond_9

    .line 164
    .line 165
    iget-object v1, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 166
    .line 167
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    if-nez v1, :cond_7

    .line 172
    .line 173
    iget-object v1, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 174
    .line 175
    invoke-static {v1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    if-nez v1, :cond_7

    .line 180
    .line 181
    iget-object v1, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 182
    .line 183
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    if-nez v1, :cond_7

    .line 188
    .line 189
    iget-object v1, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 190
    .line 191
    invoke-static {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    if-eqz v1, :cond_8

    .line 196
    .line 197
    :cond_7
    iget-object v1, p0, Ll/hhb0;->b:Landroid/widget/FrameLayout;

    .line 198
    .line 199
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 204
    .line 205
    const/high16 v2, 0x41800000    # 16.0f

    .line 206
    .line 207
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 208
    .line 209
    .line 210
    move-result v3

    .line 211
    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 212
    .line 213
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 218
    .line 219
    iget-object v2, p0, Ll/hhb0;->b:Landroid/widget/FrameLayout;

    .line 220
    .line 221
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 222
    .line 223
    .line 224
    :cond_8
    iget-object v1, p0, Ll/hhb0;->b:Landroid/widget/FrameLayout;

    .line 225
    .line 226
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 227
    .line 228
    .line 229
    :cond_9
    instance-of v1, v0, Ll/ugb0;

    .line 230
    .line 231
    if-eqz v1, :cond_a

    .line 232
    .line 233
    check-cast v0, Ll/ugb0;

    .line 234
    .line 235
    iget-object p0, p0, Ll/hhb0;->t:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 236
    .line 237
    invoke-interface {v0, p0}, Ll/ugb0;->w(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 238
    .line 239
    .line 240
    :cond_a
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x53a0270b -> :sswitch_6
        -0x4fc2904f -> :sswitch_5
        -0x3b38355b -> :sswitch_4
        -0x33752677 -> :sswitch_3
        0x2eae91 -> :sswitch_2
        0x1ace97a6 -> :sswitch_1
        0x458b6c7b -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final H()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v1, "tttVip"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/hhb0;->j:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/hhb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget v2, Ll/jbc0;->D7:I

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/hhb0;->k:Landroid/widget/ImageView;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/hhb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    sget v2, Ll/jbc0;->H7:I

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/hhb0;->l:Landroid/widget/TextView;

    .line 42
    .line 43
    const-string v0, "\u5df2\u4eab\u53d7\u4ee5\u4e0b %s \u5927\u4f1a\u5458\u7279\u6743"

    .line 44
    .line 45
    const-string v1, "5"

    .line 46
    .line 47
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 60
    .line 61
    const-string v1, "tttSeeWhoLikedMe"

    .line 62
    .line 63
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_1

    .line 68
    .line 69
    iget-object v0, p0, Ll/hhb0;->j:Landroid/widget/LinearLayout;

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/hhb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    sget v2, Ll/jbc0;->C7:I

    .line 76
    .line 77
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/hhb0;->k:Landroid/widget/ImageView;

    .line 85
    .line 86
    invoke-virtual {p0}, Ll/hhb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    sget v2, Ll/jbc0;->G7:I

    .line 91
    .line 92
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Ll/hhb0;->l:Landroid/widget/TextView;

    .line 100
    .line 101
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->b0:I

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_1
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 108
    .line 109
    const-string v1, "quickchatMembership"

    .line 110
    .line 111
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-eqz v0, :cond_2

    .line 116
    .line 117
    iget-object v0, p0, Ll/hhb0;->j:Landroid/widget/LinearLayout;

    .line 118
    .line 119
    invoke-virtual {p0}, Ll/hhb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    sget v2, Ll/jbc0;->B7:I

    .line 124
    .line 125
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Ll/hhb0;->k:Landroid/widget/ImageView;

    .line 133
    .line 134
    invoke-virtual {p0}, Ll/hhb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    sget v2, Ll/jbc0;->F7:I

    .line 139
    .line 140
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 145
    .line 146
    .line 147
    iget-object p0, p0, Ll/hhb0;->l:Landroid/widget/TextView;

    .line 148
    .line 149
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->R:I

    .line 150
    .line 151
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_2
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 156
    .line 157
    const-string v1, "coin"

    .line 158
    .line 159
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-nez v0, :cond_4

    .line 164
    .line 165
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 166
    .line 167
    const-string v1, "noneLiveCoin"

    .line 168
    .line 169
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-nez v0, :cond_4

    .line 174
    .line 175
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 176
    .line 177
    const-string v1, "tttCoin"

    .line 178
    .line 179
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-nez v0, :cond_4

    .line 184
    .line 185
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 186
    .line 187
    const-string v1, "tttLiveCoin"

    .line 188
    .line 189
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    if-eqz v0, :cond_3

    .line 194
    .line 195
    goto :goto_0

    .line 196
    :cond_3
    return-void

    .line 197
    :cond_4
    :goto_0
    iget-object v0, p0, Ll/hhb0;->j:Landroid/widget/LinearLayout;

    .line 198
    .line 199
    invoke-virtual {p0}, Ll/hhb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    sget v2, Ll/jbc0;->A7:I

    .line 204
    .line 205
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 210
    .line 211
    .line 212
    iget-object v0, p0, Ll/hhb0;->k:Landroid/widget/ImageView;

    .line 213
    .line 214
    invoke-virtual {p0}, Ll/hhb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    sget v2, Ll/jbc0;->E7:I

    .line 219
    .line 220
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 225
    .line 226
    .line 227
    iget-object p0, p0, Ll/hhb0;->l:Landroid/widget/TextView;

    .line 228
    .line 229
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->M:I

    .line 230
    .line 231
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 232
    .line 233
    .line 234
    return-void
.end method

.method public I()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/hhb0;->F:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/hhb0;->K()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final J(Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/data/PrivilegeDetail;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/hhb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/rec0;->G1:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;

    .line 17
    .line 18
    iput-object v0, p0, Ll/hhb0;->C:Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;

    .line 19
    .line 20
    new-instance v1, Ll/fhb0;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/fhb0;-><init>(Ll/hhb0;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->setExitAction(Ll/x20;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/hhb0;->C:Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;

    .line 29
    .line 30
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->g(Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/data/PrivilegeDetail;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/hhb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Landroid/widget/FrameLayout;

    .line 46
    .line 47
    iget-object p2, p0, Ll/hhb0;->C:Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;

    .line 48
    .line 49
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/hhb0;->C:Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;->h()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final K()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hhb0;->p:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/hhb0;->p()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/hhb0;->o:Lv/VText;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/hhb0;->o:Lv/VText;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/hhb0$a;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/hhb0$a;-><init>(Ll/hhb0;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-direct {p0}, Ll/hhb0;->L()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public M()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/hhb0;->F:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/hhb0;->p()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hhb0;->s:Lcom/p1/mobile/android/app/Act;

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
    check-cast p1, Ll/ahb0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hhb0;->n(Ll/ahb0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hhb0;->m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ihb0;->b(Ll/hhb0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n(Ll/ahb0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hhb0;->u:Ll/ahb0;

    .line 2
    .line 3
    return-void
.end method

.method public o()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hhb0;->C:Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/hhb0;->C:Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;

    .line 11
    .line 12
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Ll/hhb0;->C:Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;

    .line 19
    .line 20
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    return v1
.end method

.method public final p()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hhb0;->D:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/hhb0;->D:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Ll/hhb0;->D:Landroid/animation/AnimatorSet;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final q()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hhb0;->z:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Ll/hhb0;->z:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ll/bhb0;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/bhb0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/core/data/PrivilegeDetail;

    .line 21
    .line 22
    iput-object v0, p0, Ll/hhb0;->B:Lcom/p1/mobile/putong/core/data/PrivilegeDetail;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Ll/hhb0;->B:Lcom/p1/mobile/putong/core/data/PrivilegeDetail;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PrivilegeDetail;->privilegeType:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, p0, Ll/hhb0;->w:Ljava/lang/String;

    .line 39
    .line 40
    sget-object v2, Ll/wgb0;->b:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_1

    .line 47
    .line 48
    const-string v1, "boost"

    .line 49
    .line 50
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_0

    .line 55
    .line 56
    const-string v1, "superLike"

    .line 57
    .line 58
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-nez v1, :cond_0

    .line 63
    .line 64
    const-string v1, "quickchatNumber"

    .line 65
    .line 66
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    :cond_0
    iget-object v1, p0, Ll/hhb0;->w:Ljava/lang/String;

    .line 73
    .line 74
    sput-object v1, Ll/wgb0;->b:Ljava/lang/String;

    .line 75
    .line 76
    iget-object v1, p0, Ll/hhb0;->B:Lcom/p1/mobile/putong/core/data/PrivilegeDetail;

    .line 77
    .line 78
    invoke-virtual {p0, v0, v1}, Ll/hhb0;->J(Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/data/PrivilegeDetail;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_1
    invoke-virtual {p0}, Ll/hhb0;->K()V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_2
    invoke-virtual {p0}, Ll/hhb0;->K()V

    .line 87
    .line 88
    .line 89
    :cond_3
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/hhb0;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/hhb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 16
    .line 17
    const-string v1, "tttVip"

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 26
    .line 27
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->h0:I

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Ll/hhb0;->F(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 38
    .line 39
    const-string v1, "tttSeeWhoLikedMe"

    .line 40
    .line 41
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 48
    .line 49
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->g0:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ll/hhb0;->F(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 60
    .line 61
    const-string v1, "quickchatMembership"

    .line 62
    .line 63
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_3

    .line 68
    .line 69
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 70
    .line 71
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->f0:I

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p0, v0}, Ll/hhb0;->F(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_3
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 82
    .line 83
    const-string v1, "coin"

    .line 84
    .line 85
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_4

    .line 90
    .line 91
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 92
    .line 93
    const-string v1, "noneLiveCoin"

    .line 94
    .line 95
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_4

    .line 100
    .line 101
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 102
    .line 103
    const-string v1, "tttCoin"

    .line 104
    .line 105
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-nez v0, :cond_4

    .line 110
    .line 111
    iget-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 112
    .line 113
    const-string v1, "tttLiveCoin"

    .line 114
    .line 115
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_5

    .line 120
    .line 121
    :cond_4
    invoke-virtual {p0}, Ll/hhb0;->C()V

    .line 122
    .line 123
    .line 124
    :cond_5
    :goto_0
    invoke-virtual {p0}, Ll/hhb0;->H()V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Ll/hhb0;->G()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0}, Ll/hhb0;->B()V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0}, Ll/hhb0;->q()V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public final s()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hhb0;->z:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/chb0;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/chb0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/core/data/PrivilegeDetail;

    .line 13
    .line 14
    iput-object v0, p0, Ll/hhb0;->A:Lcom/p1/mobile/putong/core/data/PrivilegeDetail;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public final u(J)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance p0, Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    const-string v0, "yyyy/MM/dd"

    .line 4
    .line 5
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {p0, v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ljava/util/Date;

    .line 13
    .line 14
    invoke-direct {v0, p1, p2}, Ljava/util/Date;-><init>(J)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public v(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const-string v0, "params_category"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 18
    .line 19
    const-string v0, "params_order_id"

    .line 20
    .line 21
    const-string v1, ""

    .line 22
    .line 23
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/hhb0;->w:Ljava/lang/String;

    .line 28
    .line 29
    const-string v0, "params_currency_symbol"

    .line 30
    .line 31
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Ll/hhb0;->x:Ljava/lang/String;

    .line 36
    .line 37
    const-string v0, "params_price"

    .line 38
    .line 39
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Ll/hhb0;->y:Ljava/lang/String;

    .line 44
    .line 45
    const-string v0, "params_privileges"

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_0

    .line 56
    .line 57
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/PrivilegeDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/tantanapp/common/data/JsonAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/JsonAdapter;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    check-cast p1, Ljava/util/List;

    .line 68
    .line 69
    iput-object p1, p0, Ll/hhb0;->z:Ljava/util/List;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :catch_0
    move-exception p1

    .line 73
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 74
    .line 75
    .line 76
    :cond_0
    :goto_0
    iget-object p1, p0, Ll/hhb0;->u:Ll/ahb0;

    .line 77
    .line 78
    iget-object p0, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 79
    .line 80
    invoke-virtual {p1, p0}, Ll/ahb0;->k0(Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 81
    .line 82
    .line 83
    :cond_1
    return-void
.end method

.method public final synthetic w(Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "pageproducttype"

    .line 2
    .line 3
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    filled-new-array {p1}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string p2, "e_pay_result_button"

    .line 12
    .line 13
    const-string v0, "p_pay_result"

    .line 14
    .line 15
    invoke-static {p2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/hhb0;->v:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 19
    .line 20
    const-string p2, "tttSeeWhoLikedMe"

    .line 21
    .line 22
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object p1, p0, Ll/hhb0;->B:Lcom/p1/mobile/putong/core/data/PrivilegeDetail;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p2}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p0}, Ll/hhb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string v0, "purchase_result_see"

    .line 47
    .line 48
    invoke-interface {p2, p0, v0, p1}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->li(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    invoke-virtual {p0}, Ll/hhb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final synthetic x(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hhb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic y(Ljava/lang/String;Landroid/view/View;)V
    .locals 6

    .line 1
    const-string p2, "pageproducttype"

    .line 2
    .line 3
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    filled-new-array {p1}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string p2, "e_pay_feedback"

    .line 12
    .line 13
    const-string v0, "p_pay_result"

    .line 14
    .line 15
    invoke-static {p2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/hhb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0}, Ll/hhb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0}, Ll/hhb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->D7:I

    .line 31
    .line 32
    invoke-virtual {p2, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {p0}, Ll/hhb0;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->E7:I

    .line 41
    .line 42
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->M(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    const/4 v4, 0x1

    .line 51
    const/4 v5, 0x0

    .line 52
    const/4 v3, 0x0

    .line 53
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->k2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZ)Landroid/content/Intent;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final synthetic z()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hhb0;->C:Lcom/p1/mobile/putong/core/ui/result/PurchaseReceivingAnimView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->p0(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/hhb0;->K()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
