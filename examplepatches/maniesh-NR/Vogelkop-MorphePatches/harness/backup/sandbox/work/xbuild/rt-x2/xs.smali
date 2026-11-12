.class public final Lxs;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Lqb7;

.field public final c:Ltw2;

.field public final d:Lcom/opera/android/settings/SettingsManager;

.field public final e:Ltr8;

.field public f:I

.field public final g:Lh42;

.field public h:[Lst;

.field public i:Lkq8;


# direct methods
.method public constructor <init>(Lqb7;Ltw2;Lcom/opera/android/settings/SettingsManager;Ltr8;)V
    .registers 5

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p1, p0, Lxs;->b:Lqb7;

    iput-object p2, p0, Lxs;->c:Ltw2;

    iput-object p3, p0, Lxs;->d:Lcom/opera/android/settings/SettingsManager;

    iput-object p4, p0, Lxs;->e:Ltr8;

    new-instance p1, Lh42;

    invoke-direct {p1}, Lh42;-><init>()V

    iput-object p1, p0, Lxs;->g:Lh42;

    const/4 p2, 0x0

    new-array p2, p2, [Lst;

    iput-object p2, p0, Lxs;->h:[Lst;

    iget-object p2, p4, Ltr8;->e:Lwnm;

    new-instance p3, Lz3;

    const/16 p4, 0x8

    invoke-direct {p3, p0, p4}, Lz3;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lpb;

    const/4 p4, 0x3

    invoke-direct {p0, p3, p4}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2, p0}, Lh42;->s(Lekc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final e()V
    .registers 1

    iget-object p0, p0, Lxs;->b:Lqb7;

    iget-object p0, p0, Lqb7;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    return-void
.end method

.method public final f()V
    .registers 9

    iget-object v0, p0, Lxs;->h:[Lst;

    array-length v0, v0

    if-nez v0, :cond_6

    return-void

    :cond_6
    iget-object v0, p0, Lxs;->e:Ltr8;

    iget-object v0, v0, Ltr8;->e:Lwnm;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    if-nez v0, :cond_14

    sget-object v0, Lv08;->a:Lv08;

    :cond_14
    iget-object v1, p0, Lxs;->h:[Lst;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    array-length v3, v1

    const/4 v4, 0x0

    move v5, v4

    :goto_1e
    if-ge v5, v3, :cond_30

    aget-object v6, v1, v5

    iget-object v7, v6, Lst;->b:Ljava/lang/String;

    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2d

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2d
    add-int/lit8 v5, v5, 0x1

    goto :goto_1e

    :cond_30
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {v2, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_3f
    if-ge v4, v1, :cond_56

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v4, v4, 0x1

    check-cast v3, Lst;

    new-instance v5, Lis;

    sget-object v6, Lgt;->b:Lgt;

    sget-object v7, Lds;->c:Lds;

    invoke-direct {v5, v3, v6, v7}, Lis;-><init>(Lst;Lgt;Lds;)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3f

    :cond_56
    iget-object p0, p0, Lxs;->g:Lh42;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
