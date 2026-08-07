.class public Ll/ahm0;
.super Ll/jic0;
.source "SourceFile"


# static fields
.field public static h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/VisitorFilterType;",
            ">;"
        }
    .end annotation
.end field

.field public static i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/VisitorSortType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final c:Lcom/p1/mobile/android/app/Act;

.field public final d:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

.field public e:I

.field public f:Lcom/p1/mobile/putong/core/data/VisitorSortType;

.field public g:Lcom/p1/mobile/putong/core/data/VisitorFilterType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    const-string v0, "all"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/VisitorFilterType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "match"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/VisitorFilterType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "likeMe"

    .line 14
    .line 15
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/VisitorFilterType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    filled-new-array {v0, v1, v2}, [Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sput-object v0, Ll/ahm0;->h:Ljava/util/List;

    .line 28
    .line 29
    const-string v0, "visitTime"

    .line 30
    .line 31
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/VisitorSortType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "visitTimes"

    .line 36
    .line 37
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/VisitorSortType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const-string v2, "distance"

    .line 42
    .line 43
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/VisitorSortType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    const-string v3, "realUser"

    .line 48
    .line 49
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/VisitorSortType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    const-string v4, "newUser"

    .line 54
    .line 55
    invoke-static {v4}, Lcom/p1/mobile/putong/core/data/VisitorSortType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    sput-object v0, Ll/ahm0;->i:Ljava/util/List;

    .line 68
    .line 69
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/mam;)V
    .locals 1
    .param p2    # Ll/mam;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/ahm0;->e:I

    .line 6
    .line 7
    const-string v0, "visitTime"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/VisitorSortType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/ahm0;->f:Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 14
    .line 15
    const-string v0, "all"

    .line 16
    .line 17
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/VisitorFilterType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Ll/ahm0;->g:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 22
    .line 23
    iput-object p1, p0, Ll/ahm0;->c:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    invoke-interface {p2}, Ll/mam;->a()Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Ll/ahm0;->d:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 30
    .line 31
    return-void
.end method

.method public static synthetic E(Ll/ahm0;Lcom/p1/mobile/putong/core/data/VisitorFilterType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ahm0;->H(Lcom/p1/mobile/putong/core/data/VisitorFilterType;)V

    return-void
.end method

.method public static synthetic F(Ll/ahm0;Lcom/p1/mobile/putong/core/data/VisitorSortType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ahm0;->G(Lcom/p1/mobile/putong/core/data/VisitorSortType;)V

    return-void
.end method


# virtual methods
.method public A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    if-ne p3, p2, :cond_0

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;

    .line 5
    .line 6
    iget-object p0, p0, Ll/ahm0;->d:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;->b(Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    if-nez p3, :cond_1

    .line 13
    .line 14
    check-cast p1, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;

    .line 15
    .line 16
    iget-object p0, p0, Ll/ahm0;->d:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;->d(Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    const/4 p2, 0x2

    .line 23
    if-ne p3, p2, :cond_2

    .line 24
    .line 25
    sget-object p2, Ll/ahm0;->i:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p2, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    check-cast p2, Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 32
    .line 33
    iget-object p3, p0, Ll/ahm0;->d:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 34
    .line 35
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 36
    .line 37
    iput-object p3, p0, Ll/ahm0;->f:Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 38
    .line 39
    check-cast p1, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDefaultView;

    .line 40
    .line 41
    new-instance p4, Ll/ygm0;

    .line 42
    .line 43
    invoke-direct {p4, p0}, Ll/ygm0;-><init>(Ll/ahm0;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDefaultView;->e(Lcom/p1/mobile/putong/core/data/VisitorSortType;Lcom/p1/mobile/putong/core/data/VisitorSortType;Ll/y20;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    const/4 p2, 0x3

    .line 51
    if-ne p3, p2, :cond_3

    .line 52
    .line 53
    sget-object p2, Ll/ahm0;->h:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {p2, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    check-cast p2, Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 60
    .line 61
    iget-object p3, p0, Ll/ahm0;->d:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 62
    .line 63
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 64
    .line 65
    iput-object p3, p0, Ll/ahm0;->g:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 66
    .line 67
    check-cast p1, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDefaultView;

    .line 68
    .line 69
    new-instance p4, Ll/zgm0;

    .line 70
    .line 71
    invoke-direct {p4, p0}, Ll/zgm0;-><init>(Ll/ahm0;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDefaultView;->d(Lcom/p1/mobile/putong/core/data/VisitorFilterType;Lcom/p1/mobile/putong/core/data/VisitorFilterType;Ll/y20;)V

    .line 75
    .line 76
    .line 77
    :cond_3
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    iget p0, p0, Ll/ahm0;->e:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    sget-object p0, Ll/ahm0;->i:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 v0, 0x3

    .line 14
    if-ne p0, v0, :cond_1

    .line 15
    .line 16
    sget-object p0, Ll/ahm0;->h:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 v0, 0x1

    .line 24
    if-ne p0, v0, :cond_2

    .line 25
    .line 26
    return v0

    .line 27
    :cond_2
    if-nez p0, :cond_3

    .line 28
    .line 29
    return v0

    .line 30
    :cond_3
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/ahm0;->c:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/pec0;->d2:I

    .line 12
    .line 13
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 v0, 0x3

    .line 19
    if-ne p2, v0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Ll/ahm0;->c:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget p2, Ll/pec0;->d2:I

    .line 28
    .line 29
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_1
    const/4 v0, 0x1

    .line 35
    if-ne p2, v0, :cond_2

    .line 36
    .line 37
    iget-object p0, p0, Ll/ahm0;->c:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget p2, Ll/pec0;->c2:I

    .line 44
    .line 45
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_2
    if-nez p2, :cond_3

    .line 51
    .line 52
    iget-object p0, p0, Ll/ahm0;->c:Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    sget p2, Ll/pec0;->e2:I

    .line 59
    .line 60
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :cond_3
    new-instance p1, Landroid/view/View;

    .line 66
    .line 67
    iget-object p0, p0, Ll/ahm0;->c:Lcom/p1/mobile/android/app/Act;

    .line 68
    .line 69
    invoke-direct {p1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 70
    .line 71
    .line 72
    return-object p1
.end method

.method public final synthetic G(Lcom/p1/mobile/putong/core/data/VisitorSortType;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/ahm0;->f:Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 2
    .line 3
    iget-object v0, p0, Ll/ahm0;->d:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 4
    .line 5
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic H(Lcom/p1/mobile/putong/core/data/VisitorFilterType;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/ahm0;->g:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 2
    .line 3
    iget-object v0, p0, Ll/ahm0;->d:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 4
    .line 5
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public I(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ahm0;->e:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

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
    iget p0, p0, Ll/ahm0;->e:I

    .line 2
    .line 3
    return p0
.end method
