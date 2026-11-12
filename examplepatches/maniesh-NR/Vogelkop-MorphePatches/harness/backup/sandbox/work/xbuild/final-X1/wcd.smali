.class public final Lwcd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Lode;

.field public final c:Lew3;

.field public final d:Ld3g;

.field public e:Landroid/util/SparseArray;

.field public final f:Ld8d;

.field public final g:Lh42;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lode;Lode;Lew3;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwcd;->a:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Lwcd;->b:Lode;

    iput-object p4, p0, Lwcd;->c:Lew3;

    new-instance p1, Ld3g;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-static {}, LJ/N;->MVpA6Bt9()J

    move-result-wide v0

    iput-wide v0, p1, Ld3g;->a:J

    iput-object p1, p0, Lwcd;->d:Ld3g;

    new-instance p4, Landroid/util/SparseArray;

    invoke-direct {p4}, Landroid/util/SparseArray;-><init>()V

    iput-object p4, p0, Lwcd;->e:Landroid/util/SparseArray;

    new-instance p4, Ld8d;

    const/4 v0, 0x3

    invoke-direct {p4, p0, v0}, Ld8d;-><init>(Ljava/lang/Object;B)V

    iput-object p4, p0, Lwcd;->f:Ld8d;

    new-instance v0, Luvc;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Luvc;-><init>(B)V

    invoke-static {p3, v0}, Lb8h;->j(Lekc;Lkotlin/jvm/functions/Function1;)Lh42;

    move-result-object p3

    iput-object p3, p0, Lwcd;->g:Lh42;

    invoke-virtual {p2, p4}, Lekc;->k(Lf7f;)V

    invoke-virtual {p3, p1}, Lekc;->k(Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lvcd;)Ll2g;
    .registers 10

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p1}, Laik;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lwqm;->e:[Ljava/lang/String;

    invoke-static {p1, v0}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-ge v0, v1, :cond_28

    sget-object p0, Ll08;->a:Ll08;

    goto/16 :goto_af

    :cond_28
    iget-object v0, p0, Lwcd;->d:Ld3g;

    iget-wide v3, v0, Ld3g;->a:J

    const-wide/16 v5, 0x0

    cmp-long v1, v3, v5

    if-eqz v1, :cond_41

    iget-boolean v0, v0, Ld3g;->b:Z

    if-eqz v0, :cond_41

    invoke-static {v3, v4, p1}, LJ/N;->Mq4l5ZJ8(JLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    invoke-static {v0}, Lsgb;->i([I)Ljava/util/List;

    move-result-object v0

    goto :goto_43

    :cond_41
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_43
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    if-eqz p2, :cond_57

    const/4 v1, 0x1

    if-ne p2, v1, :cond_53

    new-instance p2, Luvc;

    const/4 v1, 0x5

    invoke-direct {p2, v1}, Luvc;-><init>(B)V

    goto :goto_5d

    :cond_53
    invoke-static {}, Lh9o;->p()V

    return-object v2

    :cond_57
    new-instance p2, Luvc;

    const/4 v1, 0x4

    invoke-direct {p2, v1}, Luvc;-><init>(B)V

    :goto_5d
    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_68
    :goto_68
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_86

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    iget-object v4, p0, Lwcd;->e:Landroid/util/SparseArray;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v4, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ll2g;

    if-eqz v3, :cond_68

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_68

    :cond_86
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v3, 0x0

    :cond_90
    :goto_90
    if-ge v3, v0, :cond_af

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    move-object v5, v4

    check-cast v5, Ll2g;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    invoke-interface {p2, v5}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    if-lt v6, v5, :cond_90

    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_90

    :cond_af
    :goto_af
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_b6

    return-object v2

    :cond_b6
    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_ea

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    :goto_c6
    move-object v2, p1

    :cond_c7
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_ea

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    move-object p2, v2

    check-cast p2, Ll2g;

    iget-wide v0, p2, Ll2g;->i:D

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p2

    move-object v0, p1

    check-cast v0, Ll2g;

    iget-wide v0, v0, Ll2g;->i:D

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/Double;->compareTo(Ljava/lang/Object;)I

    move-result p2

    if-gez p2, :cond_c7

    goto :goto_c6

    :cond_ea
    check-cast v2, Ll2g;

    return-object v2
.end method
