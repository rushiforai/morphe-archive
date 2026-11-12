.class public abstract Lyf5;
.super Ld63;
.source "SourceFile"


# static fields
.field public static final $stable:I = 0x8


# instance fields
.field private final onShown:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public synthetic constructor <init>()V
    .registers 3

    new-instance v0, Lmf5;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lmf5;-><init>(B)V

    invoke-direct {p0, v0}, Lyf5;-><init>(Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method public constructor <init>(Lkotlin/jvm/functions/Function0;)V
    .registers 2

    .line 11
    invoke-direct {p0}, Ld63;-><init>()V

    .line 12
    iput-object p1, p0, Lyf5;->onShown:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public content(Lwf5;Lih5;I)V
    .registers 13

    check-cast p2, Lvt9;

    const v0, 0x74d2ca2a

    invoke-virtual {p2, v0}, Lvt9;->Y(I)Lvt9;

    invoke-virtual {p2, p1}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x4

    if-eqz v0, :cond_11

    move v0, v1

    goto :goto_12

    :cond_11
    const/4 v0, 0x2

    :goto_12
    or-int/2addr v0, p3

    invoke-virtual {p2, p0}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v2

    const/16 v3, 0x20

    if-eqz v2, :cond_1d

    move v2, v3

    goto :goto_1f

    :cond_1d
    const/16 v2, 0x10

    :goto_1f
    or-int/2addr v0, v2

    and-int/lit8 v2, v0, 0x13

    const/16 v4, 0x12

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eq v2, v4, :cond_2a

    move v2, v6

    goto :goto_2b

    :cond_2a
    move v2, v5

    :goto_2b
    and-int/lit8 v4, v0, 0x1

    invoke-virtual {p2, v4, v2}, Lvt9;->N(IZ)Z

    move-result v2

    if-eqz v2, :cond_77

    and-int/lit8 v2, v0, 0x70

    if-eq v2, v3, :cond_39

    move v4, v5

    goto :goto_3a

    :cond_39
    move v4, v6

    :goto_3a
    and-int/lit8 v0, v0, 0xe

    if-eq v0, v1, :cond_40

    move v7, v5

    goto :goto_41

    :cond_40
    move v7, v6

    :goto_41
    or-int/2addr v4, v7

    invoke-virtual {p2}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v7

    sget-object v8, Lhh5;->a:Lzpa;

    if-nez v4, :cond_4c

    if-ne v7, v8, :cond_55

    :cond_4c
    new-instance v7, Lx2;

    const/4 v4, 0x6

    invoke-direct {v7, p0, p1, v4}, Lx2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v7}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_55
    check-cast v7, Lkotlin/jvm/functions/Function0;

    if-eq v2, v3, :cond_5b

    move v2, v5

    goto :goto_5c

    :cond_5b
    move v2, v6

    :goto_5c
    if-eq v0, v1, :cond_5f

    move v6, v5

    :cond_5f
    or-int/2addr v2, v6

    invoke-virtual {p2}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v0

    if-nez v2, :cond_68

    if-ne v0, v8, :cond_71

    :cond_68
    new-instance v0, Lq3;

    const/4 v1, 0x5

    invoke-direct {v0, p0, p1, v1}, Lq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_71
    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-static {v7, v0, p2, v5}, Lyi4;->b(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lih5;I)V

    goto :goto_7a

    :cond_77
    invoke-virtual {p2}, Lvt9;->Q()V

    :goto_7a
    invoke-virtual {p2}, Lvt9;->r()Lznh;

    move-result-object p2

    if-eqz p2, :cond_87

    new-instance v0, Lfx0;

    invoke-direct {v0, p0, p1, p3, v5}, Lfx0;-><init>(Ljava/lang/Object;Ljava/lang/Object;IB)V

    iput-object v0, p2, Lznh;->d:Lkotlin/jvm/functions/Function2;

    :cond_87
    return-void
.end method

.method public createDialog(Landroid/content/Context;Lb2l;)Lrim;
    .registers 7
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    :goto_0
    const/4 p2, 0x0

    if-eqz p1, :cond_15

    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_a

    check-cast p1, Landroid/app/Activity;

    goto :goto_16

    :cond_a
    instance-of v0, p1, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_15

    check-cast p1, Landroid/content/ContextWrapper;

    invoke-virtual {p1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p1

    goto :goto_0

    :cond_15
    move-object p1, p2

    :goto_16
    if-nez p1, :cond_19

    return-object p2

    :cond_19
    new-instance p2, Lxf5;

    invoke-direct {p2, p0}, Lxf5;-><init>(Lyf5;)V

    new-instance v0, Ltf5;

    iget-object v1, p0, Lyf5;->onShown:Lkotlin/jvm/functions/Function0;

    new-instance v2, Lfx0;

    const/16 v3, 0x10

    invoke-direct {v2, p0, p2, v3}, Lfx0;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lue5;

    const p2, -0xbd509f4

    const/4 v3, 0x1

    invoke-direct {p0, p2, v2, v3}, Lue5;-><init>(ILjava/lang/Object;Z)V

    invoke-direct {v0, p1, v1, p0}, Ltf5;-><init>(Landroid/app/Activity;Lkotlin/jvm/functions/Function0;Lue5;)V

    return-object v0
.end method
