.class public Ll/r8b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/r8b$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/p8b;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskCenterAct;

.field public b:Ll/p8b;

.field public c:Lv/navigationbar/VNavigationBar;

.field public d:Lv/VRecyclerView;

.field public e:Ll/r8b$a;

.field public f:Landroid/view/View;

.field public g:Landroid/view/View;

.field public h:Lv/VText;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskCenterAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/r8b;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskCenterAct;

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
    iget-object p0, p0, Ll/r8b;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskCenterAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Ll/p8b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r8b;->b:Ll/p8b;

    .line 2
    .line 3
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/r8b;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskCenterAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r8b;->d:Lv/VRecyclerView;

    .line 2
    .line 3
    xor-int/lit8 v1, p1, 0x1

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/r8b;->f:Landroid/view/View;

    .line 9
    .line 10
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/r8b;->h:Lv/VText;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/r8b;->g:Landroid/view/View;

    .line 22
    .line 23
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/r8b;->h:Lv/VText;

    .line 27
    .line 28
    const-string p1, "\u5f53\u524d\u7f51\u7edc\u4e0d\u53ef\u7528"

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public c()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/r8b;->d:Lv/VRecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/r8b;->f:Landroid/view/View;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/r8b;->h:Lv/VText;

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/r8b;->g:Landroid/view/View;

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/r8b;->h:Lv/VText;

    .line 24
    .line 25
    const-string v0, "\u52a0\u8f7d\u4e2d..."

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/core/data/RealPicturesInfo;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/r8b;->e:Ll/r8b$a;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0, p1}, Ll/r8b$a;->H(ILjava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/p8b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/r8b;->a(Ll/p8b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->Gc:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget p2, Ll/adc0;->d7:I

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Lv/VRecyclerView;

    .line 15
    .line 16
    iput-object p2, p0, Ll/r8b;->d:Lv/VRecyclerView;

    .line 17
    .line 18
    sget p2, Ll/adc0;->N8:I

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    check-cast p2, Lv/navigationbar/VNavigationBar;

    .line 25
    .line 26
    iput-object p2, p0, Ll/r8b;->c:Lv/navigationbar/VNavigationBar;

    .line 27
    .line 28
    sget p2, Ll/adc0;->I3:I

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    iput-object p2, p0, Ll/r8b;->f:Landroid/view/View;

    .line 35
    .line 36
    sget p2, Ll/adc0;->k6:I

    .line 37
    .line 38
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    iput-object p2, p0, Ll/r8b;->g:Landroid/view/View;

    .line 43
    .line 44
    sget p2, Ll/adc0;->Ee:I

    .line 45
    .line 46
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    check-cast p2, Lv/VText;

    .line 51
    .line 52
    iput-object p2, p0, Ll/r8b;->h:Lv/VText;

    .line 53
    .line 54
    iget-object p2, p0, Ll/r8b;->c:Lv/navigationbar/VNavigationBar;

    .line 55
    .line 56
    const-string v0, "\u5b8c\u6210\u4efb\u52a1\uff0c\u514d\u8d39\u9886\u7279\u6743"

    .line 57
    .line 58
    invoke-virtual {p2, v0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    iget-object p2, p0, Ll/r8b;->c:Lv/navigationbar/VNavigationBar;

    .line 62
    .line 63
    iget-object v0, p0, Ll/r8b;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskCenterAct;

    .line 64
    .line 65
    invoke-virtual {p2, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/r8b;->r()V

    .line 69
    .line 70
    .line 71
    return-object p1
.end method

.method public r()V
    .locals 3

    .line 1
    new-instance v0, Ll/r8b$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/r8b;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Ll/r8b;->b:Ll/p8b;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2}, Ll/r8b$a;-><init>(Lcom/p1/mobile/android/app/Act;Ll/p8b;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/r8b;->e:Ll/r8b$a;

    .line 13
    .line 14
    iget-object v0, p0, Ll/r8b;->d:Lv/VRecyclerView;

    .line 15
    .line 16
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/r8b;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-direct {v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/r8b;->d:Lv/VRecyclerView;

    .line 29
    .line 30
    iget-object v1, p0, Ll/r8b;->e:Ll/r8b$a;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/r8b;->e:Ll/r8b$a;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 38
    .line 39
    .line 40
    return-void
.end method
