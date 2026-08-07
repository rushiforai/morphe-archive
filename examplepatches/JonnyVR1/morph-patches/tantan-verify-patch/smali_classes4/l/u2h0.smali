.class public Ll/u2h0;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/CardPattern;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/CardPattern;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/i3h0;

.field public e:Lcom/p1/mobile/android/app/Act;

.field public f:Lcom/p1/mobile/putong/core/data/ActionPageFormat;


# direct methods
.method public constructor <init>(Ll/i3h0;)V
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
    iput-object v0, p0, Ll/u2h0;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p1, p0, Ll/u2h0;->d:Ll/i3h0;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/u2h0;->e:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/i3h0;->i0()Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Ll/u2h0;->f:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic E(Ll/u2h0;Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u2h0;->K(Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;)V

    return-void
.end method

.method public static synthetic F(Ll/u2h0;Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u2h0;->L(Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;)V

    return-void
.end method

.method public static synthetic G(Ll/u2h0;Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u2h0;->J(Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/CardPattern;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/u2h0;->H(Landroid/view/View;Lcom/p1/mobile/putong/core/data/CardPattern;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u2h0;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    add-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/u2h0;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget p2, Ll/kec0;->jc:I

    .line 11
    .line 12
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget p2, Ll/kec0;->mc:I

    .line 22
    .line 23
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public H(Landroid/view/View;Lcom/p1/mobile/putong/core/data/CardPattern;II)V
    .locals 1

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    sget p2, Ll/adc0;->je:I

    .line 4
    .line 5
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    check-cast p2, Landroid/widget/TextView;

    .line 10
    .line 11
    sget p3, Ll/adc0;->P1:I

    .line 12
    .line 13
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Landroid/widget/TextView;

    .line 18
    .line 19
    iget-object p3, p0, Ll/u2h0;->f:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 20
    .line 21
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageSubTitle:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/u2h0;->f:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageContext:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    const/4 p4, 0x1

    .line 35
    if-ne p3, p4, :cond_1

    .line 36
    .line 37
    check-cast p1, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;

    .line 38
    .line 39
    new-instance p3, Ll/r2h0;

    .line 40
    .line 41
    invoke-direct {p3, p0, p2, p1}, Ll/r2h0;-><init>(Ll/u2h0;Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;)V

    .line 42
    .line 43
    .line 44
    new-instance p4, Ll/s2h0;

    .line 45
    .line 46
    invoke-direct {p4, p0, p2, p1}, Ll/s2h0;-><init>(Ll/u2h0;Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;)V

    .line 47
    .line 48
    .line 49
    new-instance v0, Ll/t2h0;

    .line 50
    .line 51
    invoke-direct {v0, p0, p2, p1}, Ll/t2h0;-><init>(Ll/u2h0;Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, p2, p3, p4, v0}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->o(Lcom/p1/mobile/putong/core/data/CardPattern;Ll/x20;Ll/x20;Ll/x20;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method public I(I)Lcom/p1/mobile/putong/core/data/CardPattern;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    iget-object p0, p0, Ll/u2h0;->c:Ljava/util/ArrayList;

    .line 6
    .line 7
    add-int/lit8 p1, p1, -0x1

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/data/CardPattern;

    .line 14
    .line 15
    return-object p0
.end method

.method public final synthetic J(Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u2h0;->d:Ll/i3h0;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p0, p1, p2}, Ll/i3h0;->q0(Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic K(Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u2h0;->d:Ll/i3h0;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {v0, p1, p2}, Ll/i3h0;->q0(Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/u2h0;->d:Ll/i3h0;

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    invoke-virtual {p0, p1}, Ll/i3h0;->n0(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u2h0;->d:Ll/i3h0;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/suggest/SuggesterItemView;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {v0, p1, p2}, Ll/i3h0;->q0(Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/u2h0;->d:Ll/i3h0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/i3h0;->p0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public M(Lcom/p1/mobile/putong/core/data/CardPattern;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u2h0;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    add-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public N(Lcom/p1/mobile/putong/core/data/CardPattern;)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u2h0;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ltz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/u2h0;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 15
    .line 16
    return v0
.end method

.method public O(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CardPattern;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/u2h0;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/u2h0;->c:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u2h0;->I(I)Lcom/p1/mobile/putong/core/data/CardPattern;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x1

    .line 6
    return p0
.end method
