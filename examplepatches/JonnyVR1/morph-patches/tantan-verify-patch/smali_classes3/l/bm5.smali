.class public Ll/bm5;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:I

.field public g:Landroid/content/Context;

.field public h:Landroid/view/View;

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/TextView;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/ImageView;

.field public n:Landroid/widget/ImageView;

.field public o:Landroid/view/View$OnClickListener;

.field public p:Ll/l4g0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x1

    .line 40
    invoke-direct {p0, p1, v0}, Ll/bm5;-><init>(Landroid/content/Context;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/zfc0;->d:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Ll/bm5;->f:I

    .line 7
    .line 8
    iput-object p1, p0, Ll/bm5;->g:Landroid/content/Context;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 12
    .line 13
    .line 14
    new-instance p1, Ll/l4g0;

    .line 15
    .line 16
    iget p2, p0, Ll/bm5;->f:I

    .line 17
    .line 18
    const/4 v0, 0x5

    .line 19
    if-ne p2, v0, :cond_0

    .line 20
    .line 21
    const-string p2, "p_delete_account_policy"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string p2, "p_verification_policy_popup"

    .line 25
    .line 26
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-direct {p1, p2, v0}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Ll/bm5;->p:Ll/l4g0;

    .line 38
    .line 39
    return-void
.end method

.method public static synthetic A(Ll/bm5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bm5;->I()V

    return-void
.end method

.method public static bridge synthetic C(Ll/bm5;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/bm5;->f:I

    return p0
.end method

.method private E()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const v1, 0x1020002

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget v2, Ll/ycc0;->y:I

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Landroid/widget/FrameLayout;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    sget v3, Ll/cbc0;->T:I

    .line 31
    .line 32
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 33
    .line 34
    .line 35
    new-instance v1, Ll/bm5$b;

    .line 36
    .line 37
    invoke-direct {v1, p0, v2}, Ll/bm5$b;-><init>(Ll/bm5;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    new-instance p0, Ll/am5;

    .line 44
    .line 45
    invoke-direct {p0, v0}, Ll/am5;-><init>(Landroid/view/Window;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static F(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    if-eq p0, v0, :cond_1

    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p0, ""

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_1
    :goto_0
    const-string p0, "security_force_verification"

    .line 12
    .line 13
    return-object p0
.end method

.method public static G(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, v0, :cond_0

    .line 3
    .line 4
    const-string p0, "avatar_verification"

    .line 5
    .line 6
    return-object p0

    .line 7
    :cond_0
    const/4 v0, 0x2

    .line 8
    if-ne p0, v0, :cond_1

    .line 9
    .line 10
    const-string p0, "id_verification"

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_1
    const/4 v0, 0x3

    .line 14
    if-ne p0, v0, :cond_2

    .line 15
    .line 16
    const-string p0, "avatar_ability"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_2
    const/4 v0, 0x4

    .line 20
    if-ne p0, v0, :cond_3

    .line 21
    .line 22
    const-string p0, "id_ability"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_3
    const-string p0, ""

    .line 26
    .line 27
    return-object p0
.end method

.method private H()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bm5;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/jec0;->o:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/bm5;->h:Landroid/view/View;

    .line 15
    .line 16
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 17
    .line 18
    const/4 v1, -0x1

    .line 19
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 20
    .line 21
    .line 22
    const/high16 v1, 0x41200000    # 10.0f

    .line 23
    .line 24
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 29
    .line 30
    iget-object v1, p0, Ll/bm5;->h:Landroid/view/View;

    .line 31
    .line 32
    invoke-virtual {p0, v1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/bm5;->h:Landroid/view/View;

    .line 36
    .line 37
    sget v1, Ll/ycc0;->v0:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Landroid/widget/TextView;

    .line 44
    .line 45
    iput-object v0, p0, Ll/bm5;->k:Landroid/widget/TextView;

    .line 46
    .line 47
    iget-object v0, p0, Ll/bm5;->h:Landroid/view/View;

    .line 48
    .line 49
    sget v1, Ll/ycc0;->t0:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Landroid/widget/TextView;

    .line 56
    .line 57
    iput-object v0, p0, Ll/bm5;->l:Landroid/widget/TextView;

    .line 58
    .line 59
    iget-object v0, p0, Ll/bm5;->h:Landroid/view/View;

    .line 60
    .line 61
    sget v1, Ll/ycc0;->w0:I

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Landroid/widget/TextView;

    .line 68
    .line 69
    iput-object v0, p0, Ll/bm5;->i:Landroid/widget/TextView;

    .line 70
    .line 71
    iget-object v0, p0, Ll/bm5;->h:Landroid/view/View;

    .line 72
    .line 73
    sget v1, Ll/ycc0;->u0:I

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Landroid/widget/TextView;

    .line 80
    .line 81
    iput-object v0, p0, Ll/bm5;->j:Landroid/widget/TextView;

    .line 82
    .line 83
    iget-object v0, p0, Ll/bm5;->h:Landroid/view/View;

    .line 84
    .line 85
    sget v1, Ll/ycc0;->M:I

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Landroid/widget/ImageView;

    .line 92
    .line 93
    iput-object v0, p0, Ll/bm5;->m:Landroid/widget/ImageView;

    .line 94
    .line 95
    iget-object v0, p0, Ll/bm5;->h:Landroid/view/View;

    .line 96
    .line 97
    sget v1, Ll/ycc0;->u:I

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Landroid/widget/ImageView;

    .line 104
    .line 105
    iput-object v0, p0, Ll/bm5;->n:Landroid/widget/ImageView;

    .line 106
    .line 107
    iget-object v0, p0, Ll/bm5;->m:Landroid/widget/ImageView;

    .line 108
    .line 109
    new-instance v1, Ll/bm5$a;

    .line 110
    .line 111
    invoke-direct {v1, p0}, Ll/bm5$a;-><init>(Ll/bm5;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Ll/bm5;->l:Landroid/widget/TextView;

    .line 118
    .line 119
    new-instance v1, Ll/yl5;

    .line 120
    .line 121
    invoke-direct {v1, p0}, Ll/yl5;-><init>(Ll/bm5;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Ll/bm5;->k:Landroid/widget/TextView;

    .line 128
    .line 129
    new-instance v1, Ll/zl5;

    .line 130
    .line 131
    invoke-direct {v1, p0}, Ll/zl5;-><init>(Ll/bm5;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0}, Ll/bm5;->L()V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method private synthetic I()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 1

    .line 1
    iget p1, p0, Ll/bm5;->f:I

    .line 2
    .line 3
    const/4 v0, 0x5

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    const-string p1, "e_delete_account_policy_disagree"

    .line 7
    .line 8
    const-string v0, "p_delete_account_policy"

    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/bm5;->dismiss()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 2

    .line 1
    iget v0, p0, Ll/bm5;->f:I

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const-string v0, "e_delete_account_policy_agree"

    .line 7
    .line 8
    const-string v1, "p_delete_account_policy"

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v0, "e_verification_policy_popup_agree"

    .line 15
    .line 16
    const-string v1, "p_verification_policy_popup"

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :goto_0
    iget-object p0, p0, Ll/bm5;->o:Landroid/view/View$OnClickListener;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method private M()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, -0x1

    .line 6
    invoke-virtual {p0, v0, v0}, Landroid/view/Window;->setLayout(II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic x(Ll/bm5;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bm5;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Ll/bm5;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bm5;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Landroid/view/Window;)V
    .locals 1

    .line 1
    sget v0, Ll/zfc0;->e:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public D(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bm5;->o:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public final L()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/bm5;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    iget v2, p0, Ll/bm5;->f:I

    .line 13
    .line 14
    const/4 v3, 0x1

    .line 15
    const-string v4, "https://www.volcengine.com/docs/6973/152875\n\n"

    .line 16
    .line 17
    const-string v5, "https://cosmos.immomo.com/\n\n"

    .line 18
    .line 19
    const-string v6, "\n\n"

    .line 20
    .line 21
    const-string v7, "https://privacy.qq.com/document/preview/4661fcc5ceb04a4f878a5874c86b34a2\n"

    .line 22
    .line 23
    const-string v8, "https://terms.aliyun.com/legal-agreement/terms/suit_bu1_ali_cloud/suit_bu1_ali_cloud202107281509_18386.html?spm=a2c4g.11186623.0.0.37c330e5LyeciZ\n\n"

    .line 24
    .line 25
    const-string v9, "\n"

    .line 26
    .line 27
    if-ne v2, v3, :cond_0

    .line 28
    .line 29
    iget-object v2, p0, Ll/bm5;->i:Landroid/widget/TextView;

    .line 30
    .line 31
    sget v3, Lcom/p1/mobile/putong/common/R$string;->a3:I

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 34
    .line 35
    .line 36
    sget v2, Lcom/p1/mobile/putong/common/R$string;->K2:I

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    sget v2, Lcom/p1/mobile/putong/common/R$string;->R2:I

    .line 49
    .line 50
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    sget v2, Lcom/p1/mobile/putong/common/R$string;->M2:I

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    sget v2, Lcom/p1/mobile/putong/common/R$string;->O2:I

    .line 73
    .line 74
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    sget v2, Lcom/p1/mobile/putong/common/R$string;->Q2:I

    .line 85
    .line 86
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    sget v2, Lcom/p1/mobile/putong/common/R$string;->T2:I

    .line 97
    .line 98
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    sget v2, Lcom/p1/mobile/putong/common/R$string;->L2:I

    .line 109
    .line 110
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    goto/16 :goto_0

    .line 118
    .line 119
    :cond_0
    const/4 v3, 0x2

    .line 120
    if-ne v2, v3, :cond_1

    .line 121
    .line 122
    iget-object v2, p0, Ll/bm5;->i:Landroid/widget/TextView;

    .line 123
    .line 124
    sget v3, Lcom/p1/mobile/putong/common/R$string;->b3:I

    .line 125
    .line 126
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 127
    .line 128
    .line 129
    sget v2, Lcom/p1/mobile/putong/common/R$string;->U2:I

    .line 130
    .line 131
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    sget v2, Lcom/p1/mobile/putong/common/R$string;->R2:I

    .line 142
    .line 143
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    sget v2, Lcom/p1/mobile/putong/common/R$string;->M2:I

    .line 154
    .line 155
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    sget v2, Lcom/p1/mobile/putong/common/R$string;->V2:I

    .line 166
    .line 167
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    sget v2, Lcom/p1/mobile/putong/common/R$string;->Q2:I

    .line 178
    .line 179
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    sget v2, Lcom/p1/mobile/putong/common/R$string;->T2:I

    .line 190
    .line 191
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    sget v2, Lcom/p1/mobile/putong/common/R$string;->L2:I

    .line 202
    .line 203
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :cond_1
    const/4 v3, 0x3

    .line 213
    const-string v4, "https://miniprogram-kyc.tencentcloudapi.com/s/h5/protocolTencent.html\n"

    .line 214
    .line 215
    if-ne v2, v3, :cond_2

    .line 216
    .line 217
    iget-object v2, p0, Ll/bm5;->i:Landroid/widget/TextView;

    .line 218
    .line 219
    sget v3, Lcom/p1/mobile/putong/common/R$string;->Z2:I

    .line 220
    .line 221
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 222
    .line 223
    .line 224
    sget v2, Lcom/p1/mobile/putong/common/R$string;->P2:I

    .line 225
    .line 226
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v2

    .line 230
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    sget v2, Lcom/p1/mobile/putong/common/R$string;->S2:I

    .line 237
    .line 238
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    sget v2, Lcom/p1/mobile/putong/common/R$string;->N2:I

    .line 249
    .line 250
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    sget v2, Lcom/p1/mobile/putong/common/R$string;->O2:I

    .line 261
    .line 262
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v0

    .line 266
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    goto :goto_0

    .line 270
    :cond_2
    const/4 v3, 0x4

    .line 271
    if-ne v2, v3, :cond_3

    .line 272
    .line 273
    iget-object v2, p0, Ll/bm5;->i:Landroid/widget/TextView;

    .line 274
    .line 275
    sget v3, Lcom/p1/mobile/putong/common/R$string;->b3:I

    .line 276
    .line 277
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 278
    .line 279
    .line 280
    sget v2, Lcom/p1/mobile/putong/common/R$string;->W2:I

    .line 281
    .line 282
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v2

    .line 286
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    .line 288
    .line 289
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    sget v2, Lcom/p1/mobile/putong/common/R$string;->Y2:I

    .line 293
    .line 294
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object v2

    .line 298
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 302
    .line 303
    .line 304
    sget v2, Lcom/p1/mobile/putong/common/R$string;->X2:I

    .line 305
    .line 306
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v2

    .line 310
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    sget v2, Lcom/p1/mobile/putong/common/R$string;->V2:I

    .line 317
    .line 318
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object v0

    .line 322
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 323
    .line 324
    .line 325
    goto :goto_0

    .line 326
    :cond_3
    const/4 v0, 0x5

    .line 327
    if-ne v2, v0, :cond_4

    .line 328
    .line 329
    iget-object v0, p0, Ll/bm5;->i:Landroid/widget/TextView;

    .line 330
    .line 331
    const-string v2, "\u63a2\u63a2\u8d26\u53f7\u6ce8\u9500\u534f\u8bae"

    .line 332
    .line 333
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 334
    .line 335
    .line 336
    const-string v0, "\u5728\u60a8\u6ce8\u9500\u63a2\u63a2\u8d26\u53f7\u4e4b\u524d\uff0c\u8bf7\u5145\u5206\u9605\u8bfb\u3001\u7406\u89e3\u5e76\u540c\u610f\u672c\u534f\u8bae\uff1a\n\n1.\u3010\u7279\u522b\u63d0\u793a\u3011\u6ce8\u9500\u63a2\u63a2\u8d26\u53f7\u4e3a\u4e0d\u53ef\u6062\u590d\u7684\u64cd\u4f5c\uff0c\u8d26\u53f7\u6ce8\u9500\u540e\u60a8\u65e0\u6cd5\u767b\u5f55\u3001\u4f7f\u7528\u672c\u63a2\u63a2\u8d26\u53f7\uff0c\u4e5f\u65e0\u6cd5\u627e\u672c\u63a2\u63a2\u8d26\u53f7\u4e2d\u53ca\u4e0e\u8d26\u53f7\u76f8\u5173\u7684\u4efb\u4f55\u5185\u5bb9\u6216\u4fe1\u606f\uff08\u5373\u65f6\u60a8\u4f7f\u7528\u76f8\u540c\u7684\u624b\u673a\u53f7\u7801\u6216\u7b2c\u4e09\u65b9\u8d26\u6237\u518d\u6b21\u6ce8\u518c\u6216\u6388\u6743\u767b\u5f55\u5e76\u4f7f\u7528\u63a2\u63a2\uff09\uff0c\u5305\u62ec\u4f46\u4e0d\u9650\u4e8e\uff1a\n\u60a8\u5df2\u63d0\u4ea4\u7684\u771f\u5b9e\u8eab\u4efd\u4fe1\u606f\u3001\u8d26\u53f7\u4e2d\u586b\u5199\u7684\u4e2a\u4eba\u4fe1\u606f\u3001\u4ea4\u6613\u8bb0\u5f55\u3001\u7ed1\u5b9a\u7684\u94f6\u884c\u5361\u3001\u63a2\u63a2\u597d\u53cb\u5173\u7cfb\u7b49\u4fe1\u606f\uff1b\n\u60a8\u7684\u914d\u5bf9\u4fe1\u606f\u3001\u53d1\u5e03\u7684\u52a8\u6001\u3001\u70b9\u8d5e\u3001\u8bc4\u8bba\u3001\u8f6c\u53d1\u3001\u4e92\u52a8\u3001\u5173\u6ce8\u3001\u7c89\u4e1d\u7b49\u5185\u5bb9\u6570\u636e\uff1b\n\u4e0e\u672c\u63a2\u63a2\u8d26\u6237\u7ed1\u5b9a\u7684\u624b\u673a\u53f7\u7801/\u5fae\u4fe1\u53f7\u7801\u7b49\u5c06\u4f1a\u89e3\u7ed1\uff1b\n\u901a\u8fc7\u4f7f\u7528\u63a2\u63a2\u670d\u52a1\u83b7\u5f97\u7684\u8d44\u4ea7\u6216\u865a\u62df\u6743\u76ca\u7b49\u8d22\u4ea7\u6027\u5229\u76ca\uff08\u5305\u62ec\u4e0d\u9650\u4e8e\u63a2\u63a2\u94b1\u5305\u4f59\u989d\u3001\u76f4\u64ad\u6536\u76ca\u3001\u865a\u62df\u793c\u7269\u6536\u76ca\u3001\u5c1a\u672a\u5230\u671f\u6216\u5c1a\u672a\u4f7f\u7528\u5b8c\u6bd5\u7684\u4f1a\u5458\u670d\u52a1\u53ca\u589e\u503c\u670d\u52a1\u7b49\uff09\uff0c\u60a8\u53ef\u4ee5\u9009\u62e9\u63d0\u73b0\u3001\u4f7f\u7528\u5b8c\u6bd5\u4ed8\u8d39\u670d\u52a1\u540e\u8fdb\u884c\u6ce8\u9500\u6216\u540c\u610f\u653e\u5f03\u540e\u8fdb\u884c\u6ce8\u9500\u3002\u5176\u4e2d\u63a2\u63a2\u5e01\u4e0d\u53ef\u63d0\u73b0\uff0c\u60a8\u53ef\u4ee5\u8fdb\u884c\u6d88\u8d39\u540e\u518d\u8fdb\u884c\u6ce8\u9500\uff0c\u5982\u76f4\u63a5\u6ce8\u9500\u5219\u89c6\u4e3a\u60a8\u540c\u610f\u653e\u5f03\uff0c\u5c06\u65e0\u6cd5\u7ee7\u7eed\u4f7f\u7528\u3002\u60a8\u7406\u89e3\u5e76\u540c\u610f\uff0c\u60a8\u653e\u5f03\u7684\u524d\u8ff0\u8d22\u4ea7\u6027\u5229\u76ca\u63a2\u63a2\u65e0\u6cd5\u534f\u52a9\u60a8\u6062\u590d\u4e5f\u65e0\u6cd5\u627e\u56de\u8d26\u53f7\u76f8\u5173\u7684\u4efb\u4f55\u5185\u5bb9\u6216\u4fe1\u606f\u3002\n2.\u82e5\u60a8\u662fApp Store\u81ea\u52a8\u7eed\u8d39\u7528\u6237\u60a8\u5e94\u5728\u672c\u8d26\u6237\u6ce8\u9500\u524d\u524d\u5f80iTunes\u5546\u5e97\u5185\u624b\u52a8\u53d6\u6d88\u7eed\u8d39\u670d\u52a1\uff0c\u82e5\u60a8\u662f\u5176\u4ed6\u81ea\u52a8\u7eed\u8d39\u7528\u6237\u5219\u672c\u8d26\u6237\u6ce8\u9500\u540e\u5c06\u81ea\u52a8\u5173\u95ed\u7eed\u8d39\u670d\u52a1\uff1b\n3.\u63a2\u63a2\u8d26\u53f7\u6ce8\u9500\u5c06\u5bfc\u81f4\u63a2\u63a2\u6839\u636e\u300a\u7528\u6237\u534f\u8bae\u300b\u53ca\u300a\u9690\u79c1\u653f\u7b56\u300b\u7b49\u7ea6\u5b9a\u7ec8\u6b62\u4e3a\u60a8\u63d0\u4f9b\u670d\u52a1\uff0c\u53cc\u65b9\u6743\u5229\u4e49\u52a1\u7ec8\u6b62\uff0c\u6ce8\u9500\u5b8c\u6210\u540e\uff0c\u63a2\u63a2\u5c06\u6839\u636e\u6cd5\u5f8b\u6cd5\u89c4\u7684\u8981\u6c42\u5220\u9664\u60a8\u7684\u6240\u6709\u4fe1\u606f\u6216\u5c06\u5176\u533f\u540d\u5316\u5904\u7406\uff08\u6cd5\u5f8b\u6cd5\u89c4\u53e6\u6709\u89c4\u5b9a\u7684\u9664\u5916\uff09\uff1b\n4. \u5728\u60a8\u7684\u63a2\u63a2\u8d26\u53f7\u6ce8\u9500\u671f\u9650\uff0c\u82e5\u60a8\u7684\u8d26\u53f7\u6d89\u53ca\u4e89\u8bae\u7ea0\u7eb7\uff0c\u5305\u62ec\u4f46\u4e0d\u9650\u4e8e\uff1a\u6295\u8bc9\u3001\u4e3e\u62a5\u3001\u8bc9\u8bbc\u3001\u4ef2\u88c1\u3001\u53f8\u6cd5\u7a0e\u52a1\u6216\u884c\u653f\u7b49\u56fd\u5bb6\u6743\u529b\u673a\u5173\u7684\u8c03\u67e5\u7b49\uff0c\u60a8\u7406\u89e3\u5e76\u540c\u610f\uff0c\u63a2\u63a2\u5c06\u6709\u6743\u6682\u505c\u60a8\u7684\u8d26\u6237\u7684\u6ce8\u9500\u7a0b\u5e8f\u76f4\u81f3\u4e89\u8bae\u7ea0\u7eb7\u89e3\u51b3\uff1b\n5.\u6ce8\u9500\u672c\u63a2\u63a2\u8d26\u53f7\u5e76\u4e0d\u4ee3\u8868\u672c\u63a2\u63a2\u8d26\u53f7\u6ce8\u9500\u524d\u7684\u8d26\u53f7\u884c\u4e3a\u548c\u76f8\u5173\u8d23\u4efb\u7684\u5230\u8c41\u514d\u6216\u51cf\u8f7b\u3002\n"

    .line 337
    .line 338
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 339
    .line 340
    .line 341
    iget-object v0, p0, Ll/bm5;->n:Landroid/widget/ImageView;

    .line 342
    .line 343
    sget v2, Ll/cbc0;->P:I

    .line 344
    .line 345
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 346
    .line 347
    .line 348
    :cond_4
    :goto_0
    iget-object p0, p0, Ll/bm5;->j:Landroid/widget/TextView;

    .line 349
    .line 350
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object v0

    .line 354
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 355
    .line 356
    .line 357
    return-void
.end method

.method public dismiss()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bm5;->p:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/bm5;->p:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Ll/bm5;->f:I

    .line 12
    .line 13
    const/4 v1, 0x5

    .line 14
    if-eq v0, v1, :cond_0

    .line 15
    .line 16
    const-string v0, "e_verification_policy_popup_disagree"

    .line 17
    .line 18
    const-string v1, "p_verification_policy_popup"

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget v1, Ll/zfc0;->b:I

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/xl5;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/xl5;-><init>(Ll/bm5;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/bm5;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/bm5;->H()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ll/bm5;->M()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onStart()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/bm5;->p:Ll/l4g0;

    .line 5
    .line 6
    iget v1, p0, Ll/bm5;->f:I

    .line 7
    .line 8
    invoke-static {v1}, Ll/bm5;->G(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "verification_type"

    .line 13
    .line 14
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget v2, p0, Ll/bm5;->f:I

    .line 19
    .line 20
    invoke-static {v2}, Ll/bm5;->F(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const-string v3, "verification_scene"

    .line 25
    .line 26
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/bm5;->p:Ll/l4g0;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/l4g0;->c()V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/bm5;->p:Ll/l4g0;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/l4g0;->r()V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/bm5;->h:Landroid/view/View;

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Landroid/view/ViewGroup;

    .line 54
    .line 55
    invoke-static {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->getState()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    const/4 v1, 0x3

    .line 64
    if-eq v0, v1, :cond_0

    .line 65
    .line 66
    invoke-virtual {p0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 67
    .line 68
    .line 69
    :cond_0
    return-void
.end method

.method public show()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/bm5;->E()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
