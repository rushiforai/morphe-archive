.class public final Lrs5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpuj;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lpuj;

    invoke-direct {v0}, Lpuj;-><init>()V

    iput-object v0, p0, Lrs5;->a:Lpuj;

    return-void
.end method

.method public static b(Lrs5;Lkotlin/jvm/functions/Function2;Lue5;Lkotlin/jvm/functions/Function0;I)V
    .registers 6

    and-int/lit8 p4, p4, 0x8

    if-eqz p4, :cond_5

    const/4 p2, 0x0

    :cond_5
    iget-object p4, p0, Lrs5;->a:Lpuj;

    new-instance v0, Ll5c;

    invoke-direct {v0, p1, p0, p2, p3}, Ll5c;-><init>(Lkotlin/jvm/functions/Function2;Lrs5;Lcr9;Lkotlin/jvm/functions/Function0;)V

    new-instance p0, Lue5;

    const p1, -0x6aa64e33

    const/4 p2, 0x1

    invoke-direct {p0, p1, v0, p2}, Lue5;-><init>(ILjava/lang/Object;Z)V

    invoke-virtual {p4, p0}, Lpuj;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final a(Lis5;Lih5;I)V
    .registers 10

    check-cast p2, Lvt9;

    const v0, -0x2f9828e7

    invoke-virtual {p2, v0}, Lvt9;->Y(I)Lvt9;

    invoke-virtual {p2, p1}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x4

    goto :goto_11

    :cond_10
    const/4 v0, 0x2

    :goto_11
    or-int/2addr v0, p3

    invoke-virtual {p2, p0}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    const/16 v1, 0x20

    goto :goto_1d

    :cond_1b
    const/16 v1, 0x10

    :goto_1d
    or-int/2addr v0, v1

    and-int/lit8 v1, v0, 0x13

    const/16 v2, 0x12

    const/4 v3, 0x0

    if-eq v1, v2, :cond_27

    const/4 v1, 0x1

    goto :goto_28

    :cond_27
    move v1, v3

    :goto_28
    and-int/lit8 v2, v0, 0x1

    invoke-virtual {p2, v2, v1}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_4a

    iget-object v1, p0, Lrs5;->a:Lpuj;

    invoke-virtual {v1}, Lpuj;->size()I

    move-result v2

    :goto_36
    if-ge v3, v2, :cond_4d

    invoke-virtual {v1, v3}, Lpuj;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcr9;

    and-int/lit8 v5, v0, 0xe

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, p1, p2, v5}, Lcr9;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_36

    :cond_4a
    invoke-virtual {p2}, Lvt9;->Q()V

    :cond_4d
    invoke-virtual {p2}, Lvt9;->r()Lznh;

    move-result-object p2

    if-eqz p2, :cond_5c

    new-instance v0, Lfx0;

    const/16 v1, 0x13

    invoke-direct {v0, p0, p1, p3, v1}, Lfx0;-><init>(Ljava/lang/Object;Ljava/lang/Object;IB)V

    iput-object v0, p2, Lznh;->d:Lkotlin/jvm/functions/Function2;

    :cond_5c
    return-void
.end method
