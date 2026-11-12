.class public final Le39;
.super Lalo;
.source "SourceFile"


# static fields
.field public static final m:Le39;

.field public static final n:Le39;

.field public static final o:Le39;


# instance fields
.field public final synthetic l:B


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 2

    new-instance v0, Le39;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Le39;-><init>(B)V

    sput-object v0, Le39;->m:Le39;

    new-instance v0, Le39;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Le39;-><init>(B)V

    sput-object v0, Le39;->n:Le39;

    new-instance v0, Le39;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Le39;-><init>(B)V

    sput-object v0, Le39;->o:Le39;

    return-void
.end method

.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Le39;->l:B

    const/16 p1, 0x12

    invoke-direct {p0, p1}, Lalo;-><init>(B)V

    return-void
.end method


# virtual methods
.method public final a0(Ljava/util/List;Lj2g;)Ljava/util/List;
    .registers 11

    iget-byte p0, p0, Le39;->l:B

    const/4 v0, 0x1

    const-string v1, "on"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/16 v4, 0x1b

    const/4 v5, 0x2

    packed-switch p0, :pswitch_data_1ae

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p0

    if-ne p0, v5, :cond_97

    check-cast p1, Ljava/lang/Iterable;

    instance-of p0, p1, Ljava/util/Collection;

    if-eqz p0, :cond_22

    move-object v0, p1

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_97

    :cond_22
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_26
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_97

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lf39;

    iget-object v1, v1, Lf39;->b:Lnf2;

    sget-object v5, Lnf2;->g:Lnf2;

    if-ne v1, v5, :cond_26

    if-eqz p0, :cond_43

    move-object p0, p1

    check-cast p0, Ljava/util/Collection;

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_97

    :cond_43
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_47
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_97

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lf39;

    iget-object v1, v0, Lf39;->b:Lnf2;

    if-nez v1, :cond_47

    iget-object v0, v0, Lf39;->c:Lp09;

    sget-object v1, Lp09;->c:Ll09;

    if-ne v0, v1, :cond_47

    new-instance p0, Ljava/util/ArrayList;

    const/16 v0, 0xa

    invoke-static {p1, v0}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v0

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_6c
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_86

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lf39;

    iget-object v1, v0, Lf39;->b:Lnf2;

    if-nez v1, :cond_7e

    sget-object v1, Lnf2;->h:Lnf2;

    :cond_7e
    invoke-static {v0, v1, v4}, Lf39;->a(Lf39;Lnf2;I)Lvz8;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6c

    :cond_86
    new-array p1, v3, [Lvz8;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Lvz8;

    new-instance p1, Ld16;

    invoke-direct {p1, p0, p2}, Ld16;-><init>([Lvz8;Lj2g;)V

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    :cond_97
    return-object v2

    :pswitch_98
    move-object p0, p1

    check-cast p0, Ljava/lang/Iterable;

    instance-of v6, p0, Ljava/util/Collection;

    if-eqz v6, :cond_a8

    move-object v6, p0

    check-cast v6, Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_be

    :cond_a8
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_ac
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_be

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lf39;

    iget-object v6, v6, Lf39;->b:Lnf2;

    if-eqz v6, :cond_ac

    goto/16 :goto_135

    :cond_be
    instance-of p0, p2, Li2g;

    if-eqz p0, :cond_135

    move-object p0, p2

    check-cast p0, Li2g;

    iget-object v6, p0, Li2g;->d:Ljava/lang/String;

    const-string v7, "ru.rostel"

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_135

    iget-object p0, p0, Li2g;->c:Ljava/lang/String;

    const-string v6, "esia.gosuslugi.ru"

    invoke-static {p0, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_135

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p0

    if-ne p0, v5, :cond_135

    move-object p0, p1

    check-cast p0, Ljava/lang/Iterable;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_eb
    :goto_eb
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_10a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v7, v6

    check-cast v7, Lf39;

    iget-object v7, v7, Lf39;->a:Landroid/app/assist/AssistStructure$ViewNode;

    invoke-virtual {v7}, Landroid/app/assist/AssistStructure$ViewNode;->getAutofillHints()[Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_eb

    invoke-static {v1, v7}, Le82;->u(Ljava/lang/Object;[Ljava/lang/Object;)I

    move-result v7

    if-ltz v7, :cond_eb

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_eb

    :cond_10a
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_135

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf39;

    sget-object v1, Lnf2;->h:Lnf2;

    invoke-static {p0, v1, v4}, Lf39;->a(Lf39;Lnf2;I)Lvz8;

    move-result-object p0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lf39;

    sget-object v0, Lnf2;->g:Lnf2;

    invoke-static {p1, v0, v4}, Lf39;->a(Lf39;Lnf2;I)Lvz8;

    move-result-object p1

    new-instance v0, Ld16;

    filled-new-array {p0, p1}, [Lvz8;

    move-result-object p0

    invoke-direct {v0, p0, p2}, Ld16;-><init>([Lvz8;Lj2g;)V

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    :cond_135
    :goto_135
    return-object v2

    :pswitch_136
    check-cast p1, Ljava/lang/Iterable;

    instance-of p0, p1, Ljava/util/Collection;

    if-eqz p0, :cond_145

    move-object p0, p1

    check-cast p0, Ljava/util/Collection;

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_15a

    :cond_145
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_149
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_15a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lf39;

    iget-object v6, v6, Lf39;->b:Lnf2;

    if-eqz v6, :cond_149

    goto :goto_1ad

    :cond_15a
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_163
    :goto_163
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_182

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v7, v6

    check-cast v7, Lf39;

    iget-object v7, v7, Lf39;->a:Landroid/app/assist/AssistStructure$ViewNode;

    invoke-virtual {v7}, Landroid/app/assist/AssistStructure$ViewNode;->getAutofillHints()[Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_163

    invoke-static {v1, v7}, Le82;->u(Ljava/lang/Object;[Ljava/lang/Object;)I

    move-result v7

    if-ltz v7, :cond_163

    invoke-virtual {p0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_163

    :cond_182
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ne p1, v5, :cond_1ad

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lf39;

    sget-object v1, Lnf2;->h:Lnf2;

    invoke-static {p1, v1, v4}, Lf39;->a(Lf39;Lnf2;I)Lvz8;

    move-result-object p1

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf39;

    sget-object v0, Lnf2;->g:Lnf2;

    invoke-static {p0, v0, v4}, Lf39;->a(Lf39;Lnf2;I)Lvz8;

    move-result-object p0

    new-instance v0, Ld16;

    filled-new-array {p1, p0}, [Lvz8;

    move-result-object p0

    invoke-direct {v0, p0, p2}, Ld16;-><init>([Lvz8;Lj2g;)V

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    :cond_1ad
    :goto_1ad
    return-object v2

    :pswitch_data_1ae
    .packed-switch 0x0
        :pswitch_136
        :pswitch_98
    .end packed-switch
.end method
