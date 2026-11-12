.class public final Lc83;
.super Landroid/widget/Filter;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Landroid/widget/Filterable;


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    .line 13
    const/4 v0, 0x1

    iput-byte v0, p0, Lc83;->a:B

    invoke-direct {p0}, Landroid/widget/Filter;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Landroidx/recyclerview/widget/d;B)V
    .registers 3

    .line 12
    iput-byte p2, p0, Lc83;->a:B

    check-cast p1, Landroid/widget/Filterable;

    iput-object p1, p0, Lc83;->b:Landroid/widget/Filterable;

    invoke-direct {p0}, Landroid/widget/Filter;-><init>()V

    return-void
.end method

.method public constructor <init>(Lgvc;)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Lc83;->a:B

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lc83;->b:Landroid/widget/Filterable;

    invoke-direct {p0}, Landroid/widget/Filter;-><init>()V

    return-void
.end method

.method public constructor <init>(Lqmj;)V
    .registers 3

    const/4 v0, 0x3

    iput-byte v0, p0, Lc83;->a:B

    .line 14
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lc83;->b:Landroid/widget/Filterable;

    invoke-direct {p0}, Landroid/widget/Filter;-><init>()V

    return-void
.end method


# virtual methods
.method public final convertResultToString(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 3

    iget-byte v0, p0, Lc83;->a:B

    packed-switch v0, :pswitch_data_16

    invoke-super {p0, p1}, Landroid/widget/Filter;->convertResultToString(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object p0, p0, Lc83;->b:Landroid/widget/Filterable;

    check-cast p0, Lm46;

    check-cast p1, Landroid/database/Cursor;

    invoke-virtual {p0, p1}, Lm46;->c(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final performFiltering(Ljava/lang/CharSequence;)Landroid/widget/Filter$FilterResults;
    .registers 11

    iget-byte v0, p0, Lc83;->a:B

    const-string v1, ""

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_152

    iget-object p0, p0, Lc83;->b:Landroid/widget/Filterable;

    check-cast p0, Ld83;

    iput-object p1, p0, Ld83;->f:Ljava/lang/Object;

    iget-object v0, p0, Ld83;->c:Ljava/util/List;

    check-cast v0, Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v2

    :cond_1c
    :goto_1c
    if-ge v4, v3, :cond_41

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    move-object v6, v5

    check-cast v6, Lldo;

    iget-object v7, p0, Ld83;->e:Ljava/lang/Object;

    check-cast v7, Ljava/util/TreeSet;

    iget-object v8, v6, Lldo;->a:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/util/TreeSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1c

    if-eqz p1, :cond_3d

    iget-object v6, v6, Lldo;->b:Ljava/lang/String;

    invoke-static {v6, p1, v2}, Lkotlin/text/StringsKt;->E(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v6

    if-eqz v6, :cond_1c

    :cond_3d
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    :cond_41
    new-instance p0, Landroid/widget/Filter$FilterResults;

    invoke-direct {p0}, Landroid/widget/Filter$FilterResults;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p1, p0, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p1

    iput p1, p0, Landroid/widget/Filter$FilterResults;->count:I

    return-object p0

    :pswitch_54
    iget-object p0, p0, Lc83;->b:Landroid/widget/Filterable;

    check-cast p0, Lqmj;

    iput-object p1, p0, Lqmj;->g:Ljava/lang/CharSequence;

    iget-object v0, p0, Lqmj;->d:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object p0, p0, Lqmj;->f:Ljava/util/TreeSet;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    :cond_67
    :goto_67
    if-ge v2, v3, :cond_83

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p0, v4}, Ljava/util/TreeSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_67

    if-eqz p1, :cond_7f

    invoke-virtual {v4, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_67

    :cond_7f
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_67

    :cond_83
    new-instance p0, Landroid/widget/Filter$FilterResults;

    invoke-direct {p0}, Landroid/widget/Filter$FilterResults;-><init>()V

    iput-object v1, p0, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p1

    iput p1, p0, Landroid/widget/Filter$FilterResults;->count:I

    return-object p0

    :pswitch_91
    if-eqz p1, :cond_9d

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    :cond_9d
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    iget-object p0, p0, Lc83;->b:Landroid/widget/Filterable;

    check-cast p0, Lgvc;

    if-eqz p1, :cond_aa

    iget-object p0, p0, Lgvc;->b:Ljava/util/List;

    goto :goto_ba

    :cond_aa
    iget-object p0, p0, Lgvc;->b:Ljava/util/List;

    new-instance p1, Lf15;

    const/4 v0, 0x1

    invoke-direct {p1, v1, v0}, Lf15;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0, p1}, Lsfe;->Q(Ljava/lang/Iterable;Lsrg;)Lzlb;

    move-result-object p0

    invoke-static {p0}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object p0

    :goto_ba
    new-instance p1, Landroid/widget/Filter$FilterResults;

    invoke-direct {p1}, Landroid/widget/Filter$FilterResults;-><init>()V

    iput-object p0, p1, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    iput p0, p1, Landroid/widget/Filter$FilterResults;->count:I

    return-object p1

    :pswitch_c8
    iget-object p0, p0, Lc83;->b:Landroid/widget/Filterable;

    check-cast p0, Lm46;

    check-cast p0, Ltqk;

    iget-object v0, p0, Ltqk;->l:Landroidx/appcompat/widget/SearchView;

    if-eqz p1, :cond_d6

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_d6
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result p1

    const/4 v3, 0x0

    if-nez p1, :cond_ef

    invoke-virtual {v0}, Landroid/view/View;->getWindowVisibility()I

    move-result p1

    if-nez p1, :cond_ef

    :try_start_e3
    iget-object p1, p0, Ltqk;->m:Landroid/app/SearchableInfo;

    invoke-virtual {p0, p1, v1}, Ltqk;->g(Landroid/app/SearchableInfo;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    if-eqz p0, :cond_ef

    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I
    :try_end_ee
    .catch Ljava/lang/RuntimeException; {:try_start_e3 .. :try_end_ee} :catch_ef

    goto :goto_f0

    :catch_ef
    :cond_ef
    move-object p0, v3

    :goto_f0
    new-instance p1, Landroid/widget/Filter$FilterResults;

    invoke-direct {p1}, Landroid/widget/Filter$FilterResults;-><init>()V

    if-eqz p0, :cond_100

    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    iput v0, p1, Landroid/widget/Filter$FilterResults;->count:I

    iput-object p0, p1, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    goto :goto_104

    :cond_100
    iput v2, p1, Landroid/widget/Filter$FilterResults;->count:I

    iput-object v3, p1, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    :goto_104
    return-object p1

    :pswitch_105
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Landroid/widget/Filter$FilterResults;

    invoke-direct {v1}, Landroid/widget/Filter$FilterResults;-><init>()V

    iput-object v0, v1, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    iget-object p0, p0, Lc83;->b:Landroid/widget/Filterable;

    check-cast p0, Ld83;

    iget-object p0, p0, Ld83;->b:Ljava/lang/Object;

    check-cast p0, La4g;

    if-eqz p0, :cond_151

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    iget-object p0, p0, La4g;->a:Ljava/util/List;

    if-eqz v2, :cond_12b

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_14b

    :cond_12b
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_133
    :goto_133
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lw3g;

    iget-object v3, v2, Lw3g;->c:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_133

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_133

    :cond_14b
    :goto_14b
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    iput p0, v1, Landroid/widget/Filter$FilterResults;->count:I

    :cond_151
    return-object v1

    :pswitch_data_152
    .packed-switch 0x0
        :pswitch_105
        :pswitch_c8
        :pswitch_91
        :pswitch_54
    .end packed-switch
.end method

.method public final publishResults(Ljava/lang/CharSequence;Landroid/widget/Filter$FilterResults;)V
    .registers 6

    iget-byte p1, p0, Lc83;->a:B

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_90

    new-instance p1, Ljava/util/ArrayList;

    iget-object p0, p0, Lc83;->b:Landroid/widget/Filterable;

    check-cast p0, Ld83;

    iget-object v1, p0, Ld83;->d:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-direct {p1, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object p2, p2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    invoke-static {p2}, Ly9m;->q(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    check-cast p2, Ljava/util/Collection;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    new-instance p2, Ljs8;

    const/4 v2, 0x2

    invoke-direct {p2, p1, v1, v2}, Ljs8;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p2, v0}, Luup;->k(Lk1g;Z)Lj87;

    move-result-object p1

    invoke-virtual {p1, p0}, Lj87;->b(Landroidx/recyclerview/widget/d;)V

    return-void

    :pswitch_2f
    iget-object p0, p0, Lc83;->b:Landroid/widget/Filterable;

    check-cast p0, Lqmj;

    iget-object p1, p0, Lqmj;->e:Ljava/util/List;

    iget-object p2, p2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    check-cast p2, Ljava/util/List;

    iput-object p2, p0, Lqmj;->e:Ljava/util/List;

    new-instance v1, Levc;

    invoke-direct {v1, p0, p1, p2}, Levc;-><init>(Lqmj;Ljava/util/List;Ljava/util/List;)V

    invoke-static {v1, v0}, Luup;->k(Lk1g;Z)Lj87;

    move-result-object p1

    invoke-virtual {p1, p0}, Lj87;->b(Landroidx/recyclerview/widget/d;)V

    return-void

    :pswitch_48
    iget-object p0, p0, Lc83;->b:Landroid/widget/Filterable;

    check-cast p0, Lgvc;

    iget-object p1, p0, Lgvc;->c:Ljava/util/List;

    iget-object p2, p2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    check-cast p2, Ljava/util/List;

    iput-object p2, p0, Lgvc;->c:Ljava/util/List;

    new-instance v1, Levc;

    invoke-direct {v1, p0, p1, p2}, Levc;-><init>(Lgvc;Ljava/util/List;Ljava/util/List;)V

    invoke-static {v1, v0}, Luup;->k(Lk1g;Z)Lj87;

    move-result-object p1

    invoke-virtual {p1, p0}, Lj87;->b(Landroidx/recyclerview/widget/d;)V

    return-void

    :pswitch_61
    iget-object p0, p0, Lc83;->b:Landroid/widget/Filterable;

    check-cast p0, Lm46;

    iget-object p1, p0, Lm46;->c:Landroid/database/Cursor;

    iget-object p2, p2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    if-eqz p2, :cond_72

    if-eq p2, p1, :cond_72

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p0, p2}, Lm46;->b(Landroid/database/Cursor;)V

    :cond_72
    return-void

    :pswitch_73
    iget-object p0, p0, Lc83;->b:Landroid/widget/Filterable;

    check-cast p0, Ld83;

    iget-object p1, p0, Ld83;->c:Ljava/util/List;

    if-eqz p1, :cond_85

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_85

    iget p1, p2, Landroid/widget/Filter$FilterResults;->count:I

    if-eqz p1, :cond_8e

    :cond_85
    iget-object p1, p2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    iput-object p1, p0, Ld83;->c:Ljava/util/List;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    :cond_8e
    return-void

    nop

    :pswitch_data_90
    .packed-switch 0x0
        :pswitch_73
        :pswitch_61
        :pswitch_48
        :pswitch_2f
    .end packed-switch
.end method
