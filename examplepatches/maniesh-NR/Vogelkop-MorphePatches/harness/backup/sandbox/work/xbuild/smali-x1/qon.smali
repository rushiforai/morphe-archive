.class public final Lqon;
.super Lltl;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0007\u0018\u00002\u00020\u0001:\u0003\u0004\u0005\u0006B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0007"
    }
    d2 = {
        "Lqon;",
        "Lltl;",
        "<init>",
        "()V",
        "non",
        "pon",
        "x93",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-static {}, Lu7k;->e()Lu7k;

    move-result-object v0

    new-instance v1, Lqxh;

    const-string v2, "Weather icon preview"

    invoke-direct {v1, v2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    iput-object v1, v0, Litl;->a:Lpxh;

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    return-void
.end method


# virtual methods
.method public final B0(Landroid/view/LayoutInflater;Lcom/opera/android/custom_views/FadingRecyclerView;)V
    .registers 5

    new-instance p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {p2, p0}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    sget-object p0, Llon;->e:Lh58;

    new-instance p1, Lw8l;

    const/16 v0, 0xa

    invoke-direct {p1, v0}, Lw8l;-><init>(B)V

    invoke-static {p1, p0}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    new-instance p1, Ljava/util/ArrayList;

    invoke-static {p0, v0}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_27
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3c

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llon;

    new-instance v1, Lnon;

    invoke-direct {v1, v0}, Lnon;-><init>(Llon;)V

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_27

    :cond_3c
    new-instance p0, Lx93;

    const/4 v0, 0x6

    invoke-direct {p0, p1, v0}, Lx93;-><init>(Ljava/util/AbstractList;B)V

    invoke-virtual {p2, p0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    return-void
.end method
