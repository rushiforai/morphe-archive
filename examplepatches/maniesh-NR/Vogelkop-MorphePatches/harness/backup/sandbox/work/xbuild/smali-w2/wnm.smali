.class public final Lwnm;
.super Ltsd;
.source "SourceFile"


# instance fields
.field public final m:Lkotlin/jvm/functions/Function0;

.field public final n:Lkotlin/jvm/functions/Function0;

.field public final o:Ljava/util/LinkedHashSet;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Iterable;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V
    .registers 5

    invoke-direct {p0, p1}, Ltsd;-><init>(Ljava/lang/Object;)V

    iput-object p3, p0, Lwnm;->m:Lkotlin/jvm/functions/Function0;

    iput-object p4, p0, Lwnm;->n:Lkotlin/jvm/functions/Function0;

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lwnm;->o:Ljava/util/LinkedHashSet;

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_12
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_22

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lekc;

    invoke-virtual {p0, p2}, Lwnm;->t(Lekc;)V

    goto :goto_12

    :cond_22
    return-void
.end method


# virtual methods
.method public final s(Lekc;Lf7f;)V
    .registers 4

    iget-object v0, p0, Lwnm;->o:Ljava/util/LinkedHashSet;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    new-instance v0, Lo2g;

    invoke-direct {v0, p0, p1, p2}, Lo2g;-><init>(Lwnm;Lekc;Lf7f;)V

    invoke-super {p0, p1, v0}, Ltsd;->s(Lekc;Lf7f;)V

    return-void
.end method

.method public final t(Lekc;)V
    .registers 4

    iget-object v0, p0, Lwnm;->o:Ljava/util/LinkedHashSet;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    new-instance v0, Lo2g;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lo2g;-><init>(Lwnm;Lekc;Lf7f;)V

    invoke-super {p0, p1, v0}, Ltsd;->s(Lekc;Lf7f;)V

    return-void
.end method

.method public final u()V
    .registers 2

    iget-object v0, p0, Lwnm;->m:Lkotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object v0, p0, Lwnm;->n:Lkotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Ltsd;->r(Ljava/lang/Object;)V

    :cond_17
    return-void
.end method
