.class public Ll/jcp;
.super Ll/lke0;
.source "SourceFile"


# instance fields
.field public h:Ll/ahe0;

.field public i:Lv/TickerView;

.field public j:J


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/lke0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->h:Lv/VDraweeView;

    .line 5
    .line 6
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->h:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    instance-of v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    const/high16 v0, 0x425c0000    # 55.0f

    .line 23
    .line 24
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 29
    .line 30
    iput v0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 31
    .line 32
    move-object v0, p0

    .line 33
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 34
    .line 35
    const/high16 v1, 0x41400000    # 12.0f

    .line 36
    .line 37
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->h:Lv/VDraweeView;

    .line 45
    .line 46
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    const/high16 p0, 0x40c00000    # 6.0f

    .line 50
    .line 51
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->h:Lv/VDraweeView;

    .line 56
    .line 57
    invoke-virtual {v0, p0, p0, p0, p0}, Landroid/view/View;->setPadding(IIII)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->q:Landroid/view/View;

    .line 61
    .line 62
    sget v0, Ll/qa00;->e:I

    .line 63
    .line 64
    invoke-static {p0, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->q:Landroid/view/View;

    .line 68
    .line 69
    invoke-static {p0, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 70
    .line 71
    .line 72
    :cond_1
    return-void
.end method

.method public static synthetic N(Ll/jcp;Ljava/lang/Integer;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jcp;->Q(Ljava/lang/Integer;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method


# virtual methods
.method public L()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/lke0;->L()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/jcp;->O()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/jcp;->P()V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->B5()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    const/4 v3, 0x0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    iget-object v0, v1, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->q:Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/lke0;->C()Ll/lke0$a;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v1}, Ll/lke0$a;->c()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-lez v1, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move v2, v3

    .line 38
    :goto_0
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->o:Lv/VText_AutoFit;

    .line 44
    .line 45
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_1
    iget-object v0, v1, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->o:Lv/VText_AutoFit;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/lke0;->C()Ll/lke0$a;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-interface {v1}, Ll/lke0$a;->d()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-le v1, v2, :cond_2

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    move v2, v3

    .line 63
    :goto_1
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->q:Landroid/view/View;

    .line 69
    .line 70
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    :goto_2
    invoke-virtual {p0}, Ll/lke0;->C()Ll/lke0$a;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-interface {v0}, Ll/lke0$a;->d()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    invoke-virtual {p0}, Ll/lke0;->C()Ll/lke0$a;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-interface {v1}, Ll/lke0$a;->c()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    invoke-virtual {p0, v0, v1}, Ll/jcp;->S(II)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ll/jcp;->R()V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public M()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/lke0;->M()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->f:Landroid/view/View;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->f:Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->g:Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->g:Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;

    .line 36
    .line 37
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-static {}, Ll/cri0;->k()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final O()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->B5()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/n6;->b:Ll/u4;

    .line 12
    .line 13
    instance-of v0, v0, Ll/vqo;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->g:Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->k:Landroid/view/ViewStub;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;

    .line 30
    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->g:Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;

    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->g:Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;

    .line 36
    .line 37
    const/16 v1, 0x2ee

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;->d(I)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->g:Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;

    .line 45
    .line 46
    const/4 v1, 0x1

    .line 47
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->g:Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;

    .line 53
    .line 54
    new-instance v1, Ll/icp;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/icp;-><init>(Ll/jcp;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;->setOnNext(Ll/z20;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/jcp;->R()V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->g:Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;

    .line 68
    .line 69
    const/4 v0, 0x4

    .line 70
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;->l(I)V

    .line 71
    .line 72
    .line 73
    :cond_1
    return-void
.end method

.method public final P()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->f:Landroid/view/View;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->l:Landroid/view/ViewStub;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->f:Landroid/view/View;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->f:Landroid/view/View;

    .line 18
    .line 19
    iget-object v1, p0, Ll/jcp;->i:Lv/TickerView;

    .line 20
    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    sget v1, Ll/adc0;->X5:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    move-object v4, v1

    .line 30
    check-cast v4, Landroid/widget/ImageView;

    .line 31
    .line 32
    sget v1, Ll/adc0;->Yd:I

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lv/TickerView;

    .line 39
    .line 40
    iput-object v1, p0, Ll/jcp;->i:Lv/TickerView;

    .line 41
    .line 42
    sget v1, Ll/adc0;->k5:I

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    move-object v5, v1

    .line 49
    check-cast v5, Landroid/widget/ImageView;

    .line 50
    .line 51
    sget v1, Ll/adc0;->l5:I

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    move-object v6, v1

    .line 58
    check-cast v6, Landroid/widget/ImageView;

    .line 59
    .line 60
    sget v1, Ll/adc0;->m5:I

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    move-object v7, v1

    .line 67
    check-cast v7, Landroid/widget/ImageView;

    .line 68
    .line 69
    sget v1, Ll/adc0;->n5:I

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    move-object v8, v1

    .line 76
    check-cast v8, Landroid/widget/ImageView;

    .line 77
    .line 78
    new-instance v2, Ll/ahe0;

    .line 79
    .line 80
    iget-object v1, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 81
    .line 82
    iget-object v3, v1, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->h:Lv/VDraweeView;

    .line 83
    .line 84
    iget-object v9, p0, Ll/jcp;->i:Lv/TickerView;

    .line 85
    .line 86
    invoke-direct/range {v2 .. v9}, Ll/ahe0;-><init>(Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Lv/TickerView;)V

    .line 87
    .line 88
    .line 89
    iput-object v2, p0, Ll/jcp;->h:Ll/ahe0;

    .line 90
    .line 91
    invoke-virtual {p0}, Ll/lke0;->C()Ll/lke0$a;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-interface {v1}, Ll/lke0$a;->d()I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    invoke-virtual {p0}, Ll/lke0;->C()Ll/lke0$a;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-interface {v2}, Ll/lke0$a;->c()I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    invoke-virtual {p0, v1, v2}, Ll/jcp;->S(II)V

    .line 108
    .line 109
    .line 110
    :cond_1
    const/4 p0, 0x0

    .line 111
    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public final synthetic Q(Ljava/lang/Integer;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n6;->b:Ll/u4;

    .line 2
    .line 3
    check-cast v0, Ll/vqo;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/n6;->f()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1, p2}, Ll/vqo;->w(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iget-object p0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->y:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-static {p0, p2, p1}, Ll/cri0;->i(Landroid/widget/TextView;Ljava/lang/CharSequence;I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final R()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->g:Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->t5()Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v2, 0x0

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    iget-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 28
    .line 29
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_1

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/4 v0, 0x0

    .line 47
    :goto_0
    iget-object v1, p0, Ll/n6;->b:Ll/u4;

    .line 48
    .line 49
    invoke-virtual {v1}, Ll/u4;->k()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Ll/bkj0;

    .line 54
    .line 55
    iget-object v1, v1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 58
    .line 59
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->h:Ljava/util/List;

    .line 60
    .line 61
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eqz v3, :cond_2

    .line 66
    .line 67
    iget-object p0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->g:Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;

    .line 70
    .line 71
    invoke-static {p0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_4

    .line 80
    .line 81
    move v0, v2

    .line 82
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    if-ge v0, v3, :cond_4

    .line 87
    .line 88
    invoke-static {}, Ll/b8d0;->b()Ll/b8d0;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-virtual {v3}, Ll/b8d0;->f()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    check-cast v4, Lcom/p1/mobile/putong/data/User;

    .line 101
    .line 102
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 103
    .line 104
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    if-eqz v3, :cond_3

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_4
    const/4 v0, -0x1

    .line 115
    :goto_2
    if-ltz v0, :cond_5

    .line 116
    .line 117
    if-eqz v0, :cond_5

    .line 118
    .line 119
    invoke-static {v1, v2, v0}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 120
    .line 121
    .line 122
    :cond_5
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 123
    .line 124
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->g:Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;

    .line 125
    .line 126
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;->i(Ljava/util/List;)V

    .line 127
    .line 128
    .line 129
    iget-object p0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 130
    .line 131
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->g:Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;

    .line 132
    .line 133
    const/4 v0, 0x1

    .line 134
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public final S(II)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/jcp;->i:Lv/TickerView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->B5()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_7

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/lke0;->C()Ll/lke0$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Ll/lke0$a;->d()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    goto/16 :goto_1

    .line 31
    .line 32
    :cond_1
    iget-object v0, p0, Ll/jcp;->i:Lv/TickerView;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/jcp;->i:Lv/TickerView;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/n6;->f()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    const/4 v3, 0x2

    .line 53
    const/high16 v4, 0x41a00000    # 20.0f

    .line 54
    .line 55
    invoke-static {v3, v4, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    invoke-virtual {v0, v2}, Lv/TickerView;->setTextSize(F)V

    .line 60
    .line 61
    .line 62
    iget-wide v2, p0, Ll/jcp;->j:J

    .line 63
    .line 64
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Ljava/lang/Long;

    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 77
    .line 78
    .line 79
    move-result-wide v4

    .line 80
    cmp-long v0, v2, v4

    .line 81
    .line 82
    if-gez v0, :cond_4

    .line 83
    .line 84
    if-lez p2, :cond_2

    .line 85
    .line 86
    const/16 p2, 0x320

    .line 87
    .line 88
    if-lt p1, p2, :cond_2

    .line 89
    .line 90
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 93
    .line 94
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers;->o0:Ll/vxd0;

    .line 95
    .line 96
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Ljava/lang/Integer;

    .line 101
    .line 102
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-ge v0, p2, :cond_3

    .line 107
    .line 108
    :cond_2
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 109
    .line 110
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 111
    .line 112
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreLikers;->o0:Ll/vxd0;

    .line 113
    .line 114
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    check-cast p2, Ljava/lang/Integer;

    .line 119
    .line 120
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 121
    .line 122
    .line 123
    move-result p2

    .line 124
    if-le p1, p2, :cond_4

    .line 125
    .line 126
    :cond_3
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 127
    .line 128
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 129
    .line 130
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 131
    .line 132
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    check-cast p2, Ljava/lang/Long;

    .line 137
    .line 138
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 139
    .line 140
    .line 141
    move-result-wide v0

    .line 142
    iput-wide v0, p0, Ll/jcp;->j:J

    .line 143
    .line 144
    iget-object p0, p0, Ll/jcp;->h:Ll/ahe0;

    .line 145
    .line 146
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 147
    .line 148
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 149
    .line 150
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreLikers;->o0:Ll/vxd0;

    .line 151
    .line 152
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object p2

    .line 156
    check-cast p2, Ljava/lang/Integer;

    .line 157
    .line 158
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 159
    .line 160
    .line 161
    move-result p2

    .line 162
    invoke-virtual {p0, p2, p1}, Ll/ahe0;->E(II)V

    .line 163
    .line 164
    .line 165
    goto :goto_0

    .line 166
    :cond_4
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 167
    .line 168
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 169
    .line 170
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreLikers;->o0:Ll/vxd0;

    .line 171
    .line 172
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    check-cast p2, Ljava/lang/Integer;

    .line 177
    .line 178
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 179
    .line 180
    .line 181
    move-result p2

    .line 182
    if-lt p1, p2, :cond_5

    .line 183
    .line 184
    iget-object p2, p0, Ll/jcp;->h:Ll/ahe0;

    .line 185
    .line 186
    if-eqz p2, :cond_5

    .line 187
    .line 188
    invoke-virtual {p2}, Ll/ahe0;->r()Z

    .line 189
    .line 190
    .line 191
    move-result p2

    .line 192
    if-nez p2, :cond_6

    .line 193
    .line 194
    :cond_5
    iget-object p2, p0, Ll/jcp;->i:Lv/TickerView;

    .line 195
    .line 196
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 197
    .line 198
    .line 199
    iget-object p2, p0, Ll/jcp;->i:Lv/TickerView;

    .line 200
    .line 201
    invoke-static {p1}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-virtual {p2, v0}, Lv/TickerView;->n(Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    iget-object p2, p0, Ll/jcp;->h:Ll/ahe0;

    .line 209
    .line 210
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    move-result p2

    .line 214
    if-eqz p2, :cond_6

    .line 215
    .line 216
    iget-object p2, p0, Ll/jcp;->h:Ll/ahe0;

    .line 217
    .line 218
    invoke-virtual {p2}, Ll/ahe0;->r()Z

    .line 219
    .line 220
    .line 221
    move-result p2

    .line 222
    if-eqz p2, :cond_6

    .line 223
    .line 224
    iget-object p0, p0, Ll/jcp;->h:Ll/ahe0;

    .line 225
    .line 226
    invoke-virtual {p0}, Ll/ahe0;->I()V

    .line 227
    .line 228
    .line 229
    :cond_6
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 230
    .line 231
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 232
    .line 233
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers;->o0:Ll/vxd0;

    .line 234
    .line 235
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    invoke-virtual {p0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    return-void

    .line 243
    :cond_7
    :goto_1
    iget-object p1, p0, Ll/jcp;->i:Lv/TickerView;

    .line 244
    .line 245
    const/4 p2, 0x4

    .line 246
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 247
    .line 248
    .line 249
    iget-object p0, p0, Ll/jcp;->i:Lv/TickerView;

    .line 250
    .line 251
    invoke-virtual {p0}, Lv/TickerView;->f()V

    .line 252
    .line 253
    .line 254
    return-void
.end method

.method public final T()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->B5()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/lke0;->C()Ll/lke0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/lke0$a;->d()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->v:Lv/VText;

    .line 24
    .line 25
    const/high16 v1, 0x41900000    # 18.0f

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->y:Lv/VText;

    .line 33
    .line 34
    const/high16 v0, 0x41800000    # 16.0f

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v1, "zh"

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    const/4 v2, 0x2

    .line 55
    if-nez v1, :cond_1

    .line 56
    .line 57
    const-string v1, "ja"

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-nez v1, :cond_1

    .line 64
    .line 65
    const-string v1, "ko"

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_1

    .line 72
    .line 73
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->v:Lv/VText;

    .line 76
    .line 77
    const/high16 v1, 0x41500000    # 13.0f

    .line 78
    .line 79
    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->y:Lv/VText;

    .line 85
    .line 86
    invoke-virtual {p0, v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_1
    iget-object p0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->v:Lv/VText;

    .line 93
    .line 94
    const/high16 v0, 0x41880000    # 17.0f

    .line 95
    .line 96
    invoke-virtual {p0, v2, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public g()Ll/u4;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/u4<",
            "Ll/bkj0<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/core/api/CoreLikers$a;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/rbb0;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/vqo;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/n6;->f()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {v0, p0}, Ll/vqo;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    new-instance v0, Ll/i0p;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/n6;->f()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-direct {v0, p0}, Ll/i0p;-><init>(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    return-object v0
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/lke0;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/jcp;->T()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/n6;->b:Ll/u4;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/u4;->o()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/jcp;->M()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0}, Ll/jcp;->L()V

    .line 20
    .line 21
    .line 22
    return-void
.end method
