.class public Ll/mie;
.super Ll/wj2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/wj2<",
        "Ll/lie;",
        ">;"
    }
.end annotation


# instance fields
.field public e:Lv/navigationbar/VNavigationBar;

.field public f:Lv/VLinear;

.field public g:Lv/VDraweeView;

.field public h:Lv/VText;

.field public i:Lv/VRecyclerView;

.field public j:Ll/bie;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/wj2;-><init>(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bie;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/bie;-><init>(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/mie;->j:Ll/bie;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/mie;->j:Ll/bie;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bie;->Z()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mie;->j:Ll/bie;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bie;->g0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mie;->f:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/mie;->i:Lv/VRecyclerView;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 14
    .line 15
    iget-object v1, p0, Ll/mie;->g:Lv/VDraweeView;

    .line 16
    .line 17
    sget v2, Ll/ibc0;->o1:I

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/mie;->h:Lv/VText;

    .line 23
    .line 24
    const-string v0, "\u6682\u65f6\u6ca1\u6709\u65b0\u7684\u5c0f\u7eb8\u6761\u6d88\u606f"

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public f(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->Z1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/wj2;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Ll/wj2;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

    .line 19
    .line 20
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->setSelectTag(Ljava/lang/Boolean;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method public i()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->Z1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Lcom/p1/mobile/android/ui/bubble/a;

    .line 15
    .line 16
    iget-object v2, p0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 17
    .line 18
    invoke-direct {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    const-string v2, "\u53ef\u8bbe\u7f6e\u4eca\u65e5\u662f\u5426\u63a5\u6536\u62db\u547c"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object v2, p0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 28
    .line 29
    sget v3, Ll/g9c0;->o:I

    .line 30
    .line 31
    invoke-static {v2, v3}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    filled-new-array {v2}, [I

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    sget v2, Ll/g9c0;->q:I

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->G(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    const/4 v2, 0x1

    .line 50
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->t(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const/high16 v2, 0x41600000    # 14.0f

    .line 55
    .line 56
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const/4 v2, 0x0

    .line 61
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    const-wide/16 v2, 0x1388

    .line 70
    .line 71
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    sget v2, Ll/qa00;->i:I

    .line 76
    .line 77
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->w(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    sget v2, Ll/zvk;->A:I

    .line 82
    .line 83
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 88
    .line 89
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-nez v2, :cond_1

    .line 98
    .line 99
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jj()Z

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    if-eqz v2, :cond_2

    .line 112
    .line 113
    :cond_1
    const-string v2, "\u53ef\u8bbe\u7f6e\u4eca\u65e5\u662f\u5426\u63a5\u6536\u544a\u767d"

    .line 114
    .line 115
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 116
    .line 117
    .line 118
    :cond_2
    iget-object p0, p0, Ll/wj2;->c:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

    .line 119
    .line 120
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

    .line 121
    .line 122
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/android/ui/bubble/d;->t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 126
    .line 127
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/j;->R:Ll/jxd0;

    .line 130
    .line 131
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 132
    .line 133
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/mie;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/mie;->e:Lv/navigationbar/VNavigationBar;

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ll/wj2;->c(Lv/navigationbar/VNavigationBar;)V

    .line 8
    .line 9
    .line 10
    return-object p1
.end method

.method public j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/nie;->b(Ll/mie;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k()V
    .locals 0

    .line 1
    return-void
.end method

.method public l(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/mie;->f:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/mie;->i:Lv/VRecyclerView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/mie;->j:Ll/bie;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/bie;->l0(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mie;->i:Lv/VRecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/mie;->i:Lv/VRecyclerView;

    .line 8
    .line 9
    iget-object p0, p0, Ll/mie;->j:Ll/bie;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
