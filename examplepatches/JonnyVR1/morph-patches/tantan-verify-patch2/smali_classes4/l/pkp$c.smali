.class public Ll/pkp$c;
.super Ll/k3l;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/pkp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic d:Ll/pkp;


# direct methods
.method public constructor <init>(Ll/pkp;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pkp$c;->d:Ll/pkp;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/k3l;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pkp$c;->d:Ll/pkp;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/pkp;->g0()Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/pkp$c;->d:Ll/pkp;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/pkp;->b0()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/pkp$c;->d:Ll/pkp;

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/pkp;->Q(Ll/pkp;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/pkp$c;->d:Ll/pkp;

    .line 27
    .line 28
    invoke-static {v0, v2}, Ll/pkp;->P(Ll/pkp;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/pkp$c;->d:Ll/pkp;

    .line 32
    .line 33
    invoke-static {v0}, Ll/pkp;->N(Ll/pkp;)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/pkp$c;->d:Ll/pkp;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/pkp;->l0()Landroid/widget/FrameLayout;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    iget-object v3, p0, Ll/pkp$c;->d:Ll/pkp;

    .line 52
    .line 53
    invoke-virtual {v3}, Ll/pkp;->n0()Ll/avl;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-interface {v3}, Ll/avl;->getRealView()Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v3, "child"

    .line 69
    .line 70
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_0

    .line 86
    .line 87
    iget-object v1, p0, Ll/pkp$c;->d:Ll/pkp;

    .line 88
    .line 89
    invoke-virtual {v1}, Ll/pkp;->l0()Landroid/widget/FrameLayout;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 94
    .line 95
    .line 96
    :cond_0
    iget-object v0, p0, Ll/pkp$c;->d:Ll/pkp;

    .line 97
    .line 98
    invoke-static {v0, v2}, Ll/pkp;->O(Ll/pkp;Z)V

    .line 99
    .line 100
    .line 101
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_1

    .line 106
    .line 107
    iget-object v0, p0, Ll/pkp$c;->d:Ll/pkp;

    .line 108
    .line 109
    invoke-virtual {v0}, Ll/pkp;->q0()Landroid/widget/LinearLayout;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Ll/pkp$c;->d:Ll/pkp;

    .line 117
    .line 118
    invoke-virtual {p0}, Ll/pkp;->t0()Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    :cond_1
    return-void
.end method
