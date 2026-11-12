.class public final Lsab;
.super Landroid/widget/Filter;
.source "SourceFile"


# instance fields
.field public final a:Landroid/icu/text/RuleBasedCollator;

.field public final synthetic b:Ltab;


# direct methods
.method public constructor <init>(Ltab;)V
    .registers 3

    iput-object p1, p0, Lsab;->b:Ltab;

    invoke-direct {p0}, Landroid/widget/Filter;-><init>()V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p1

    invoke-static {p1}, Landroid/icu/text/Collator;->getInstance(Ljava/util/Locale;)Landroid/icu/text/Collator;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/icu/text/Collator;->setStrength(I)V

    check-cast p1, Landroid/icu/text/RuleBasedCollator;

    iput-object p1, p0, Lsab;->a:Landroid/icu/text/RuleBasedCollator;

    return-void
.end method


# virtual methods
.method public final convertResultToString(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 3

    instance-of p0, p1, Lzt1;

    const/4 v0, 0x0

    if-eqz p0, :cond_8

    check-cast p1, Lzt1;

    goto :goto_9

    :cond_8
    move-object p1, v0

    :goto_9
    if-eqz p1, :cond_f

    invoke-interface {p1}, Lzt1;->getName()Ljava/lang/String;

    move-result-object v0

    :cond_f
    if-nez v0, :cond_14

    const-string p0, ""

    return-object p0

    :cond_14
    return-object v0
.end method

.method public final performFiltering(Ljava/lang/CharSequence;)Landroid/widget/Filter$FilterResults;
    .registers 9

    iget-object v0, p0, Lsab;->b:Ltab;

    iget-object v0, v0, Ltab;->d:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6a

    if-eqz p1, :cond_6a

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-eqz v1, :cond_6a

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v2, Lyt1;

    invoke-direct {v2, p1}, Lyt1;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    check-cast v0, Ljava/lang/Iterable;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2e
    :goto_2e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_55

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lzt1;

    invoke-interface {v4}, Lzt1;->getName()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Landroid/icu/text/StringSearch;

    new-instance v6, Ljava/text/StringCharacterIterator;

    invoke-direct {v6, v4}, Ljava/text/StringCharacterIterator;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lsab;->a:Landroid/icu/text/RuleBasedCollator;

    invoke-direct {v5, p1, v6, v4}, Landroid/icu/text/StringSearch;-><init>(Ljava/lang/String;Ljava/text/CharacterIterator;Landroid/icu/text/RuleBasedCollator;)V

    invoke-virtual {v5}, Landroid/icu/text/SearchIterator;->next()I

    move-result v4

    if-nez v4, :cond_2e

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2e

    :cond_55
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    new-instance p1, Landroid/widget/Filter$FilterResults;

    invoke-direct {p1}, Landroid/widget/Filter$FilterResults;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    iput v0, p1, Landroid/widget/Filter$FilterResults;->count:I

    iput-object p0, p1, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    return-object p1

    :cond_6a
    new-instance p0, Landroid/widget/Filter$FilterResults;

    invoke-direct {p0}, Landroid/widget/Filter$FilterResults;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    iput p1, p0, Landroid/widget/Filter$FilterResults;->count:I

    iput-object v0, p0, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    return-object p0
.end method

.method public final publishResults(Ljava/lang/CharSequence;Landroid/widget/Filter$FilterResults;)V
    .registers 3

    if-nez p2, :cond_3

    return-void

    :cond_3
    iget-object p1, p2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    instance-of p2, p1, Ljava/util/List;

    if-eqz p2, :cond_c

    check-cast p1, Ljava/util/List;

    goto :goto_d

    :cond_c
    const/4 p1, 0x0

    :goto_d
    if-nez p1, :cond_11

    sget-object p1, Ll08;->a:Ll08;

    :cond_11
    iget-object p0, p0, Lsab;->b:Ltab;

    iput-object p1, p0, Ltab;->e:Ljava/util/List;

    check-cast p1, Ljava/util/Collection;

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_21

    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    return-void

    :cond_21
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetInvalidated()V

    return-void
.end method
