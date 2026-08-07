.class public Ll/m65;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/Greeting;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Greeting;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Lcom/p1/mobile/putong/core/ui/citytop/a;

.field public e:Lcom/p1/mobile/putong/data/Links;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/citytop/a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/m65;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p1, p0, Ll/m65;->d:Lcom/p1/mobile/putong/core/ui/citytop/a;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic E(Ll/m65;Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m65;->P(Lcom/p1/mobile/putong/core/data/Greeting;)V

    return-void
.end method

.method public static synthetic F(Ll/m65;Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/m65;->Q(Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;Ll/pf60;)V

    return-void
.end method

.method public static synthetic G(Ll/m65;Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m65;->R(Lcom/p1/mobile/putong/core/data/Greeting;)V

    return-void
.end method

.method public static synthetic H(Ll/m65;Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/m65;->O(Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/data/Greeting;)V

    return-void
.end method

.method public static synthetic I(Ll/m65;Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m65;->N(Lcom/p1/mobile/putong/core/data/Greeting;)V

    return-void
.end method

.method public static synthetic J(Ll/m65;Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/m65;->S(Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/m65;->K(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Greeting;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m65;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/m65;->d:Lcom/p1/mobile/putong/core/ui/citytop/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/kec0;->r1:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public K(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Greeting;II)V
    .locals 2

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;

    .line 2
    .line 3
    iget-object p3, p0, Ll/m65;->d:Lcom/p1/mobile/putong/core/ui/citytop/a;

    .line 4
    .line 5
    invoke-virtual {p3}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p4, v0}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p4

    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 20
    .line 21
    iget-object v0, v0, Ll/il8;->c:Ll/t600;

    .line 22
    .line 23
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GreetingMessages;->latestId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/wzh0;->uiGet(Ljava/lang/String;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/f65;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/f65;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {p4, v0, v1}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p4

    .line 40
    invoke-virtual {p0, p3, p4}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p3

    .line 44
    new-instance p4, Ll/g65;

    .line 45
    .line 46
    invoke-direct {p4, p0, p2, p1}, Ll/g65;-><init>(Ll/m65;Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p3, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/m65;->d:Lcom/p1/mobile/putong/core/ui/citytop/a;

    .line 57
    .line 58
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 65
    .line 66
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/core/api/g;->Ue(Ljava/lang/String;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object p3

    .line 72
    invoke-virtual {p0, p1, p3}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    new-instance p3, Ll/h65;

    .line 77
    .line 78
    invoke-direct {p3, p0, p2}, Ll/h65;-><init>(Ll/m65;Lcom/p1/mobile/putong/core/data/Greeting;)V

    .line 79
    .line 80
    .line 81
    invoke-static {p3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public L(I)Lcom/p1/mobile/putong/core/data/Greeting;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m65;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/m65;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/core/data/Greeting;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public M()Lcom/p1/mobile/putong/data/Links;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m65;->e:Lcom/p1/mobile/putong/data/Links;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m65;->d:Lcom/p1/mobile/putong/core/ui/citytop/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/citytop/a;->x0(Lcom/p1/mobile/putong/core/data/Greeting;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic O(Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m65;->d:Lcom/p1/mobile/putong/core/ui/citytop/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/citytop/a;->y0(Lcom/p1/mobile/putong/core/data/Greeting;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/m65;->d:Lcom/p1/mobile/putong/core/ui/citytop/a;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/citytop/a;->u0(Lcom/p1/mobile/putong/core/data/Greeting;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic Q(Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;Ll/pf60;)V
    .locals 7

    .line 1
    iget-object v0, p3, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p3, Ll/pf60;->a:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 20
    .line 21
    const-string v1, "matched"

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    new-instance p2, Ll/i65;

    .line 30
    .line 31
    invoke-direct {p2, p0, p1}, Ll/i65;-><init>(Ll/m65;Lcom/p1/mobile/putong/core/data/Greeting;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p2}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object v0, p3, Ll/pf60;->a:Ljava/lang/Object;

    .line 39
    .line 40
    move-object v2, v0

    .line 41
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    iget-object p3, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 44
    .line 45
    move-object v3, p3

    .line 46
    check-cast v3, Lcom/p1/mobile/putong/core/data/Message;

    .line 47
    .line 48
    new-instance v5, Ll/j65;

    .line 49
    .line 50
    invoke-direct {v5, p0, p1}, Ll/j65;-><init>(Ll/m65;Lcom/p1/mobile/putong/core/data/Greeting;)V

    .line 51
    .line 52
    .line 53
    new-instance v6, Ll/k65;

    .line 54
    .line 55
    invoke-direct {v6, p0, p1}, Ll/k65;-><init>(Ll/m65;Lcom/p1/mobile/putong/core/data/Greeting;)V

    .line 56
    .line 57
    .line 58
    move-object v4, p1

    .line 59
    move-object v1, p2

    .line 60
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->h(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Greeting;Ll/y20;Ll/x20;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final synthetic R(Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m65;->d:Lcom/p1/mobile/putong/core/ui/citytop/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/citytop/a;->x0(Lcom/p1/mobile/putong/core/data/Greeting;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic S(Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "default"

    .line 10
    .line 11
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    new-instance p2, Ll/l65;

    .line 18
    .line 19
    invoke-direct {p2, p0, p1}, Ll/l65;-><init>(Ll/m65;Lcom/p1/mobile/putong/core/data/Greeting;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p2}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public T()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m65;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public U(Lcom/p1/mobile/putong/core/data/Greeting;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m65;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/m65;->c:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v1

    .line 18
    :goto_0
    if-eq v0, v1, :cond_2

    .line 19
    .line 20
    iget-object v1, p0, Ll/m65;->c:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/m65;->c:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-lez p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRemoved(I)V

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 38
    .line 39
    .line 40
    :goto_1
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_2
    const/4 p0, 0x0

    .line 43
    return p0
.end method

.method public V(Ljava/util/List;Lcom/p1/mobile/putong/data/Links;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Greeting;",
            ">;",
            "Lcom/p1/mobile/putong/data/Links;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/m65;->e:Lcom/p1/mobile/putong/data/Links;

    .line 2
    .line 3
    iget-object p2, p0, Ll/m65;->c:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/util/ArrayList;->clear()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    iget-object p2, p0, Ll/m65;->c:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/jic0;->e(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/m65;->c:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Ll/m65;->c:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    add-int/lit8 v0, v0, -0x2

    .line 19
    .line 20
    if-ne p1, v0, :cond_1

    .line 21
    .line 22
    iget-object p1, p0, Ll/m65;->d:Lcom/p1/mobile/putong/core/ui/citytop/a;

    .line 23
    .line 24
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/ui/citytop/a;->a:Z

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    iget-object p0, p0, Ll/m65;->d:Lcom/p1/mobile/putong/core/ui/citytop/a;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/citytop/a;->t0()V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/member/R$string;->F:I

    .line 45
    .line 46
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m65;->L(I)Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
