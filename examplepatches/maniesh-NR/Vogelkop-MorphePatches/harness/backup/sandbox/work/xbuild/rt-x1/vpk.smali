.class public final Lvpk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final a:Lzzh;

.field public final b:Lode;

.field public final c:Lipk;

.field public final d:Lh42;

.field public e:I

.field public f:I


# direct methods
.method public constructor <init>(Lipk;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lzzh;

    const/16 v1, 0x11

    invoke-direct {v0, p0, v1}, Lzzh;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lvpk;->a:Lzzh;

    new-instance v0, Lode;

    new-instance v1, Lupk;

    sget-object v2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v3, -0x1

    invoke-direct {v1, v2, v3}, Lupk;-><init>(Ljava/util/List;I)V

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lvpk;->b:Lode;

    const/4 v0, 0x0

    iput v0, p0, Lvpk;->e:I

    iput-object p1, p0, Lvpk;->c:Lipk;

    iget-object p1, p1, Lipk;->s:Lqie;

    iget-object p1, p1, Lqie;->b:Ljava/lang/Object;

    check-cast p1, Lh42;

    iput-object p1, p0, Lvpk;->d:Lh42;

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Lvpk;->d:Lh42;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkpk;

    iget-object v1, v0, Lk8;->a:Ljava/lang/Object;

    iget-object v0, v0, Lk8;->b:Ljava/lang/Object;

    check-cast v0, Lnpk;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_2b

    const/4 v2, 0x1

    if-eq v0, v2, :cond_18

    return-void

    :cond_18
    check-cast v1, Llpk;

    iget v0, p0, Lvpk;->f:I

    if-nez v0, :cond_24

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_26

    :cond_24
    iget-object v0, v1, Llpk;->c:Ljava/util/ArrayList;

    :goto_26
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lvpk;->b(ILjava/util/List;)V

    return-void

    :cond_2b
    check-cast v1, Lmpk;

    return-void
.end method

.method public final b(ILjava/util/List;)V
    .registers 10

    iget-object v0, p0, Lvpk;->b:Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lupk;

    iget-object v1, v1, Lupk;->a:Lh1b;

    new-instance v2, Lupk;

    invoke-direct {v2, p2, p1}, Lupk;-><init>(Ljava/util/List;I)V

    invoke-virtual {v0, v2}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {v1}, Ljava/util/AbstractCollection;->size()I

    move-result p1

    const/4 v0, 0x0

    :cond_17
    :goto_17
    const/4 v2, 0x3

    iget-object v3, p0, Lvpk;->a:Lzzh;

    iget-object v4, p0, Lvpk;->c:Lipk;

    if-ge v0, p1, :cond_44

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v0, v0, 0x1

    check-cast v5, Look;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-byte v6, v5, Look;->d:B

    if-ne v6, v2, :cond_17

    iget-object v2, v4, Lipk;->q:Lr8f;

    iget-object v4, v5, Look;->h:Ljava/lang/String;

    iget-object v2, v2, Lr8f;->b:Ljava/util/HashMap;

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Li7f;

    if-eqz v2, :cond_17

    new-instance v4, Lq8f;

    invoke-direct {v4, v5, v3}, Lq8f;-><init>(Look;Lzzh;)V

    invoke-virtual {v2, v4}, Li7f;->c(Ljava/lang/Object;)Z

    goto :goto_17

    :cond_44
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_48
    :goto_48
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_7a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Look;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-byte p2, p1, Look;->d:B

    if-ne p2, v2, :cond_48

    iget-object p2, v4, Lipk;->q:Lr8f;

    iget-object v0, p1, Look;->h:Ljava/lang/String;

    iget-object p2, p2, Lr8f;->b:Ljava/util/HashMap;

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Li7f;

    if-nez v1, :cond_71

    new-instance v1, Li7f;

    invoke-direct {v1}, Li7f;-><init>()V

    invoke-virtual {p2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_71
    new-instance p2, Lq8f;

    invoke-direct {p2, p1, v3}, Lq8f;-><init>(Look;Lzzh;)V

    invoke-virtual {v1, p2}, Li7f;->b(Ljava/lang/Object;)Z

    goto :goto_48

    :cond_7a
    return-void
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 11

    check-cast p1, Lkpk;

    iget-object v0, p1, Lk8;->a:Ljava/lang/Object;

    iget-object p1, p1, Lk8;->b:Ljava/lang/Object;

    check-cast p1, Lnpk;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const/4 v1, -0x1

    if-eqz p1, :cond_2b

    const/4 v2, 0x1

    if-ne p1, v2, :cond_18

    check-cast v0, Llpk;

    iget p1, p0, Lvpk;->e:I

    if-ne p1, v1, :cond_19

    :cond_18
    return-void

    :cond_19
    iput v1, p0, Lvpk;->e:I

    iget v1, p0, Lvpk;->f:I

    if-nez v1, :cond_25

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_27

    :cond_25
    iget-object v0, v0, Llpk;->c:Ljava/util/ArrayList;

    :goto_27
    invoke-virtual {p0, p1, v0}, Lvpk;->b(ILjava/util/List;)V

    return-void

    :cond_2b
    check-cast v0, Lmpk;

    iget p1, v0, Lmpk;->c:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    :goto_34
    add-int/lit8 v2, p1, -0x1

    if-lez p1, :cond_4f

    new-instance v3, Look;

    const-string p1, "https://www.opera.com?"

    invoke-static {v2, p1}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const/4 v5, 0x0

    const-string v8, ""

    const/16 v4, 0xb

    const-string v6, ""

    invoke-direct/range {v3 .. v8}, Look;-><init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move p1, v2

    goto :goto_34

    :cond_4f
    invoke-virtual {p0, v1, v0}, Lvpk;->b(ILjava/util/List;)V

    return-void
.end method
