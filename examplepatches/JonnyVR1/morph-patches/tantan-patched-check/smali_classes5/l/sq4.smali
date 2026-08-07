.class public Ll/sq4;
.super Ll/q27;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/sq4$b;
    }
.end annotation


# instance fields
.field public g:Lv/VLinear;

.field public h:Landroid/view/View;

.field public i:Lv/VPager;

.field public j:Lv/VPagerCircleIndicator;

.field public k:Lv/VText_NoTopPadding;

.field public final l:Lcom/p1/mobile/android/app/Act;

.field public final m:I

.field public final n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/q27;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/sq4;->l:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput p2, p0, Ll/sq4;->m:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/sq4;->n:Ljava/util/List;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic I(Ll/sq4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sq4;->N(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic J(Ll/sq4;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sq4;->n:Ljava/util/List;

    return-object p0
.end method

.method private L()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/sq4;->k:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    sget v0, Ll/dbc0;->Kh:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private M()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sq4;->l:Lcom/p1/mobile/android/app/Act;

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
    invoke-virtual {p0, v0, v1}, Ll/sq4;->K(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/sq4;->i:Lv/VPager;

    .line 16
    .line 17
    new-instance v1, Ll/sq4$b;

    .line 18
    .line 19
    iget-object v2, p0, Ll/sq4;->n:Ljava/util/List;

    .line 20
    .line 21
    invoke-direct {v1, v2}, Ll/sq4$b;-><init>(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/sq4;->j:Lv/VPagerCircleIndicator;

    .line 28
    .line 29
    iget-object v1, p0, Ll/sq4;->i:Lv/VPager;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/sq4;->i:Lv/VPager;

    .line 35
    .line 36
    iget v1, p0, Ll/sq4;->m:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/sq4;->i:Lv/VPager;

    .line 42
    .line 43
    new-instance v1, Ll/sq4$a;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/sq4$a;-><init>(Ll/sq4;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/sq4;->j:Lv/VPagerCircleIndicator;

    .line 52
    .line 53
    iget v1, p0, Ll/sq4;->m:I

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lv/VPagerCircleIndicator;->setCurrentItem(I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/sq4;->k:Lv/VText_NoTopPadding;

    .line 59
    .line 60
    new-instance v1, Ll/rq4;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/rq4;-><init>(Ll/sq4;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/sq4;->F()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v1, p0, Ll/sq4;->n:Ljava/util/List;

    .line 73
    .line 74
    iget p0, p0, Ll/sq4;->m:I

    .line 75
    .line 76
    invoke-interface {v1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    check-cast p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->getTrackName()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    const-string v1, "privilege_name"

    .line 87
    .line 88
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    filled-new-array {p0}, [Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    const-string v1, "e_privilege_detail"

    .line 97
    .line 98
    invoke-static {v1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method private synthetic N(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/sq4;->l:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-static {p1}, Ll/pq4;->o(Lcom/p1/mobile/android/app/Act;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/sq4;->F()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v0, p0, Ll/sq4;->n:Ljava/util/List;

    .line 14
    .line 15
    iget-object p0, p0, Ll/sq4;->i:Lv/VPager;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->getTrackName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v0, "privilege_name"

    .line 32
    .line 33
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    filled-new-array {p0}, [Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string v0, "e_verification_avatar"

    .line 42
    .line 43
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public C()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public F()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_privilege_pop"

    .line 2
    .line 3
    return-object p0
.end method

.method public G()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sq4;->g:Lv/VLinear;

    .line 2
    .line 3
    return-object p0
.end method

.method public H()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public K(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/tq4;->b(Ll/sq4;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/q27;->A()Ll/l4g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/sq4;->n:Ljava/util/List;

    .line 6
    .line 7
    iget v2, p0, Ll/sq4;->m:I

    .line 8
    .line 9
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/verification/CertPrivilege;->getTrackName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "privilege_name"

    .line 20
    .line 21
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    filled-new-array {v1}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    invoke-super {p0, p1}, Ll/q27;->onCreate(Landroid/os/Bundle;)V

    .line 33
    .line 34
    .line 35
    invoke-direct {p0}, Ll/sq4;->M()V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ll/gra;->z()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    invoke-direct {p0}, Ll/sq4;->L()V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public z()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
