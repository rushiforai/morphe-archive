.class public Ll/yfl$c;
.super Ll/k3l;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/yfl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic d:Ll/yfl;


# direct methods
.method public constructor <init>(Ll/yfl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yfl$c;->d:Ll/yfl;

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
    iget-object v0, p0, Ll/yfl$c;->d:Ll/yfl;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/yfl;->k0()Landroid/widget/RelativeLayout;

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
    iget-object v0, p0, Ll/yfl$c;->d:Ll/yfl;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/yfl;->f0()Landroid/view/View;

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
    iget-object v0, p0, Ll/yfl$c;->d:Ll/yfl;

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/yfl;->P(Ll/yfl;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/yfl$c;->d:Ll/yfl;

    .line 27
    .line 28
    invoke-static {v0, v2}, Ll/yfl;->O(Ll/yfl;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/yfl$c;->d:Ll/yfl;

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ll/yfl;->y1(Z)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/yfl$c;->d:Ll/yfl;

    .line 37
    .line 38
    invoke-static {v0}, Ll/yfl;->K(Ll/yfl;)Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/yfl$c;->d:Ll/yfl;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/yfl;->q0()Landroid/widget/FrameLayout;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    iget-object v3, p0, Ll/yfl$c;->d:Ll/yfl;

    .line 57
    .line 58
    invoke-virtual {v3}, Ll/yfl;->s0()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v3, "child"

    .line 70
    .line 71
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-eqz v1, :cond_0

    .line 87
    .line 88
    iget-object v1, p0, Ll/yfl$c;->d:Ll/yfl;

    .line 89
    .line 90
    invoke-virtual {v1}, Ll/yfl;->q0()Landroid/widget/FrameLayout;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 95
    .line 96
    .line 97
    :cond_0
    iget-object v0, p0, Ll/yfl$c;->d:Ll/yfl;

    .line 98
    .line 99
    invoke-static {v0, v2}, Ll/yfl;->L(Ll/yfl;Z)V

    .line 100
    .line 101
    .line 102
    iget-boolean v0, p0, Ll/k3l;->a:Z

    .line 103
    .line 104
    if-nez v0, :cond_1

    .line 105
    .line 106
    iget-boolean v0, p0, Ll/k3l;->b:Z

    .line 107
    .line 108
    if-nez v0, :cond_1

    .line 109
    .line 110
    iget-boolean v0, p0, Ll/k3l;->c:Z

    .line 111
    .line 112
    if-nez v0, :cond_1

    .line 113
    .line 114
    iget-object v0, p0, Ll/yfl$c;->d:Ll/yfl;

    .line 115
    .line 116
    invoke-virtual {v0}, Ll/yfl;->l0()Lv/VButton_FakeShadow;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-eqz v0, :cond_2

    .line 128
    .line 129
    iget-object v0, p0, Ll/yfl$c;->d:Ll/yfl;

    .line 130
    .line 131
    invoke-virtual {v0}, Ll/yfl;->u0()Landroid/widget/LinearLayout;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 136
    .line 137
    .line 138
    iget-object p0, p0, Ll/yfl$c;->d:Ll/yfl;

    .line 139
    .line 140
    invoke-virtual {p0}, Ll/yfl;->x0()Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 145
    .line 146
    .line 147
    :cond_2
    return-void
.end method
