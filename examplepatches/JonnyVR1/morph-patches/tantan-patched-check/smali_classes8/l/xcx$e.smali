.class public Ll/xcx$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xcx;->V0(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/xcx;


# direct methods
.method public constructor <init>(Ll/xcx;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/xcx$e;->b:Ll/xcx;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/xcx$e;->a:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xcx$e;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-boolean p1, p0, Ll/xcx$e;->a:Z

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Ll/xcx$e;->b:Ll/xcx;

    .line 7
    .line 8
    invoke-static {p1}, Ll/xcx;->N(Ll/xcx;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Ll/xcx$e;->b:Ll/xcx;

    .line 15
    .line 16
    invoke-static {p1}, Ll/xcx;->F(Ll/xcx;)Lv/VLinear;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-static {}, Ll/gra;->j2()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iget-boolean v1, p0, Ll/xcx$e;->a:Z

    .line 28
    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    iget-object p1, p0, Ll/xcx$e;->b:Ll/xcx;

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-static {p1}, Ll/xcx;->I(Ll/xcx;)Lv/VText;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ll/xcx$e;->b:Ll/xcx;

    .line 44
    .line 45
    invoke-static {p0}, Ll/xcx;->J(Ll/xcx;)Lv/VText;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    invoke-static {p1}, Ll/xcx;->I(Ll/xcx;)Lv/VText;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/xcx$e;->b:Ll/xcx;

    .line 61
    .line 62
    invoke-static {p0}, Ll/xcx;->J(Ll/xcx;)Lv/VText;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    iget-object p1, p0, Ll/xcx$e;->b:Ll/xcx;

    .line 71
    .line 72
    if-eqz v1, :cond_3

    .line 73
    .line 74
    invoke-static {p1}, Ll/xcx;->H(Ll/xcx;)Landroid/widget/TextView;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Ll/xcx$e;->b:Ll/xcx;

    .line 82
    .line 83
    invoke-static {p1}, Ll/xcx;->H(Ll/xcx;)Landroid/widget/TextView;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iget-object p0, p0, Ll/xcx$e;->b:Ll/xcx;

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    sget v0, Lcom/p1/mobile/putong/core/R$string;->V0:I

    .line 94
    .line 95
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_3
    invoke-static {p1}, Ll/xcx;->H(Ll/xcx;)Landroid/widget/TextView;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iget-object v0, p0, Ll/xcx$e;->b:Ll/xcx;

    .line 108
    .line 109
    iget-boolean v0, v0, Ll/xcx;->J0:Z

    .line 110
    .line 111
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Ll/xcx$e;->b:Ll/xcx;

    .line 115
    .line 116
    invoke-static {p1}, Ll/xcx;->H(Ll/xcx;)Landroid/widget/TextView;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    iget-object p0, p0, Ll/xcx$e;->b:Ll/xcx;

    .line 121
    .line 122
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Up:I

    .line 127
    .line 128
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/xcx$e;->a:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/xcx$e;->b:Ll/xcx;

    .line 6
    .line 7
    invoke-static {p0}, Ll/xcx;->F(Ll/xcx;)Lv/VLinear;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
