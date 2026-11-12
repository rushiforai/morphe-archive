.class public final Llwc;
.super Landroid/widget/Filter;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lkze;Lz8b;Lwse;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Llwc;->a:B

    invoke-direct {p0}, Landroid/widget/Filter;-><init>()V

    iput-object p1, p0, Llwc;->b:Ljava/lang/Object;

    iput-object p2, p0, Llwc;->c:Ljava/lang/Object;

    iput-object p3, p0, Llwc;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Loy;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Llwc;->a:B

    .line 13
    iput-object p1, p0, Llwc;->d:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/widget/Filter;-><init>()V

    return-void
.end method


# virtual methods
.method public final performFiltering(Ljava/lang/CharSequence;)Landroid/widget/Filter$FilterResults;
    .registers 9

    iget-byte v0, p0, Llwc;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_c0

    new-instance p1, Landroid/widget/Filter$FilterResults;

    invoke-direct {p1}, Landroid/widget/Filter$FilterResults;-><init>()V

    iget-object v0, p0, Llwc;->d:Ljava/lang/Object;

    check-cast v0, Loy;

    iget-object v2, p0, Llwc;->b:Ljava/lang/Object;

    check-cast v2, Lesi;

    if-nez v2, :cond_16

    move-object v2, v1

    :cond_16
    iget-object p0, p0, Llwc;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_1d

    move-object v1, p0

    :cond_1d
    check-cast v1, Ljava/lang/Iterable;

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_28
    :goto_28
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_60

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Loy;->d(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    check-cast v4, Ljava/lang/Iterable;

    instance-of v5, v4, Ljava/util/Collection;

    if-eqz v5, :cond_45

    move-object v5, v4

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_28

    :cond_45
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_49
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_28

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v2, v5}, Lesi;->a(Ljava/lang/String;)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_49

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_28

    :cond_60
    iput-object p0, p1, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    iput p0, p1, Landroid/widget/Filter$FilterResults;->count:I

    return-object p1

    :pswitch_69
    iget-object p0, p0, Llwc;->b:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_7c
    :goto_7c
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_b1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Late;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_96

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_97

    :cond_96
    move-object v3, v1

    :goto_97
    iget-object v4, v2, Late;->b:Ljava/lang/String;

    invoke-static {v4, v3}, Late;->b(Ljava/lang/String;Ljava/lang/String;)Landroid/util/Range;

    move-result-object v4

    iput-object v4, v2, Late;->d:Landroid/util/Range;

    iget-object v4, v2, Late;->c:Ljava/lang/String;

    invoke-static {v4, v3}, Late;->b(Ljava/lang/String;Ljava/lang/String;)Landroid/util/Range;

    move-result-object v3

    iput-object v3, v2, Late;->e:Landroid/util/Range;

    iget-object v4, v2, Late;->d:Landroid/util/Range;

    if-nez v4, :cond_ad

    if-eqz v3, :cond_7c

    :cond_ad
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7c

    :cond_b1
    new-instance p0, Landroid/widget/Filter$FilterResults;

    invoke-direct {p0}, Landroid/widget/Filter$FilterResults;-><init>()V

    iput-object v0, p0, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    iput p1, p0, Landroid/widget/Filter$FilterResults;->count:I

    return-object p0

    nop

    :pswitch_data_c0
    .packed-switch 0x0
        :pswitch_69
    .end packed-switch
.end method

.method public final publishResults(Ljava/lang/CharSequence;Landroid/widget/Filter$FilterResults;)V
    .registers 6

    iget-byte v0, p0, Llwc;->a:B

    iget-object v1, p0, Llwc;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_76

    check-cast v1, Loy;

    if-eqz p2, :cond_1c

    invoke-virtual {v1}, Loy;->e()Z

    move-result p0

    if-eqz p0, :cond_1c

    iget-object p0, v1, Loy;->f:Ljava/lang/Object;

    check-cast p0, Lh42;

    iget-object p1, p2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    :cond_1c
    return-void

    :pswitch_1d
    check-cast v1, Lwse;

    const/4 v0, 0x0

    if-eqz p1, :cond_27

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_28

    :cond_27
    move-object p1, v0

    :goto_28
    if-nez p1, :cond_2c

    const-string p1, ""

    :cond_2c
    if-eqz p2, :cond_4e

    iget-object p2, p2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    instance-of v2, p2, Ljava/util/List;

    if-eqz v2, :cond_3f

    instance-of v2, p2, Lptb;

    if-eqz v2, :cond_3c

    instance-of v2, p2, Lrtb;

    if-eqz v2, :cond_3f

    :cond_3c
    check-cast p2, Ljava/util/List;

    goto :goto_40

    :cond_3f
    move-object p2, v0

    :goto_40
    if-eqz p2, :cond_4e

    iget-object p0, p0, Llwc;->c:Ljava/lang/Object;

    check-cast p0, Lz8b;

    iget-object p0, p0, Lz8b;->b:Ljava/lang/Object;

    check-cast p0, Ljk;

    invoke-static {p0, p2}, Ln95;->r(Ljava/util/Comparator;Ljava/util/List;)V

    move-object v0, p2

    :cond_4e
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, v1, Lwse;->o:Lbte;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lbte;->c:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_75

    iget-object p0, v1, Lwse;->n:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_75

    if-nez v0, :cond_70

    sget-object v0, Ll08;->a:Ll08;

    :cond_70
    iget-object p0, v1, Lwse;->l:Lh42;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_75
    return-void

    :pswitch_data_76
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method
