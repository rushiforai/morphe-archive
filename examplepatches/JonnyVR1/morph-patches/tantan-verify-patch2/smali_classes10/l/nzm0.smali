.class public Ll/nzm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/kzm0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Lcom/google/android/material/tabs/TabLayout;

.field public c:Lv/VPager;

.field public d:Ll/c0s;

.field public e:Ll/kzm0;

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nzm0;->g:Ljava/util/List;

    .line 5
    .line 6
    iput-object p2, p0, Ll/nzm0;->f:Ljava/util/List;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/nzm0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nzm0;->j(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic b(Ll/nzm0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nzm0;->k(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic c(Ll/nzm0;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nzm0;->l(I)V

    return-void
.end method

.method private synthetic j(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nzm0;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->newTab()Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->addTab(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nzm0;->d:Ll/c0s;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private l(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nzm0;->e:Ll/kzm0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/kzm0;->S3(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nzm0;->g:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/mzm0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/mzm0;-><init>(Ll/nzm0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/nzm0;->c:Lv/VPager;

    .line 12
    .line 13
    new-instance v1, Ll/sfo0;

    .line 14
    .line 15
    iget-object v2, p0, Ll/nzm0;->f:Ljava/util/List;

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ll/sfo0;-><init>(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/nzm0;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 24
    .line 25
    new-instance v1, Ll/nzm0$a;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/nzm0$a;-><init>(Ll/nzm0;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/nzm0;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 34
    .line 35
    iget-object v1, p0, Ll/nzm0;->c:Lv/VPager;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    :goto_0
    iget-object v1, p0, Ll/nzm0;->g:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-ge v0, v1, :cond_0

    .line 48
    .line 49
    iget-object v1, p0, Ll/nzm0;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 50
    .line 51
    invoke-virtual {v1, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iget-object v2, p0, Ll/nzm0;->g:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    check-cast v2, Ljava/lang/CharSequence;

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Lcom/google/android/material/tabs/TabLayout$Tab;->setText(Ljava/lang/CharSequence;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 64
    .line 65
    .line 66
    add-int/lit8 v0, v0, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nzm0;->e:Ll/kzm0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ozm0;->b(Ll/nzm0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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

.method public e(Ll/kzm0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nzm0;->e:Ll/kzm0;

    .line 2
    .line 3
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nzm0;->d:Ll/c0s;

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

.method public i()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nzm0;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/kzm0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nzm0;->e(Ll/kzm0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public m(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nzm0;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    if-ltz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/nzm0;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout$Tab;->select()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public n(ILjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nzm0;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p2}, Lcom/google/android/material/tabs/TabLayout$Tab;->setText(Ljava/lang/CharSequence;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public p()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nzm0;->d:Ll/c0s;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p0, v0, v1}, Ll/nzm0;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/c0s;

    .line 19
    .line 20
    iget-object v2, p0, Ll/nzm0;->e:Ll/kzm0;

    .line 21
    .line 22
    invoke-direct {v1, v2, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Ll/nzm0;->d:Ll/c0s;

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->VOICE_CALL_ALL_LIST_DIALOG:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->j0(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/nzm0;->a:Landroid/view/View;

    .line 33
    .line 34
    new-instance v1, Ll/lzm0;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/lzm0;-><init>(Ll/nzm0;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    invoke-direct {p0}, Ll/nzm0;->r()V

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object p0, p0, Ll/nzm0;->d:Ll/c0s;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 48
    .line 49
    .line 50
    return-void
.end method
