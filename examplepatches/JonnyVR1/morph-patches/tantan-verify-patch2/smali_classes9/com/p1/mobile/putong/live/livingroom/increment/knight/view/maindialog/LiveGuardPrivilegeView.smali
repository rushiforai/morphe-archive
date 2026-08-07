.class public Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VImage;

.field public g:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardInfoView;

.field public h:Lv/VPager;

.field public i:Landroidx/viewpager2/widget/ViewPager2;

.field public j:Lv/VImage;

.field public k:Ll/zuk;

.field public l:Ll/avk;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic h0(Ll/ats;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ats;->N()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i0(Ll/ats;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ats;->H()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zts;->a(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k0(Ll/ats;Ll/lsw;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;->e:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p2, Ll/lsw;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardInfoView;

    .line 9
    .line 10
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardInfoView;->i0(Ll/lsw;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p2, Ll/lsw;->f:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    new-instance v1, Ll/zuk;

    .line 20
    .line 21
    invoke-direct {v1, p1}, Ll/zuk;-><init>(Ll/ats;)V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;->k:Ll/zuk;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;->h:Lv/VPager;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;->h:Lv/VPager;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;->k:Ll/zuk;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;->k:Ll/zuk;

    .line 39
    .line 40
    iget-boolean v1, p2, Ll/lsw;->g:Z

    .line 41
    .line 42
    iget-object v2, p2, Ll/lsw;->f:Ljava/util/List;

    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Ll/zuk;->q(ZLjava/util/List;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;->h:Lv/VPager;

    .line 48
    .line 49
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView$a;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 55
    .line 56
    .line 57
    new-instance v0, Ll/avk;

    .line 58
    .line 59
    invoke-direct {v0, p1}, Ll/avk;-><init>(Ll/ats;)V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;->l:Ll/avk;

    .line 63
    .line 64
    invoke-virtual {v0, p2}, Ll/avk;->y(Ll/lsw;)V

    .line 65
    .line 66
    .line 67
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;->i:Landroidx/viewpager2/widget/ViewPager2;

    .line 68
    .line 69
    const/4 v0, 0x0

    .line 70
    invoke-virtual {p2, v0}, Landroidx/viewpager2/widget/ViewPager2;->setUserInputEnabled(Z)V

    .line 71
    .line 72
    .line 73
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;->i:Landroidx/viewpager2/widget/ViewPager2;

    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;->l:Ll/avk;

    .line 76
    .line 77
    invoke-virtual {p2, v0}, Landroidx/viewpager2/widget/ViewPager2;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 78
    .line 79
    .line 80
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;->d:Lv/VText;

    .line 81
    .line 82
    new-instance v0, Ll/xts;

    .line 83
    .line 84
    invoke-direct {v0, p1}, Ll/xts;-><init>(Ll/ats;)V

    .line 85
    .line 86
    .line 87
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 88
    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;->f:Lv/VImage;

    .line 91
    .line 92
    new-instance p2, Ll/yts;

    .line 93
    .line 94
    invoke-direct {p2, p1}, Ll/yts;-><init>(Ll/ats;)V

    .line 95
    .line 96
    .line 97
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;->j0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
