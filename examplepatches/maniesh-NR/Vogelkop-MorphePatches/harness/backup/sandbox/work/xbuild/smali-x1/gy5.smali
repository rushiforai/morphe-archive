.class public final synthetic Lgy5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldr9;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Lkotlin/jvm/functions/Function1;

.field public final synthetic c:Lafe;

.field public final synthetic d:Lafe;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Lkotlin/jvm/functions/Function1;Lafe;Lafe;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgy5;->a:Ljava/util/List;

    iput-object p2, p0, Lgy5;->b:Lkotlin/jvm/functions/Function1;

    iput-object p3, p0, Lgy5;->c:Lafe;

    iput-object p4, p0, Lgy5;->d:Lafe;

    return-void
.end method


# virtual methods
.method public final j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    check-cast p1, Ly4c;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p1

    check-cast p3, Lih5;

    check-cast p4, Ljava/lang/Integer;

    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result p2

    and-int/lit8 p4, p2, 0x30

    if-nez p4, :cond_23

    move-object p4, p3

    check-cast p4, Lvt9;

    invoke-virtual {p4, p1}, Lvt9;->d(I)Z

    move-result p4

    if-eqz p4, :cond_20

    const/16 p4, 0x20

    goto :goto_22

    :cond_20
    const/16 p4, 0x10

    :goto_22
    or-int/2addr p2, p4

    :cond_23
    and-int/lit16 p4, p2, 0x91

    const/16 v0, 0x90

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq p4, v0, :cond_2d

    move p4, v2

    goto :goto_2e

    :cond_2d
    move p4, v1

    :goto_2e
    and-int/2addr p2, v2

    check-cast p3, Lvt9;

    invoke-virtual {p3, p2, p4}, Lvt9;->N(IZ)Z

    move-result p2

    if-eqz p2, :cond_69

    iget-object p2, p0, Lgy5;->a:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Ley5;

    iget-object v3, p0, Lgy5;->b:Lkotlin/jvm/functions/Function1;

    invoke-virtual {p3, v3}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result p1

    invoke-virtual {p3, v4}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result p2

    or-int/2addr p1, p2

    invoke-virtual {p3}, Lvt9;->K()Ljava/lang/Object;

    move-result-object p2

    if-nez p1, :cond_55

    sget-object p1, Lhh5;->a:Lzpa;

    if-ne p2, p1, :cond_63

    :cond_55
    new-instance v2, Li51;

    const/4 v7, 0x6

    iget-object v5, p0, Lgy5;->c:Lafe;

    iget-object v6, p0, Lgy5;->d:Lafe;

    invoke-direct/range {v2 .. v7}, Li51;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p3, v2}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object p2, v2

    :cond_63
    check-cast p2, Lkotlin/jvm/functions/Function0;

    invoke-static {v4, p2, p3, v1}, Lky5;->a(Ley5;Lkotlin/jvm/functions/Function0;Lih5;I)V

    goto :goto_6c

    :cond_69
    invoke-virtual {p3}, Lvt9;->Q()V

    :goto_6c
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
