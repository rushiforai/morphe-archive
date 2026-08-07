.class public Ll/hjf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/cjf;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/cjf;

.field public b:Landroid/widget/ImageView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/FrameLayout;

.field public e:Landroid/content/Context;

.field public f:Lv/AutoVDraweeView;

.field public g:Lv/VImage;

.field public h:Lv/VImage;

.field public i:Lv/VImage;

.field public j:Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;

.field public k:Landroid/view/View;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/widget/TextView;

.field public o:Landroid/widget/ScrollView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hjf;->e:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/hjf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hjf;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/hjf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hjf;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/hjf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hjf;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/hjf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hjf;->l(Landroid/view/View;)V

    return-void
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hjf;->a:Ll/cjf;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cjf;->s0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hjf;->a:Ll/cjf;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cjf;->r0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hjf;->a:Ll/cjf;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cjf;->q0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hjf;->a:Ll/cjf;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cjf;->o0()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hjf;->e:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/cjf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hjf;->a:Ll/cjf;

    .line 2
    .line 3
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hjf;->m:Landroid/widget/TextView;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/hjf;->l:Landroid/widget/TextView;

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hjf;->k:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/cjf;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hjf;->e(Ll/cjf;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget p2, Ll/kec0;->H2:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {p1, p2, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget p2, Ll/adc0;->s6:I

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iput-object p2, p0, Ll/hjf;->k:Landroid/view/View;

    .line 16
    .line 17
    sget p2, Ll/adc0;->C1:I

    .line 18
    .line 19
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    check-cast p2, Landroid/widget/ImageView;

    .line 24
    .line 25
    iput-object p2, p0, Ll/hjf;->b:Landroid/widget/ImageView;

    .line 26
    .line 27
    sget p2, Ll/adc0;->r6:I

    .line 28
    .line 29
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;

    .line 34
    .line 35
    iput-object p2, p0, Ll/hjf;->j:Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;

    .line 36
    .line 37
    sget p2, Ll/adc0;->q6:I

    .line 38
    .line 39
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    check-cast p2, Landroid/widget/FrameLayout;

    .line 44
    .line 45
    iput-object p2, p0, Ll/hjf;->d:Landroid/widget/FrameLayout;

    .line 46
    .line 47
    sget p2, Ll/adc0;->je:I

    .line 48
    .line 49
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    check-cast p2, Landroid/widget/TextView;

    .line 54
    .line 55
    iput-object p2, p0, Ll/hjf;->c:Landroid/widget/TextView;

    .line 56
    .line 57
    sget p2, Ll/adc0;->oe:I

    .line 58
    .line 59
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    check-cast p2, Landroid/widget/TextView;

    .line 64
    .line 65
    iput-object p2, p0, Ll/hjf;->m:Landroid/widget/TextView;

    .line 66
    .line 67
    sget p2, Ll/adc0;->Yc:I

    .line 68
    .line 69
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    check-cast p2, Landroid/widget/TextView;

    .line 74
    .line 75
    iput-object p2, p0, Ll/hjf;->l:Landroid/widget/TextView;

    .line 76
    .line 77
    sget p2, Ll/adc0;->se:I

    .line 78
    .line 79
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    check-cast p2, Lv/AutoVDraweeView;

    .line 84
    .line 85
    iput-object p2, p0, Ll/hjf;->f:Lv/AutoVDraweeView;

    .line 86
    .line 87
    sget p2, Ll/adc0;->Ia:I

    .line 88
    .line 89
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    check-cast p2, Lv/VImage;

    .line 94
    .line 95
    iput-object p2, p0, Ll/hjf;->g:Lv/VImage;

    .line 96
    .line 97
    sget p2, Ll/adc0;->oc:I

    .line 98
    .line 99
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    check-cast p2, Lv/VImage;

    .line 104
    .line 105
    iput-object p2, p0, Ll/hjf;->h:Lv/VImage;

    .line 106
    .line 107
    sget p2, Ll/adc0;->J1:I

    .line 108
    .line 109
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    check-cast p2, Lv/VImage;

    .line 114
    .line 115
    iput-object p2, p0, Ll/hjf;->i:Lv/VImage;

    .line 116
    .line 117
    sget p2, Ll/adc0;->y0:I

    .line 118
    .line 119
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    check-cast p2, Landroid/widget/TextView;

    .line 124
    .line 125
    iput-object p2, p0, Ll/hjf;->n:Landroid/widget/TextView;

    .line 126
    .line 127
    sget p2, Ll/adc0;->Sb:I

    .line 128
    .line 129
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    check-cast p2, Landroid/widget/ScrollView;

    .line 134
    .line 135
    iput-object p2, p0, Ll/hjf;->o:Landroid/widget/ScrollView;

    .line 136
    .line 137
    return-object p1
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hjf;->o:Landroid/widget/ScrollView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0, v0}, Landroid/widget/ScrollView;->scrollTo(II)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hjf;->n:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    xor-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/hjf;->n:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public q(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hjf;->i:Lv/VImage;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hjf;->h:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/djf;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/djf;-><init>(Ll/hjf;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/hjf;->g:Lv/VImage;

    .line 12
    .line 13
    new-instance v1, Ll/ejf;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/ejf;-><init>(Ll/hjf;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/hjf;->i:Lv/VImage;

    .line 22
    .line 23
    new-instance v1, Ll/fjf;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/fjf;-><init>(Ll/hjf;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/hjf;->b:Landroid/widget/ImageView;

    .line 32
    .line 33
    new-instance v1, Ll/gjf;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/gjf;-><init>(Ll/hjf;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public s(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hjf;->f:Lv/AutoVDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hjf;->g:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hjf;->h:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hjf;->l:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    xor-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/hjf;->l:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public x(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hjf;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public y(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hjf;->m:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    xor-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/hjf;->m:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public z(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hjf;->j:Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;

    .line 2
    .line 3
    invoke-virtual {v0, p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;->d(II)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/hjf;->j:Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;

    .line 7
    .line 8
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Ll/hjf;->j:Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;

    .line 15
    .line 16
    const/4 p2, 0x1

    .line 17
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/hjf;->j:Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/hjf;->j:Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpSetInfoProgressView;

    .line 27
    .line 28
    new-array p1, p2, [F

    .line 29
    .line 30
    const/high16 p2, 0x3f800000    # 1.0f

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    aput p2, p1, v0

    .line 34
    .line 35
    const-string p2, "alpha"

    .line 36
    .line 37
    invoke-static {p0, p2, p1}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-wide/16 p1, 0xb4

    .line 42
    .line 43
    invoke-virtual {p0, p1, p2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method
