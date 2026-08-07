.class public Ll/jpf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/u3m;


# instance fields
.field public a:I

.field public b:Z

.field public c:Z

.field public d:I

.field public e:Z

.field public f:Z

.field public g:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/zq90;


# direct methods
.method public constructor <init>(Ll/zq90;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/jpf0;->a:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Ll/jpf0;->b:Z

    .line 9
    .line 10
    iput-boolean v1, p0, Ll/jpf0;->c:Z

    .line 11
    .line 12
    iput v0, p0, Ll/jpf0;->d:I

    .line 13
    .line 14
    iput-boolean v1, p0, Ll/jpf0;->e:Z

    .line 15
    .line 16
    iput-boolean v1, p0, Ll/jpf0;->f:Z

    .line 17
    .line 18
    iput-object p1, p0, Ll/jpf0;->h:Ll/zq90;

    .line 19
    .line 20
    return-void
.end method

.method private b(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method


# virtual methods
.method public B1()Ljava/util/List;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public B2()Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public C2()Lcom/p1/mobile/putong/core/data/CategorySuggestions;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->I4:Lcom/p1/mobile/putong/core/data/CategorySuggestions;

    .line 2
    .line 3
    return-object p0
.end method

.method public C3()Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public D2()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public E()V
    .locals 0

    .line 1
    return-void
.end method

.method public E1()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zq90;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "live_profile_voice_mask_mode"

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    return p0
.end method

.method public E2()Ll/pf60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jpf0;->g:Ll/pf60;

    .line 2
    .line 3
    return-object p0
.end method

.method public F()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public F1(Z)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public varargs G([Landroid/view/View;)V
    .locals 4

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    if-ge v1, v0, :cond_0

    .line 4
    .line 5
    aget-object v2, p1, v1

    .line 6
    .line 7
    iget-object v3, p0, Ll/jpf0;->h:Ll/zq90;

    .line 8
    .line 9
    iget-object v3, v3, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    invoke-virtual {p0, v3}, Ll/jpf0;->c(Lcom/p1/mobile/putong/data/User;)Landroid/view/View$OnClickListener;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    add-int/lit8 v1, v1, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-void
.end method

.method public G0(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zq90;->J()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public H0(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/jpf0;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public H1()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public H2()Landroid/view/LayoutInflater;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zq90;->g:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public H3()Ll/pf60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Literatures;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public I1()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public J()Landroid/view/View;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;->Dislike:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/jpf0;->b(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public J1()Lcom/p1/mobile/putong/app/PutongFrag;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zq90;->c()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public J3()V
    .locals 0

    .line 1
    return-void
.end method

.method public K2()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    return-object p0
.end method

.method public K3()I
    .locals 0

    .line 1
    iget p0, p0, Ll/jpf0;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public M()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->V1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 8
    .line 9
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "chat_group_anonymity"

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 20
    .line 21
    iget-object p0, p0, Ll/zq90;->b:Ljava/lang/String;

    .line 22
    .line 23
    const-string v0, "chat_group"

    .line 24
    .line 25
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    :cond_0
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_1
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public M0()Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public N2()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zq90;->L()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public N3()Landroid/view/View;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;->CityGreet:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/jpf0;->b(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public O1()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zq90;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "home_card"

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public P(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zq90;->Q()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public P1()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zq90;->K()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Q()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "from_guess_liker_result"

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    iget-object v0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/zq90;->t()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    iget-object v0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 25
    .line 26
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 27
    .line 28
    const-string v2, "likers"

    .line 29
    .line 30
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_2

    .line 35
    .line 36
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 37
    .line 38
    iget-object p0, p0, Ll/zq90;->b:Ljava/lang/String;

    .line 39
    .line 40
    const-string v0, "from_boost_refactor"

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-nez p0, :cond_2

    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    return p0

    .line 50
    :cond_2
    return v1
.end method

.method public Q2()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public R()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->x0:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public R0()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public R1(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public R2()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public R3()V
    .locals 0

    .line 1
    return-void
.end method

.method public S()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public S1()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public S2(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/jpf0;->e:Z

    .line 2
    .line 3
    return-void
.end method

.method public U()Ll/bnl0$g;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public U0()Lcom/p1/mobile/putong/core/ui/PictureView;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public U2()V
    .locals 0

    .line 1
    return-void
.end method

.method public V0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/jpf0;->f:Z

    .line 2
    .line 3
    return-void
.end method

.method public V2()Lcom/p1/mobile/putong/data/RelationshipStatus;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zq90;->e:Ll/zq90$a;

    .line 4
    .line 5
    iget-object p0, p0, Ll/zq90$a;->m:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 6
    .line 7
    return-object p0
.end method

.method public W()Landroidx/recyclerview/widget/RecyclerView;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public W2()Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public X1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/jpf0;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public Y0()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public Z(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public Z1()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public Z2()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public a()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public a0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/jpf0;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic act()Landroid/app/Activity;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jpf0;->a()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/data/User;)Landroid/view/View$OnClickListener;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public c0()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public c3(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public d1()I
    .locals 2

    .line 1
    iget v0, p0, Ll/jpf0;->d:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    iput v1, p0, Ll/jpf0;->d:I

    .line 5
    .line 6
    return v0
.end method

.method public e2()V
    .locals 0

    .line 1
    return-void
.end method

.method public from()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zq90;->b:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public g3()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public getContext()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zq90;->g:Landroid/content/Context;

    .line 4
    .line 5
    return-object p0
.end method

.method public h2()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public h3()V
    .locals 0

    .line 1
    return-void
.end method

.method public i3()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public j3(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public k0(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V
    .locals 0

    .line 1
    return-void
.end method

.method public k3()V
    .locals 0

    .line 1
    return-void
.end method

.method public l2(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/jpf0;->b:Z

    .line 2
    .line 3
    return-void
.end method

.method public lifecycle()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/android/app/c;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/jpf0;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/jpf0;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/jpf0;->a()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public lifecycle_()Lcom/p1/mobile/android/app/c;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public m0()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public m2(IZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public m3(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public me()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public o()V
    .locals 0

    .line 1
    return-void
.end method

.method public o0()Landroid/view/View;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;->Like:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/jpf0;->b(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public o1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/jpf0;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public o2()V
    .locals 0

    .line 1
    return-void
.end method

.method public o3()Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public p1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/jpf0;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public p2()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public p3(ILcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public q()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public q2()Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public q3()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zq90;->o()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/zq90;->F()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public r3(I)Lcom/p1/mobile/putong/core/ui/PictureView;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public s1()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zq90;->e:Ll/zq90$a;

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/zq90$a;->f:Z

    .line 6
    .line 7
    return p0
.end method

.method public s2()Lcom/p1/mobile/putong/core/data/LikedUser;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zq90;->e:Ll/zq90$a;

    .line 4
    .line 5
    iget-object p0, p0, Ll/zq90$a;->o:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 6
    .line 7
    return-object p0
.end method

.method public startActivity(Landroid/content/Intent;)V
    .locals 0

    .line 1
    return-void
.end method

.method public startActivityForResult(Landroid/content/Intent;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public t1()V
    .locals 0

    .line 1
    return-void
.end method

.method public u2()Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public u3(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/jpf0;->a:I

    .line 2
    .line 3
    return-void
.end method

.method public userId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public v1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/jpf0;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public v2()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->V1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 8
    .line 9
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "chat_group_anonymity"

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 20
    .line 21
    iget-object p0, p0, Ll/zq90;->b:Ljava/lang/String;

    .line 22
    .line 23
    const-string v0, "group_notification_anonymity"

    .line 24
    .line 25
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    :cond_0
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_1
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public w3()Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public y0()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zq90;->E()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/jpf0;->h:Ll/zq90;

    .line 10
    .line 11
    iget-object p0, p0, Ll/zq90;->e:Ll/zq90$a;

    .line 12
    .line 13
    iget v0, p0, Ll/zq90$a;->d:I

    .line 14
    .line 15
    iget-object p0, p0, Ll/zq90$a;->e:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/wtk;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    const-string p0, ""

    .line 23
    .line 24
    return-object p0
.end method

.method public y1()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public y2()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public y3(Ll/pf60;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/jpf0;->g:Ll/pf60;

    .line 2
    .line 3
    return-void
.end method
