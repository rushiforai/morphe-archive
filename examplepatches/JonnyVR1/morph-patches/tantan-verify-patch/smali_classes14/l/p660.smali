.class public Ll/p660;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/l660;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/VImage;

.field public c:Lv/VText_NoTopPadding;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VLinear;

.field public final g:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/OriginalSMSConfirmAct;

.field public h:Ll/l660;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/OriginalSMSConfirmAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p660;->g:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/OriginalSMSConfirmAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/p660;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p660;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/p660;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p660;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/p660;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p660;->k(Landroid/view/View;)V

    return-void
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p660;->act()Lcom/p1/mobile/android/app/Act;

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

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p660;->h:Ll/l660;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l660;->h0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p660;->h:Ll/l660;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l660;->n0()V

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
    iget-object p0, p0, Ll/p660;->g:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/OriginalSMSConfirmAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p660;->g:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/OriginalSMSConfirmAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/q660;->b(Ll/p660;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/l660;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/p660;->h:Ll/l660;

    .line 2
    .line 3
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p660;->e:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/p660;->e:Lv/VText;

    .line 8
    .line 9
    const/high16 v1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/p660;->g:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/OriginalSMSConfirmAct;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/l660;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p660;->e(Ll/l660;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p660;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p660;->e:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/p660;->e:Lv/VText;

    .line 8
    .line 9
    const/high16 v1, 0x3f000000    # 0.5f

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/p660;->g:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/OriginalSMSConfirmAct;

    .line 15
    .line 16
    sget v0, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;)Landroid/app/Dialog;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public r()V
    .locals 5

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 7
    .line 8
    sget v2, Lcom/p1/mobile/putong/account/R$string;->t0:I

    .line 9
    .line 10
    iget-object v3, p0, Ll/p660;->h:Ll/l660;

    .line 11
    .line 12
    iget-object v4, v3, Ll/l660;->b:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v3, v3, Ll/l660;->a:Ljava/lang/String;

    .line 15
    .line 16
    filled-new-array {v4, v3}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v2, p0, Ll/p660;->h:Ll/l660;

    .line 32
    .line 33
    iget-object v2, v2, Ll/l660;->b:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    const/16 v2, 0x21

    .line 40
    .line 41
    if-ltz v1, :cond_0

    .line 42
    .line 43
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    .line 44
    .line 45
    const-string v4, "#FE7E1D"

    .line 46
    .line 47
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    invoke-direct {v3, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 52
    .line 53
    .line 54
    iget-object v4, p0, Ll/p660;->h:Ll/l660;

    .line 55
    .line 56
    iget-object v4, v4, Ll/l660;->b:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    add-int/2addr v4, v1

    .line 63
    invoke-virtual {v0, v3, v1, v4, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 64
    .line 65
    .line 66
    new-instance v3, Landroid/text/style/UnderlineSpan;

    .line 67
    .line 68
    invoke-direct {v3}, Landroid/text/style/UnderlineSpan;-><init>()V

    .line 69
    .line 70
    .line 71
    iget-object v4, p0, Ll/p660;->h:Ll/l660;

    .line 72
    .line 73
    iget-object v4, v4, Ll/l660;->b:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    add-int/2addr v4, v1

    .line 80
    invoke-virtual {v0, v3, v1, v4, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 81
    .line 82
    .line 83
    :cond_0
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iget-object v3, p0, Ll/p660;->h:Ll/l660;

    .line 88
    .line 89
    iget-object v3, v3, Ll/l660;->a:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-ltz v1, :cond_1

    .line 96
    .line 97
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    .line 98
    .line 99
    const/high16 v4, -0x1000000

    .line 100
    .line 101
    invoke-direct {v3, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 102
    .line 103
    .line 104
    iget-object v4, p0, Ll/p660;->h:Ll/l660;

    .line 105
    .line 106
    iget-object v4, v4, Ll/l660;->a:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    add-int/2addr v4, v1

    .line 113
    invoke-virtual {v0, v3, v1, v4, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 114
    .line 115
    .line 116
    :cond_1
    iget-object v1, p0, Ll/p660;->d:Lv/VText;

    .line 117
    .line 118
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Ll/p660;->b:Lv/VImage;

    .line 122
    .line 123
    new-instance v1, Ll/m660;

    .line 124
    .line 125
    invoke-direct {v1, p0}, Ll/m660;-><init>(Ll/p660;)V

    .line 126
    .line 127
    .line 128
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Ll/p660;->e:Lv/VText;

    .line 132
    .line 133
    new-instance v1, Ll/n660;

    .line 134
    .line 135
    invoke-direct {v1, p0}, Ll/n660;-><init>(Ll/p660;)V

    .line 136
    .line 137
    .line 138
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Ll/p660;->f:Lv/VLinear;

    .line 142
    .line 143
    new-instance v1, Ll/o660;

    .line 144
    .line 145
    invoke-direct {v1, p0}, Ll/o660;-><init>(Ll/p660;)V

    .line 146
    .line 147
    .line 148
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 149
    .line 150
    .line 151
    return-void
.end method
