.class public Ll/ogf;
.super Ll/lp90;
.source "SourceFile"


# instance fields
.field public e:Landroid/widget/FrameLayout;

.field public f:Landroid/view/View;

.field public g:Landroid/widget/RelativeLayout;

.field public h:Lv/VLinear;

.field public i:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

.field public j:Landroid/widget/RelativeLayout;

.field public k:Lv/VImage;

.field public l:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

.field public m:Lv/VFrame_FlipContainer;

.field public n:Lv/VImage;

.field public o:Lv/VText;

.field public p:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

.field public q:Landroid/widget/RelativeLayout;

.field public r:Lv/VImage;

.field public s:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

.field public t:Lv/VText;

.field public u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;

.field public v:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

.field public w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

.field public x:Landroid/widget/RelativeLayout;

.field public y:Lv/VImage;

.field public z:Z


# direct methods
.method public static synthetic m(Ll/ogf;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ogf;->o()V

    return-void
.end method


# virtual methods
.method public c()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ogf;->f:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 2
    .line 3
    iget-object v1, p0, Ll/lp90;->b:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;->a()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, p1, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;)V

    .line 10
    .line 11
    .line 12
    sget-object v1, Ll/ogf$a;->a:[I

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    aget p1, v1, p1

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    if-eq p1, v1, :cond_5

    .line 22
    .line 23
    const/4 v1, 0x2

    .line 24
    if-eq p1, v1, :cond_4

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    if-eq p1, v1, :cond_2

    .line 28
    .line 29
    const/4 v1, 0x4

    .line 30
    if-eq p1, v1, :cond_1

    .line 31
    .line 32
    const/4 v1, 0x5

    .line 33
    if-eq p1, v1, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x0

    .line 36
    return-object p0

    .line 37
    :cond_0
    iget-object p0, p0, Ll/ogf;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->b(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_1
    iget-object p0, p0, Ll/ogf;->u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;

    .line 45
    .line 46
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->b(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_2
    iget-object p1, p0, Ll/lp90;->b:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;->a()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->SuperLike_Match:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 58
    .line 59
    if-ne p1, v1, :cond_3

    .line 60
    .line 61
    iget-object p0, p0, Ll/ogf;->s:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 62
    .line 63
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->b(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0

    .line 68
    :cond_3
    iget-object p0, p0, Ll/ogf;->l:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 69
    .line 70
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->b(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0

    .line 75
    :cond_4
    iget-object p0, p0, Ll/ogf;->i:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 76
    .line 77
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->b(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :cond_5
    iget-object p0, p0, Ll/ogf;->p:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 83
    .line 84
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->b(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0
.end method

.method public f(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;->SuperLike:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->SuperLike_Match:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 6
    .line 7
    iget-object v1, p0, Ll/lp90;->b:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;

    .line 8
    .line 9
    if-ne p2, v0, :cond_0

    .line 10
    .line 11
    new-instance p2, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;->a()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-direct {p2, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/ogf;->s:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 21
    .line 22
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->b(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    new-instance p2, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;->a()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-direct {p2, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/ogf;->l:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 37
    .line 38
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->b(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :cond_1
    invoke-super {p0, p1, p2}, Ll/lp90;->f(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public g()Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lp90;->c:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/ogf;->n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public h(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/lp90;->h(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ogf;->t:Lv/VText;

    .line 5
    .line 6
    const/4 v1, 0x3

    .line 7
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/ogf;->p:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/lp90;->b(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/ogf;->i:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/lp90;->b(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/ogf;->l:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/lp90;->b(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/ogf;->s:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/lp90;->b(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/ogf;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ll/lp90;->b(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/t450;->h()Ll/t450;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ll/t450;->p()V

    .line 45
    .line 46
    .line 47
    const-string v0, "\u4e00\u952e\u914d\u5bf9"

    .line 48
    .line 49
    filled-new-array {v0}, [Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Ll/ogf;->p(Ljava/util/List;)V

    .line 58
    .line 59
    .line 60
    new-instance v0, Ll/ngf;

    .line 61
    .line 62
    invoke-direct {v0, p0}, Ll/ngf;-><init>(Ll/ogf;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;)V
    .locals 2

    .line 1
    sget-object v0, Ll/ogf$a;->b:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;->a()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    aget p1, v0, p1

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    const/4 v1, 0x0

    .line 15
    packed-switch p1, :pswitch_data_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :pswitch_0
    iget-object p1, p0, Ll/ogf;->g:Landroid/widget/RelativeLayout;

    .line 20
    .line 21
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/ogf;->s:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 25
    .line 26
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/ogf;->u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;

    .line 30
    .line 31
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/ogf;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 35
    .line 36
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/ogf;->l:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 40
    .line 41
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/ogf;->i:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 45
    .line 46
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/ogf;->p:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 50
    .line 51
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :pswitch_1
    iget-object p1, p0, Ll/ogf;->g:Landroid/widget/RelativeLayout;

    .line 56
    .line 57
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/ogf;->s:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 61
    .line 62
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/ogf;->u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;

    .line 66
    .line 67
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/ogf;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 71
    .line 72
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/ogf;->l:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 76
    .line 77
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/ogf;->i:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 81
    .line 82
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Ll/ogf;->p:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 86
    .line 87
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :pswitch_2
    iget-object p1, p0, Ll/ogf;->g:Landroid/widget/RelativeLayout;

    .line 92
    .line 93
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Ll/ogf;->s:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 97
    .line 98
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Ll/ogf;->u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;

    .line 102
    .line 103
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Ll/ogf;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 107
    .line 108
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :pswitch_3
    iget-object p1, p0, Ll/ogf;->g:Landroid/widget/RelativeLayout;

    .line 113
    .line 114
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Ll/ogf;->s:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 118
    .line 119
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Ll/ogf;->u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;

    .line 123
    .line 124
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 125
    .line 126
    .line 127
    iget-object p0, p0, Ll/ogf;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 128
    .line 129
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :pswitch_4
    iget-object p1, p0, Ll/ogf;->g:Landroid/widget/RelativeLayout;

    .line 134
    .line 135
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Ll/ogf;->s:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 139
    .line 140
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Ll/ogf;->u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;

    .line 144
    .line 145
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 146
    .line 147
    .line 148
    iget-object p0, p0, Ll/ogf;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 149
    .line 150
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :pswitch_5
    iget-object p1, p0, Ll/ogf;->g:Landroid/widget/RelativeLayout;

    .line 155
    .line 156
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 157
    .line 158
    .line 159
    iget-object p1, p0, Ll/ogf;->s:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 160
    .line 161
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Ll/ogf;->u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;

    .line 165
    .line 166
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 167
    .line 168
    .line 169
    iget-object p1, p0, Ll/ogf;->i:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 170
    .line 171
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 172
    .line 173
    .line 174
    iget-object p0, p0, Ll/ogf;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 175
    .line 176
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 177
    .line 178
    .line 179
    return-void

    .line 180
    :pswitch_6
    iget-object p1, p0, Ll/ogf;->g:Landroid/widget/RelativeLayout;

    .line 181
    .line 182
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 183
    .line 184
    .line 185
    iget-object p1, p0, Ll/ogf;->s:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 186
    .line 187
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 188
    .line 189
    .line 190
    iget-object p1, p0, Ll/ogf;->u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;

    .line 191
    .line 192
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 193
    .line 194
    .line 195
    iget-object p1, p0, Ll/ogf;->i:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 196
    .line 197
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 198
    .line 199
    .line 200
    iget-object p0, p0, Ll/ogf;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonRoot;

    .line 201
    .line 202
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 203
    .line 204
    .line 205
    return-void

    .line 206
    nop

    .line 207
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/pgf;->b(Ll/ogf;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic o()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ogf;->g:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ogf;->u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/ogf;->u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v1, p0, Ll/ogf;->e:Landroid/widget/FrameLayout;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-le v0, v1, :cond_0

    .line 30
    .line 31
    const/high16 v0, 0x42400000    # 48.0f

    .line 32
    .line 33
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iget-object v1, p0, Ll/ogf;->u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;

    .line 38
    .line 39
    const/4 v2, 0x1

    .line 40
    new-array v3, v2, [Landroid/view/View;

    .line 41
    .line 42
    const/4 v4, 0x0

    .line 43
    aput-object v1, v3, v4

    .line 44
    .line 45
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/ogf;->u:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;

    .line 49
    .line 50
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/layout/expanded/view/ExpProfileOpButtonLinearRoot;->Q(Z)V

    .line 51
    .line 52
    .line 53
    iput-boolean v2, p0, Ll/ogf;->z:Z

    .line 54
    .line 55
    iget-object v0, p0, Ll/ogf;->v:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->i()V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/ogf;->v:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 61
    .line 62
    invoke-static {p0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method

.method public p(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/ogf;->z:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Landroid/text/TextPaint;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 9
    .line 10
    .line 11
    const/16 v1, 0xe

    .line 12
    .line 13
    invoke-static {v1}, Ll/qa00;->f(I)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    int-to-float v1, v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/4 v2, 0x0

    .line 26
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-eqz v3, :cond_1

    .line 31
    .line 32
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    check-cast v3, Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    invoke-static {v3, v2}, Ljava/lang/Math;->max(FF)F

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget-object v0, p0, Ll/ogf;->v:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 54
    .line 55
    float-to-int v1, v2

    .line 56
    const/high16 v2, 0x40000000    # 2.0f

    .line 57
    .line 58
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    add-int/2addr v1, v2

    .line 63
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 64
    .line 65
    iget-object v1, p0, Ll/ogf;->v:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 66
    .line 67
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/ogf;->v:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 71
    .line 72
    const/4 v1, 0x1

    .line 73
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/ogf;->v:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->i()V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/ogf;->v:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 82
    .line 83
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->setTextList(Ljava/util/List;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Ll/ogf;->v:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 87
    .line 88
    const/high16 v0, 0x3f000000    # 0.5f

    .line 89
    .line 90
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->setOutTranslateY(F)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Ll/ogf;->v:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 94
    .line 95
    const/4 v0, 0x0

    .line 96
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->setAnimateDirection(Z)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Ll/ogf;->v:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 100
    .line 101
    const-wide/16 v0, 0x12c

    .line 102
    .line 103
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->setInOutAnimation(J)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Ll/ogf;->v:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->h()V

    .line 109
    .line 110
    .line 111
    return-void
.end method
