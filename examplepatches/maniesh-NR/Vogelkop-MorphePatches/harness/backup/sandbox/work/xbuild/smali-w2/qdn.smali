.class public final Lqdn;
.super Landroid/widget/Filter;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Lm2g;


# direct methods
.method public constructor <init>(Ljava/util/List;Lm2g;)V
    .registers 3

    invoke-direct {p0}, Landroid/widget/Filter;-><init>()V

    iput-object p1, p0, Lqdn;->a:Ljava/util/List;

    iput-object p2, p0, Lqdn;->b:Lm2g;

    return-void
.end method


# virtual methods
.method public final performFiltering(Ljava/lang/CharSequence;)Landroid/widget/Filter$FilterResults;
    .registers 15

    new-instance v0, Landroid/widget/Filter$FilterResults;

    invoke-direct {v0}, Landroid/widget/Filter$FilterResults;-><init>()V

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-nez v1, :cond_12

    iput-object v3, v0, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    iput v2, v0, Landroid/widget/Filter$FilterResults;->count:I

    return-object v0

    :cond_12
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iget-object p0, p0, Lqdn;->a:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_22
    :goto_22
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_be

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lfdn;

    invoke-virtual {v5}, Lfdn;->b()Z

    move-result v6

    iget-object v7, v5, Lfdn;->f:Lfdn;

    if-eqz v6, :cond_42

    sget-object v6, Lpdn;->a:Lx1b;

    iget-object v8, v5, Lfdn;->a:Ljava/lang/String;

    iget-object v6, v6, Lx1b;->e:Ljava/lang/Object;

    invoke-virtual {v6, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_22

    :cond_42
    iget-boolean v6, v5, Lfdn;->e:Z

    const/4 v8, 0x1

    if-nez v6, :cond_99

    invoke-virtual {v5}, Lfdn;->b()Z

    move-result v6

    if-eqz v6, :cond_53

    new-instance v6, Lscd;

    invoke-direct {v6, v5, v8}, Lscd;-><init>(Lfdn;B)V

    goto :goto_58

    :cond_53
    new-instance v6, Lscd;

    invoke-direct {v6, v5, v2}, Lscd;-><init>(Lfdn;B)V

    :goto_58
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v9

    iget-byte v10, v6, Lscd;->a:B

    iget-object v6, v6, Lscd;->b:Lfdn;

    packed-switch v10, :pswitch_data_d2

    invoke-static {v9, v6}, Lscd;->S(Ljava/lang/String;Lfdn;)Lrcd;

    move-result-object v9

    if-eqz v9, :cond_99

    new-instance v10, Lwxc;

    invoke-direct {v10, v9, v6}, Lwxc;-><init>(Lrcd;Lfdn;)V

    goto :goto_a0

    :pswitch_6f
    if-eqz v6, :cond_99

    iget-object v10, v6, Lfdn;->f:Lfdn;

    invoke-static {v9, v10}, Lscd;->S(Ljava/lang/String;Lfdn;)Lrcd;

    move-result-object v11

    invoke-static {v9, v6}, Lscd;->S(Ljava/lang/String;Lfdn;)Lrcd;

    move-result-object v9

    if-nez v11, :cond_7f

    if-eqz v9, :cond_99

    :cond_7f
    if-nez v9, :cond_8d

    iget-object v10, v10, Lfdn;->g:Ljava/util/ArrayList;

    invoke-static {v10}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    if-le v10, v8, :cond_99

    :cond_8d
    sget-object v10, Lpdn;->a:Lx1b;

    iget-object v12, v6, Lfdn;->a:Ljava/lang/String;

    iget-object v10, v10, Lx1b;->e:Ljava/lang/Object;

    invoke-virtual {v10, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_9b

    :cond_99
    move-object v10, v3

    goto :goto_a0

    :cond_9b
    new-instance v10, Lvxc;

    invoke-direct {v10, v11, v9, v6}, Lvxc;-><init>(Lrcd;Lrcd;Lfdn;)V

    :goto_a0
    if-eqz v10, :cond_22

    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v5}, Lfdn;->b()Z

    move-result v5

    if-nez v5, :cond_22

    iget-object v5, v7, Lfdn;->g:Ljava/util/ArrayList;

    invoke-static {v5}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ne v5, v8, :cond_22

    iget-object v5, v7, Lfdn;->c:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    :cond_be
    new-instance p0, Lf15;

    const/16 p1, 0x8

    invoke-direct {p0, v1, p1}, Lf15;-><init>(Ljava/lang/Object;B)V

    invoke-static {v4, p0}, Lsfe;->A0(Ljava/lang/Iterable;Lsrg;)Z

    iput-object v4, v0, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result p0

    iput p0, v0, Landroid/widget/Filter$FilterResults;->count:I

    return-object v0

    nop

    :pswitch_data_d2
    .packed-switch 0x0
        :pswitch_6f
    .end packed-switch
.end method

.method public final publishResults(Ljava/lang/CharSequence;Landroid/widget/Filter$FilterResults;)V
    .registers 4

    iget-object p1, p2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_10

    new-instance p2, Lomj;

    const/16 v0, 0x12

    invoke-direct {p2, v0}, Lomj;-><init>(B)V

    invoke-static {p1, p2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_10
    iget-object p0, p0, Lqdn;->b:Lm2g;

    invoke-virtual {p0, p1}, Lm2g;->run(Ljava/lang/Object;)V

    return-void
.end method
