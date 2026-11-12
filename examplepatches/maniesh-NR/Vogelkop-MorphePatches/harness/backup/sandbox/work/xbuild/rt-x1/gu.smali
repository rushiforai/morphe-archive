.class public final synthetic Lgu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lju;


# direct methods
.method public synthetic constructor <init>(Lju;B)V
    .registers 3

    iput-byte p2, p0, Lgu;->a:B

    iput-object p1, p0, Lgu;->b:Lju;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 11

    iget-byte v0, p0, Lgu;->a:B

    iget-object p0, p0, Lgu;->b:Lju;

    packed-switch v0, :pswitch_data_78

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p0, Lju;->d:Lot;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Loy;->g(Ljava/lang/String;)V

    invoke-virtual {p0}, Lju;->f()V

    return-void

    :pswitch_16
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0}, Lju;->f()V

    return-void

    :pswitch_1c
    check-cast p1, Ljava/util/Set;

    iget-object v0, p0, Lju;->s:Liu;

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-static {v0, p1, v1, v2}, Lns;->e(Lns;Ljava/util/Set;II)V

    iget-object v0, p0, Lju;->t:Lhu;

    invoke-static {v0, p1, v1, v2}, Lns;->e(Lns;Ljava/util/Set;II)V

    iget-object v0, p0, Lju;->r:Lhu;

    iget-object v3, p0, Lju;->k:[Lst;

    if-nez v3, :cond_32

    new-array v3, v1, [Lst;

    :cond_32
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    array-length v5, v3

    move v6, v1

    :goto_39
    if-ge v6, v5, :cond_51

    aget-object v7, v3, v6

    iget-object v8, v7, Lst;->b:Ljava/lang/String;

    iget-object v7, v7, Lst;->g:Ljava/lang/String;

    filled-new-array {v8, v7}, [Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    check-cast v7, Ljava/lang/Iterable;

    invoke-static {v7, v4}, Lo95;->t(Ljava/lang/Iterable;Ljava/util/Collection;)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_39

    :cond_51
    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v3

    check-cast v3, Ljava/lang/Iterable;

    invoke-static {p1, v3}, Lb5j;->e(Ljava/util/Set;Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v3

    invoke-static {v0, v3, v1, v2}, Lns;->e(Lns;Ljava/util/Set;II)V

    iget-object v0, p0, Lju;->p:Lhu;

    invoke-static {v0, p1, v1, v2}, Lns;->e(Lns;Ljava/util/Set;II)V

    iget-object p0, p0, Lju;->q:Lus;

    invoke-static {p0, p1, v1, v2}, Lns;->e(Lns;Ljava/util/Set;II)V

    return-void

    :pswitch_69
    check-cast p1, Ljq8;

    iget-object v0, p0, Lju;->p:Lhu;

    iget-object v1, p1, Ljq8;->a:Ljava/util/List;

    invoke-virtual {v0, v1}, Lns;->d(Ljava/lang/Object;)V

    iget-object p0, p0, Lju;->q:Lus;

    invoke-virtual {p0, p1}, Lns;->d(Ljava/lang/Object;)V

    return-void

    :pswitch_data_78
    .packed-switch 0x0
        :pswitch_69
        :pswitch_1c
        :pswitch_16
    .end packed-switch
.end method
